<?php
$loader = new \Phalcon\Loader();

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
        "LayoutsController"        => LIB_DIR . '/controllers/LayoutsController.php',
        "AdminsLangCore"        => LIB_DIR . '/controllers/AdminsLangCore.php',
        "AdminsCore"        => LIB_DIR . '/controllers/AdminsCore.php'
    )
);

$loader->registerFiles([
	LIB_DIR . '/vendor/autoload.php',
    LIB_DIR . '/elFinder/autoload.php'
]);

$loader->register();