<?php

namespace Library\Auth;

use Library\Common;
use Phalcon\Mvc\User\Component;
use Models\User;
use Models\Users\SuccessLogins;
use Models\Users\FailedLogins;

class Auth extends Component
{
    /**
     * Checks the user credentials
     *
     * @param  array  $credentials
     * @return boolan
     */
    public function check($credentials)
    {
        $user = User::findFirstByEmail($credentials['email']);
        if($user == false)
        {
            //$this->registerUserThrottling(0);
            return false;
        }
        //check the password
        if(!$this->security->checkHash($credentials['password'] , $user->password))
        {
            return false;
        }

        // Check if the user was flagged
        if (false === $user->isActive()) {
            return false;
        }

        $this->setIdentity($user);
        return true;
    }


    /**
     * Set identity in session
     *
     * @param object $user
     */
    private function setIdentity($user)
    {
        $st_identity = $user->toArray();
        unset($st_identity['password']);

        $this->session->set('auth-identity', $st_identity);
    }


    /**
     * Checks if the user is banned/inactive/suspended
     *
     * @param Models\User $user
     *
     */
    public function checkUserFlags(User $user)
    {

    }



    /**
     * Creates the remember me environment settings the related cookies and generating tokens
     *
     * @param Models\User $user
     */
    public function createRememberEnviroment(User $user)
    {
        $user_agent = $this->request->getUserAgent();
        $token = md5($user->getEmail() . $user->getPassword() . $user_agent);
        $remember = new RememberTokens();
        $remember->setUserId($user->getId());
        $remember->setToken($token);
        $remember->setUserAgent($user_agent);
        $remember->setCreatedAt(time());

        if ($remember->save() != false) {
            $expire = time() + 86400 * 30;
            $this->cookies->set('RMU', $user->getId(), $expire);
            $this->cookies->set('RMT', $token, $expire);
        }
    }

    /**
     * Check if the session has a remember me cookie
     *
     * @return boolean
     */
    public function hasRememberMe()
    {
        return $this->cookies->has('RMU');
    }

    /**
     * Logs on using the information in the coookies
     *
     * @return Phalcon\Http\Response
     */
    public function loginWithRememberMe()
    {
        $userId = $this->cookies->get('RMU')->getValue();
        $cookieToken = $this->cookies->get('RMT')->getValue();
        $user = User::findFirstById($userId);
        if($user)
        {
            $userAgent = $this->request->getUserAgent();
            $token = md5($user->email . $user->getPassword() . $userAgent);

            if ($cookieToken == $token)
            {
                $remember = RememberTokens::findFirst(array(
                    'users_id = ?0 AND token = ?1',
                    'bind' => array(
                        $user->getId(),
                        $token
                    )
                ));

                if($remember)
                {
                    // Check if the cookie has not expired
                    if ((time() - (86400 * 8)) < $remember->createdAt) {

                        // Check if the user was flagged
                        $this->checkUserFlags($user);

                        // Register identity
                        $this->session->set('auth-identity', array(
                            'id' => $user->getId(),
                            'name' => $user->getName(),
                            'group' => $user->group->getName()
                        ));

                        // Register the successful login
                        $this->saveSuccessLogin($user);

                        return $this->response->redirect('users');
                    }
                }
            }
        }
        $this->cookies->get('RMU')->delete();
        $this->cookies->get('RMT')->delete();

        return $this->response->redirect('session/login');

    }


    /**
     * Returns the current identity
     *
     * @return array
     */
    public function getIdentity()
    {
        return $this->session->get('auth-identity');
    }

    /**
     * Returns the name of the user
     *
     * @return string
     */
    public function getUserName()
    {
        $identity = $this->session->get('auth-identity');

        return isset($identity['username']) ? $identity['username'] : false;
    }

    public function getAvatar()
    {
        $identity = $this->session->get('auth-identity');

        return isset($identity['avatar']) ? $identity['avatar'] : $this->constant->pathNoAvatar;
    }
    /**
     * Returns the name of the user
     *
     * @return string
     */
    public function getName()
    {
        $identity = $this->session->get('auth-identity');

        return isset($identity['name']) ? $identity['name'] : false;
    }

    /**
     * Returns the id of the user
     *
     * @return string
     */
    public function getUserId()
    {
        $identity = $this->session->get('auth-identity');

        return isset($identity['id']) ? $identity['id'] : false;
    }

    /**
     * Removes the user identity information from session
     */
    public function remove()
    {
        if ($this->cookies->has('RMU')) {
            $this->cookies->get('RMU')->delete();
        }
        if ($this->cookies->has('RMT')) {
            $this->cookies->get('RMT')->delete();
        }

        $this->session->remove('auth-identity');
    }

    /**
     * Auths the user by his/her id
     *
     * @param int $id
     */
    public function authUserById($id)
    {
        $user = User::findFirstById($id);
        if ($user == false) {
            throw new Exception('The user does not exist');
        }

        $this->checkUserFlags($user);
        $this->setIdentity($user);
    }


    /**
     * Get the entity related to user in the active identity
     *
     * @return \Vokuro\Models\User
     */
    public function getUser()
    {
        $identity = $this->session->get('auth-identity');
        if (isset($identity['id'])) {

            $user = User::findFirstById($identity['id']);
            if ($user == false) {
                throw new Exception('The user does not exist');
            }

            return $user;
        }

        return false;
    }

    /**
     * Check if the user is signed in
     *
     * @return boolean
     */
    public function isUserSignedIn()
    {
        $identity = $this->getIdentity();

        if (is_array($identity)) {
            if (isset($identity['id'])) {
                return true;
            }
        }
        return false;
    }

    /**
     * Generate a random password
     *
     * @param  integer $length
     * @return string
     */
    public function generatePassword($length = 8)
    {
        $chars = "abcdefghijklmnpqrstuvwxyzABCDEFGHIJKLMNPQRSTUVWXYZ123456789#@%_.";

        return substr(str_shuffle($chars),0,$length);
    }

} 