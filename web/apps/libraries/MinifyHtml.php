<?php
/**
 * Created by PhpStorm.
 * User: CHARIZARD
 * Date: 2/5/2016
 * Time: 8:32 AM
 */
class MinifyHtml{
    // -- Function Name : minify - Params : $html, $js = true, $css = true
    public static function minify($html, $js = true, $css = true){
        if(strpos($html,'<pre>') !== false)
        {
            $replace = array(
                '/<!--[^\[](.*?)[^\]]-->/s' => '',
                "/<\?php/"                  => '<?php ',
                "/\r/"                      => '',
                "/>\n</"                    => '><',
                "/>\s+\n</"    				=> '><',
                "/>\n\s+</"					=> '><',
            );
        }
        else
        {
            $replace = array(
                '/<!--[^\[](.*?)[^\]]-->/s' => '',
                "/<\?php/"                  => '<?php ',
                "/\n([\S])/"                => '$1',
                "/\r/"                      => '',
                "/\n/"                      => '',
                "/\t/"                      => '',
                "/ +/"                      => ' ',
            );
        }
        return preg_replace(array_keys($replace), array_values($replace), $html);
    }
}