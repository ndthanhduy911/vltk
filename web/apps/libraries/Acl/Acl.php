<?php
namespace Library\Acl;

use Models\Users\Groups;
use Phalcon\Mvc\User\Component;
use Phalcon\Acl\Adapter\Memory as AclMemory;
use Phalcon\Acl\Role as AclRole;
use Phalcon\Acl\Resource as AclResource;
use Models\Users\UsersGroups;
use Models\Users\PermissionResource;
use Models\Users\PermissionAction;
use Models\Users\PermissionResourceAction;

class Acl extends Component
{
	/**
     * The ACL Object
     *
     * @var \Phalcon\Acl\Adapter\Memory
     */
    private $acl;

    /**
     * The filepath of the ACL cache file from APP_DIR
     *
     * @var string
     */
    private $filePath = '/cache/acl/data.txt';

    /**
     * Define the resources that are considered "private". These controller => actions require authentication.
     *
     * @var array
     */
    private $privateResources = array(
        'user' => array(
            'index',
            'search',
            'edit',
            'create',
            'delete',
            'profile',
            'logout',
            'changePassword',
        ),

        'user-groups' => array(
            'index',
            'search',
            'edit',
            'create',
            'delete',
        ),
        'news' => array(
            'index',
            'search',
            'edit',
            'create',
            'delete',
            'hotnews',
            'authoredit',
            'clearcache'
        ),
        'category' => array(
            'index',
            'search',
            'edit',
            'create',
            'delete',
        ),
    );
    /**
     * Human-readable descriptions of the actions used in {@see $privateResources}
     *
     * @var array
     */
    private $actionDescriptions = array(
        'index' => 'View',
        'search' => 'Search',
        'create' => 'Create',
        'edit' => 'Edit',
        'delete' => 'Delete',
        'view'   => 'Preview',
        'changePassword' => 'Change password',
        'updateStatus' => 'Update status',
        'updateStatusAll' => 'Update all',
        'statistic' => 'Stastistic',
        'clearCache' => 'Clear cache',
        'preview'   => 'Preview'
    );

    /**
     * Checks if a controller is private or not
     *
     * @param string $controllerName
     * @return boolean
     */
    public function isPrivate($controllerName)
    {        
        return isset($this->privateResources[$controllerName]);
    }

    /**
     * Checks if the current profile is allowed to access a resource
     *
     * @param string $profile
     * @param string $controller
     * @param string $action
     * @return boolean
     */
    public function isAllowed($group, $controller, $action)
    {
        if(is_object($this->getAcl()))
        {
            return $this->getAcl()->isAllowed($group, $controller, $action);
        }
        return false;
    }

    /**
     * Returns the ACL list
     *
     * @return Phalcon\Acl\Adapter\Memory
     */
    public function getAcl()
    {
        // Check if the ACL is already created
        if (is_object($this->acl)) {
            return $this->acl;
        }
        // Check if the ACL is in APC
//        if (function_exists('apc_fetch')) {
//            $acl = apc_fetch('javhd-acl');
//            if (is_object($acl)) {
//                $this->acl = $acl;
//                return $acl;
//            }
//        }
        
        // Check if the ACL is already generated
        //if (!file_exists(APP_DIR . $this->filePath)) {
            $this->acl = $this->rebuild();
            return $this->acl;
        //}

        // Get the ACL from the data file
//        $data = file_get_contents(APP_DIR . $this->filePath);
//        $this->acl = unserialize($data);

//        // Store the ACL in APC
//        if (function_exists('apc_store')) {
//            apc_store('javhd-acl', $this->acl);
//        }
       
//        return $this->acl;
    }

    /**
     * Returns the permissions assigned to a profile
     *
     * @param Profiles $profile
     * @return array
     */
    
    public function getPermissions(Groups $group)
    {        
        $permissions = array();
        foreach ($group->getPermissions() as $permission) {
            $permissions[$permission->getResource() . '.' . $permission->getAction()] = true;
        }
        return $permissions;
    }

    /**
     * Returns all the resoruces and their actions available in the application
     *
     * @return array
     */
    public function getResources()
    {
        return $this->privateResources;
        /*$permissionResource = PermissionResource::find();
        $data = array();
        foreach($permissionResource as $resource)
        {
            $action = $this->modelsManager->createBuilder()
                ->from(array('action' => '\Models\Users\PermissionAction'))
                ->groupBy("action.id")
                ->join('\Models\Users\PermissionResourceAction' , 'resourceAction.action_id = action.id' , 'resourceAction')
                ->where("resourceAction.resource_id = :resource_id:" , array('resource_id' => $resource->getId()))
                ->orderBy('action.id')
                ->getQuery()
                ->execute();
            $resource->action = $action;
            $data[] = $resource;//$action;//->toArray();
        }
        return $data;*/
    }

    /**
     * Returns the action description according to its simplified name
     *
     * @param string $action
     * @return $action
     */
    public function getActionDescription($action)
    {       
        if (isset($this->actionDescriptions[$action])) {
            return $this->actionDescriptions[$action];
        } else {
            return $action;
        }
    }

    /**
     * Rebuilds the access list into a file
     *
     * @return \Phalcon\Acl\Adapter\Memory
     */
    public function rebuild()
    {
        $acl = new AclMemory();

        $acl->setDefaultAction(\Phalcon\Acl::DENY);

        // Register roles
        $groups = Groups::find('publish = 1');

        foreach ($groups as $group) {
            $acl->addRole(new AclRole($group->name));
        }

        foreach ($this->privateResources as $resource => $actions) {
            $acl->addResource(new AclResource($resource), $actions);
        }
      
        // Grant acess to private area to role Users
        foreach ($groups as $group) {
            // Grant permissions in "permissions" model
            
            foreach ($group->getPermissions() as $permission) {            	
                $acl->allow($group->name, $permission->getResource(), $permission->getAction());
            }

            // Always grant these permissions
            $acl->allow($group->name, 'user', 'changePassword');
            $acl->allow($group->name, 'user', 'profile');
            $acl->allow($group->name, 'user', 'logout');
        }

        if (touch(APP_DIR . $this->filePath) && is_writable(APP_DIR . $this->filePath)) {

            file_put_contents(APP_DIR . $this->filePath, serialize($acl));

            // Store the ACL in APC
            if (function_exists('apc_store')) {
                apc_store('vietgiaitri-acl', $acl);
            }
        } else {
            $this->flash->error(
                'The user does not have write permissions to create the ACL list at ' . APP_DIR . $this->filePath
            );
        }

        return $acl;
    }
}