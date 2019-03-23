<?php

namespace Backend\Modules\Dashboard;

use Phalcon\Loader;
use Phalcon\Mvc\View;
use Phalcon\Mvc\View\Engine\Volt as VoltEngine;
use Phalcon\Db\Adapter\Pdo\Mysql as DbAdapter;
use Phalcon\Mvc\ModuleDefinitionInterface;


class Module implements ModuleDefinitionInterface
{
    /**
     * Registers the module auto-loader
     */
    public function registerAutoloaders(\Phalcon\DiInterface $dependencyInjector = null) // <- here it is
    {
        $loader = new Loader();

        $loader->registerNamespaces(array(
            'Backend\Modules\Dashboard\Controllers' => __DIR__ . '/controllers/',
            'Backend\Modules\Dashboard\Models' => __DIR__ . '/models/',
            'Backend\Modules\Dashboard\Forms' => __DIR__ . '/forms/',
        ));
        $loader->register();
    }

    /**
     * Registers the module-only services
     *
     * @param Phalcon\DI $di
     */
    public function registerServices(\Phalcon\DiInterface $di)
    {
        /**
         * Read configuration
         */
        //$config = include APP_DIR . "/config/config.php";
        //$config = include APP_DIR . '/config/config.php';
        /**
         * Setting up the views component
         */

        $di['view'] = function () {
            $config = include APP_DIR . '/configs/config.php';
            $view = new View();
            $view->setViewsDir(__DIR__ . '/views/');
            $view->setLayoutsDir('../../../layouts/' . $config->application->backendTheme . '/');
            $view->setPartialsDir('../../../layouts/' . $config->application->backendTheme . '/partials/');
            $view->setTemplateAfter('layout');

            $view->registerEngines(array(
                '.volt' => function ($view, $di) use ($config) {

                    $volt = new VoltEngine($view, $di);

                    $volt->setOptions(array(
                        'compiledPath' => $config->application->cacheDir."views/",
                        'compiledSeparator' => '_'
                    ));

                    return $volt;
                },
                '.phtml' => 'Phalcon\Mvc\View\Engine\Php'
            ));
            return $view;
        };

        $di->set('dispatcher' , function(){
            $dispatcher = new \Phalcon\Mvc\Dispatcher();
            $dispatcher->setDefaultNamespace("Backend\Modules\Dashboard\Controllers\\");
            return $dispatcher;
        });
    }
}