<?php

namespace Frontend\Modules\Api;

use Phalcon\Loader;
use Phalcon\Mvc\View;
use Phalcon\Mvc\View\Engine\Volt as VoltEngine;
use Phalcon\Mvc\ModuleDefinitionInterface;

class Module implements ModuleDefinitionInterface
{
    /**
     * Registers the module auto-loader
     */
    // Version 3.0: \Phalcon\DiInterface
    // Version 4.0 => \Phalcon\DiInterface
    public function registerAutoloaders(\Phalcon\DiInterface $dependencyInjector = null)
    {
        $loader = new Loader();

        $loader->registerNamespaces(array(
            'Frontend\Modules\Api\Controllers' => __DIR__ . '/controllers/',
            'Frontend\Modules\Api\Models' => __DIR__ . '/models/',
            'Frontend\Modules\Api\Forms' => __DIR__ . '/forms/',
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
         * Setting up the views component
         */

        $di['view'] = function () {
            $config = include APP_DIR . '/configs/config.php';
            $view = new View();
            $view->setViewsDir(__DIR__ . '/views/');
            $view->setLayoutsDir('../../../layouts/' . $config->application->frontendTheme . '/');
            $view->setPartialsDir('../../../layouts/' . $config->application->frontendTheme . '/partials/');
            $view->setTemplateAfter('layout');

            $view->registerEngines(array(
                '.volt' => function ($view) use ($config) {

                    $volt = new VoltEngine($view);

                    $volt->setOptions(array(
                        'compiledPath' => $config->application->cacheDir."views/", //Version: 3.0
                        'compiledSeparator' => '_', //Version: 3.0
                        // 'path' => $config->application->cacheDir."views/", //Version: 4.0
                        // 'separator' => '_' //Version: 4.0
                    ));

                    return $volt;
                },
                '.phtml' => 'Phalcon\Mvc\View\Engine\Php'
            ));
            return $view;
        };

        $di->set('dispatcher' , function(){
            $dispatcher = new \Phalcon\Mvc\Dispatcher();
            $dispatcher->setDefaultNamespace("Frontend\Modules\Api\Controllers\\");
            return $dispatcher;
        });

    }
}