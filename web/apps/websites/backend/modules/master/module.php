<?php
namespace Backend\Modules\Master;
class Module implements \Phalcon\Mvc\ModuleDefinitionInterface
{
    /**
     * Registers the module auto-loader
     */
    // Version 3.0: \Phalcon\DiInterface
    // Version 4.0 => \Phalcon\Di\DiInterface
    public function registerAutoloaders(\Phalcon\Di\DiInterface $dependencyInjector = null)
    {
        $loader = new \Phalcon\Loader();
        $loader->registerNamespaces(array(
            'Backend\Modules\Master\Controllers' => __DIR__ . '/controllers/',
            'Backend\Modules\Master\Forms' => __DIR__ . '/forms/',
        ));
        $loader->register();
    }

    /**
     * Registers the module-only services
     *
     * @param Phalcon\DI $di
     */
    public function registerServices(\Phalcon\Di\DiInterface $di)
    {
        $di->set('view', function () use($di) {
            $config = $di->getConfig();
            $view = new View();
            $view->setViewsDir(__DIR__ . '/views/');
            $view->setLayoutsDir('../../../layouts/' . $config->application->backendTheme . '/');
            $view->setPartialsDir('../../../layouts/' . $config->application->backendTheme . '/partials/');
            $view->setTemplateAfter('layout');
        
            $view->registerEngines(array(
                '.volt' => function ($view) use ($config,$di) {
                    $volt = new VoltEngine($view,$di);
                    $volt->setOptions(array(
                        // 'compiledPath' => $config->application->cacheDir."views/", //Version 3.0
                        // 'compiledSeparator' => '_', //Version 3.0
                        'path' => $config->application->cacheDir."views/", //Version 4.0
                        'separator' => '_' //Version 4.0
                    ));

                    return $volt;
                },
                '.phtml' => 'Phalcon\Mvc\View\Engine\Php'
            ));
            return $view;
        });

        $di->set('dispatcher' , function(){
            $dispatcher = new \Phalcon\Mvc\Dispatcher();
            $dispatcher->setDefaultNamespace("Backend\Modules\Master\Controllers\\");
            return $dispatcher;
        });
    }
}