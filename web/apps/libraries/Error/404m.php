<!doctype html >
<html lang="vi-VN">
<head>
    <meta http-equiv="content-language" content="vi" />
    <meta name="viewport" content="width=device-width, user-scalable=yes,  maximum-scale=1.0" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>404</title>
    <meta name="description" content="404">
    <meta name="keywords" content="404">

    <link rel='stylesheet' id='google_font_open_sans-css' href='http://fonts.googleapis.com/css?family=Open+Sans%3A300italic%2C400italic%2C600italic%2C400%2C600%2C700&#038;ver=4.4.2' type='text/css' media='all'/>
    <link rel='stylesheet' id='td-theme-css' href='/assets/backend/news/css/style.css' type='text/css' media='all'/>
    <link rel='stylesheet' id='td-theme-css' href='/assets/backend/news/css/update.css' type='text/css' media='all'/>
    <script type='text/javascript' src='/assets/backend/news/js/jquery-2.1.1.min.js'></script>
    <script type='text/javascript' src='/assets/backend/news/js/jquery-migrate.min.js?ver=1.2.1'></script>

    <!--[if lt IE 9]><script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
    <style type="text/css" media="screen">
        .page-p404 {
            width:600px;
            margin:50px auto;
        }
        .page-p404 img{
            text-align: center;
        }
    </style>
</head>
<body class="home page page-id-123480 page-template-default news wpb-js-composer js-comp-ver-4.9 vc_responsive td-animation-stack-type0 td-full-layout" itemscope="itemscope" itemtype="http://schema.org/WebPage">
<div class="td-scroll-up"><i class="td-icon-menu-up"></i></div>
<div id="td-outer-wrap">
    <?php include APP_DIR . '/websites/frontend/layouts/news/partials/mobile.volt'; ?>
    <div class="td-transition-content-and-menu td-content-wrap">
        <?php include APP_DIR . '/websites/frontend/layouts/news/partials/header.volt'; ?>
        <div class="td-main-content-wrap td-main-page-wrap">
            <div class="td-container">
                <div class="page-p404">
                    <img src="/assets/backend/img/404.png" width="518" height="210" alt="">
                    <?php
                    if(DEBUG == true):?>
                        <div class="content-msg">
                            <?php echo $e->getMessage(); ?>
                        </div>
                    <?php else: ?>

                        <div class="page-notidv">
                            <script type="text/javascript">
                                var count =5;
                                var redirect = ".";
                                function countDown(){

                                    var timer = document.getElementById("timer");
                                    if(count > 0){
                                        count--;
                                        timer.innerHTML = "Hệ thống không tìm thấy trang bạn yêu cầu. Quay trở lại <a href='.'>trang chủ</a> trong "+count+" giây.";
                                        setTimeout("countDown()", 1000);
                                    }else{
                                        window.location.href = "/";
                                    }

                                }
                            </script>
                            <span id="timer"><script type="text/javascript">countDown();</script></span>
                        </div>
                    <?php endif; ?>
                </div>
            </div>
        </div>
    </div>
    <?php include APP_DIR . '/websites/frontend/layouts/news/partials/footer.volt'; ?>

</div>
</body>
</html>
