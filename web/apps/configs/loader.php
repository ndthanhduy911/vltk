<?php
$loader = new \Phalcon\Loader();

/**
 * We're a registering a set of directories taken from the configuration file
 */
$loader->registerDirs([
    LIB_DIR . '/models'
]);

$loader->registerNamespaces(array(
    'Library'   => LIB_DIR . '/',
));

// Register some classes
$loader->registerClasses(
    array(
        "BackendController"         => LIB_DIR . '/controllers/BackendController.php',
        "FrontendController"        => LIB_DIR . '/controllers/FrontendController.php',
    )
);

// $loader->registerFiles([
// 	LIB_DIR . '/vendor/autoload.php'
// ]);

$loader->register();