<?php

namespace Frontend\Modules\Dept;

use Phalcon\Loader;
use Phalcon\Mvc\View;
use Phalcon\Mvc\View\Engine\Volt as VoltEngine;
use Phalcon\Mvc\ModuleDefinitionInterface;


class Module implements ModuleDefinitionInterface
{

    // Version 3.0: \Phalcon \ DiInterface
    // Version 4.0 => \Phalcon \ Di\ DiInterface
    public function registerAutoloaders(\Phalcon\DiInterface $dependencyInjector = null)
    {
        $loader = new Loader();

        $loader->registerNamespaces(array(
            'Frontend\Modules\Dept\Controllers' => __DIR__ . '/controllers/',
            'Frontend\Modules\Dept\Models' => __DIR__ . '/models/',
            'Frontend\Modules\Dept\Forms' => __DIR__ . '/forms/',
        ));
        $loader->register();
    }

    public function registerServices(\Phalcon\DiInterface $di)
    {
        $di['view'] = function () {
            $config = include APP_DIR . '/configs/config.php';
            $view = new View();
            $view->setViewsDir(__DIR__ . '/views/');
            $view->setLayoutsDir('../../../layouts/default/');
            $view->setPartialsDir('../../../layouts/default/partials/');
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
            $dispatcher->setDefaultNamespace("Frontend\Modules\Dept\Controllers\\");
            return $dispatcher;
        });

    }
}