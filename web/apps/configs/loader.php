<?php
$loader = new \Phalcon\Loader();

/**
 * We're a registering a set of directories taken from the configuration file
 */

$loader->registerNamespaces(array(
    'Library' => LIB_DIR . '/',
    'Library\Auth' => LIB_DIR . '/auth/',
    'Library\Constant' => LIB_DIR . '/constant/',
    'Base\Forms' => LIB_DIR . '/forms/',
    'Library\Pagination' => LIB_DIR . '/Pagination/',
    'Library\Paginator' => LIB_DIR . '/Paginator/',
    'Models' => LIB_DIR . '/models',
));

// Register some classes
$loader->registerClasses(
    array(
        "BackendController"         => LIB_DIR . '/controllers/BackendController.php',
        "FrontendController"         => LIB_DIR . '/controllers/FrontendController.php',
        "NewsBaseController"         => LIB_DIR . '/controllers/NewsBaseController.php',
        "PHPExcel"                  => LIB_DIR . '/PHPExcel/Classes/PHPExcel.php',
        "PHPExcel_IOFactory"                  => LIB_DIR . '/PHPExcel/Classes/PHPExcel/IOFactory.php',
    )
);

$loader->registerDirs(
    array(
        LIB_DIR . '/',
    ));

$loader->register();