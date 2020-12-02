<?php
declare(strict_types=1);
use Library\ML\ML;

// use Phalcon\Session\Adapter\Files as SessionManager;//Version 3.0
use Phalcon\Session\Manager as SessionManager;//Version 4.0
use Phalcon\Session\Adapter\Stream as SessionAdapter;//Version 4.0
use Phalcon\Escaper;//Version 4.0
use Phalcon\Flash\Direct as Flash;//Version 4.0
use Phalcon\Flash\Session as FlashSession;//Version 4.0

$di = new \Phalcon\DI\FactoryDefault();

$di->set('config', $config);

$di->set('router', function () use ($config) {
    return require __DIR__ . '/routes.php';
});
/**
 * The URL component is used to generate all kind of urls in the application
 */
$di->setShared('url', function () use ($config) {
    // $url = new \Phalcon\Mvc\Url(); //Version 3.0
    $url = new \Phalcon\Url(); //Version 4.0
    $url->setBaseUri($config->application->baseUri);
    return $url;
});


$di->set(
    'db',
    function () use ($config) {
        $connection = new \Phalcon\Db\Adapter\Pdo\Mysql($config->database->toArray());
        return $connection;
    }
);
/**
 * If the configuration specify the use of metadata adapter use it or use memory otherwise
 */
$di->set(
    'modelsMetadata',
    function () use ($config) {

        if (DEBUG == TRUE) {
            return new \Phalcon\Mvc\Model\Metadata\Memory();
        }

        return new \Phalcon\Mvc\Model\Metadata\Files([
            'metaDataDir' => $config->application->cacheDir  . 'metaData/'
        ]);

    },
    true
);

//Version 3.0:
// $di->setShared('session', function () {
//     $session = new SessionManager();
//     $session->start();
//     return $session;
// });

//Version 4.0:
$di->setShared('session', function () {
    $session = new SessionManager();
    $files = new SessionAdapter([
        'savePath' => sys_get_temp_dir(),
    ]);
    $session->setAdapter($files);
    $session->start();

    return $session;
});

$di->set('cookies', function() {
    $cookies = new \Phalcon\Http\Response\Cookies();
    $cookies->useEncryption(false);
    return $cookies;
});

/**
 * Flash service with custom CSS classes
 */
//Version 3.0
// $di->setShared('flash', function () {
//     return new \Phalcon\Flash\Direct([
//         'error'   => 'alert alert-danger',
//         'success' => 'alert alert-success',
//         'notice'  => 'alert alert-info',
//         'warning' => 'alert alert-warning'
//     ]);
// });
//Version 4.0
$di->set('flash', function () {
    $escaper = new Escaper();
    $flash = new Flash($escaper);
    $flash->setImplicitFlush(false);
    $flash->setCssClasses([
        'error'   => 'alert alert-danger',
        'success' => 'alert alert-success',
        'notice'  => 'alert alert-info',
        'warning' => 'alert alert-warning'
    ]);

    return $flash;
});
//Version 3.0
// $di->setShared('flashSession', function () {
//     return new \Phalcon\Flash\Session([
//         'error'   => 'alert alert-danger',
//         'success' => 'alert alert-success',
//         'notice'  => 'alert alert-info',
//         'warning' => 'alert alert-warning'
//     ]);
// });
//Version 4.0
$di->setShared('flashSession', function () {
    $escaper = new Escaper();
    $flash = new FlashSession($escaper);
    $flash->setImplicitFlush(false);
    $flash->setCssClasses([
        'error'   => 'alert alert-danger',
        'success' => 'alert alert-success',
        'notice'  => 'alert alert-info',
        'warning' => 'alert alert-warning'
    ]);

    return $flash;
});
/**
 * Cache
 */
$di->set('modelsCache', function() use($config)
{
    //Cache data for one day by default
    $frontCache = new \Phalcon\Cache\Frontend\Data(array(
        "lifetime" => 86400
    ));

    $cache = new \Phalcon\Cache\Backend\File(
        $frontCache,
        array(
            "cacheDir" => $config->application->cacheDir
        )
    );
    return $cache;
});
/**
 * Cache
 */
$di->set('viewCache', function() use($config)
{
    //Cache data for one day by default
    $frontCache = new \Phalcon\Cache\Frontend\Data(array(
        "lifetime" => 86400
    ));

    $cache = new \Phalcon\Cache\Backend\File(
        $frontCache,
        array(
            "cacheDir" => $config->application->cacheDir
        )
    );
    return $cache;

});
$di->set('modelsManager', function() {
    return new \Phalcon\Mvc\Model\Manager();
});

$di->setShared(
    "helper",
    function() {
        return new \Library\Helper\Helper();
    }
);

$di->set(
    "ssp",
    function() {
        return new \Library\SSP\SSP();
    }
);

$di->setShared(
    "master",
    function() {
        return new \Library\Master\Master();
    }
);


$di->setShared(
    "ml",
    function() {
        return new ML();
    }
);
