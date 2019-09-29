<?php

use Phalcon\DI\FactoryDefault;
use Phalcon\Mvc\Url as UrlResolver;
use Phalcon\Db\Adapter\Pdo\Mysql as DbAdapter;
use Phalcon\Mvc\Model\Metadata\Files as MetaDataAdapter;
use Phalcon\Mvc\Model\Metadata\Memory as MemoryMetaDataAdapter;
use Phalcon\Session\Adapter\Files as SessionAdapter;
use Phalcon\Flash\Direct as Flash;
use Phalcon\Mvc\Collection\Manager as CollectionManager;
use Library\Helper\Helper as Helper;
use Library\SSP\SSP as SSP;
use Library\ML\ML as ML;
use Library\RoleMaster\RoleMaster as RoleMaster;
use Library\LogManager\LogManager as LogManager;


date_default_timezone_set("Asia/Bangkok");

$di = new FactoryDefault();

$di->set('config', $config);

//$config->application->debug = false;
/**
 * Loading routes from the routes.php file
 */

$di->set('router', function () use ($config) {
    return require __DIR__ . '/routes.php';
});
/**
 * The URL component is used to generate all kind of urls in the application
 */
$di->set('url', function () use ($config) {
    $url = new UrlResolver();
    $url->setBaseUri($config->application->baseUri);
    return $url;
}, true);


$di->set(
    'db',
    function () use ($config) {

        $connection = new DbAdapter($config->database->toArray());
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
            return new MemoryMetaDataAdapter();
        }

        return new MetaDataAdapter(array(
            'metaDataDir' => $config->application->cacheDir  . 'metaData/'
        ));

    },
    true
);

/**
 * Start the session the first time some component request the session service
 */
$di['session'] = function () {
    $session = new SessionAdapter();
    $session->start();

    return $session;
};

$di->set('cookies', function() {
    $cookies = new Phalcon\Http\Response\Cookies();
    $cookies->useEncryption(false);
    return $cookies;
});

/**
 * Flash service with custom CSS classes
 */
$di->set('flash', function () {
    $flash = new Flash(
        array(
            'error'   => 'alert bg-danger',
            'success' => 'alert bg-success',
            'notice'  => 'alert bg-info',
            'warning' => 'alert bg-warning'
        )
    );
    return $flash;
});

/**
 * Register the session flash service with the Twitter Bootstrap classes
 */
$di->set(
    'flashSession',
    function () {
        return new Phalcon\Flash\Session(array(
            'error'   => 'alert bg-danger text-white',
            'success' => 'alert bg-success text-white',
            'notice'  => 'alert bg-info text-white',
        ));
    }
);
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


//Collection manager
$di['collectionManager'] = function() {
        return new CollectionManager();
};

/*
 * Helper
 */
$di->set('helper',function(){
    return new Helper();
});

$di->set(
    "ssp",
    function() {
        return new SSP();
    }
);

$di->set(
    "rmt",
    function() {
        return new RoleMaster();
    }
);

$di->set(
    "ml",
    function() {
        return new ML();
    }
);

$di->set(
    "logs",
    function() {
        return new LogManager();
    }
);
