<?php
use Library\ML\ML;

date_default_timezone_set(TIMEZONE);

$di = new \Phalcon\DI\FactoryDefault();

$di->set('config', $config);

$di->set('router', function () use ($config) {
    return require __DIR__ . '/routes.php';
});
/**
 * The URL component is used to generate all kind of urls in the application
 */
$di->set('url', function () use ($config) {
    $url = new \Phalcon\Mvc\Url();
    $url->setBaseUri($config->application->baseUri);
    return $url;
}, true);


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

/**
 * Start the session the first time some component request the session service
 */
$di->setShared('session', function () {
    $session = new \Phalcon\Session\Adapter\Files();
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
$di->setShared('flash', function () {
    return new \Phalcon\Flash\Direct([
        'error'   => 'alert alert-danger',
        'success' => 'alert alert-success',
        'notice'  => 'alert alert-info',
        'warning' => 'alert alert-warning'
    ]);
});

/**
 * Register the session flash service with the Twitter Bootstrap classes
 */
$di->setShared('flashSession', function () {
    return new \Phalcon\Flash\Session([
        'error'   => 'alert alert-danger',
        'success' => 'alert alert-success',
        'notice'  => 'alert alert-info',
        'warning' => 'alert alert-warning'
    ]);
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


$di->set(
    "ml",
    function() {
        return new ML();
    }
);
