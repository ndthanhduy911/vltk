<?php
namespace Backend\Modules\Master;
class Module implements \Phalcon\Mvc\ModuleDefinitionInterface
{
    /**
     * Registers the module auto-loader
     */
    public function registerAutoloaders(\Phalcon\DiInterface $dependencyInjector = null)
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
    public function registerServices(\Phalcon\DiInterface $di)
    {
        $di['view'] = function () {
            $config = include APP_DIR . '/configs/config.php';
            $view = new \Phalcon\Mvc\View();
            $view->setViewsDir(__DIR__ . '/views/');
            $view->setLayoutsDir('../../../layouts/' . $config->application->backendTheme . '/');
            $view->setPartialsDir('../../../layouts/' . $config->application->backendTheme . '/partials/');
            $view->setTemplateAfter('layout');

            $view->registerEngines(array(
                '.volt' => function ($view, $di) use ($config) {

                    $volt = new \Phalcon\Mvc\View\Engine\Volt($view, $di);

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
            $dispatcher->setDefaultNamespace("Backend\Modules\Master\Controllers\\");
            return $dispatcher;
        });
    }
}