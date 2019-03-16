<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css" href="/assets/backend/fonts/font-awesome/css/font-awesome.min.css">
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="/assets/backend/css/main.css">
    <link rel="stylesheet" href="/assets/backend/css/custom.css">
    <title>Login</title>
</head>

<body>
    <section class="material-half-bg">
        <div class="cover"></div>
    </section>
    <section class="login-content">
        <div class="login-box">
            <form id="loginForm" class="login-form" data-toggle="validator" role="form" method="POST">
                <h3 class="login-head"><i class="fa fa-lg fa-fw fa-user"></i>ĐĂNG NHẬP</h3>
                <div class="form-group">
                    <label class="control-label">Tài khoản</label>
                    <div class="input-group">
                        {{form.render('username')}}
                        <div class="invalid-tooltip"></div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label">Mật khẩu</label>
                    <div class="input-group">
                        {{form.render('password')}}
                        <div class="invalid-tooltip"></div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label">Mã xác thực</label>
                    <img class="mb-3 border rounded" src="/admin/account/captcha" alt="captcha" width="100%">
                    <div class="input-group">
                        <input name="captcha" type="text" maxlength="6" class="form-control" placeholder="Vui lòng nhập mã xác thực" required>
                        <div class="invalid-tooltip"></div>
                    </div>
                </div>
                <input type="hidden" name="<?php echo $this->security->getTokenKey() ?>" value="<?php echo $this->security->getToken() ?>"/>
                <div class="form-group btn-container mb-2">
                    <button class="btn btn-primary btn-block" type="submit"><i class="fa fa-sign-in fa-lg fa-fw"></i>ĐĂNG NHẬP</button>
                </div>
                <?php echo $this->flashSession->output(); ?>
            </form>
        </div>
    </section>
    <!-- Essential javascripts for application to work-->
    <script src="/assets/backend/js/jquery-3.2.1.min.js"></script>
    <script src="/assets/backend/js/popper.min.js"></script>
    <script src="/assets/backend/js/bootstrap.min.js"></script>
    <script src="/assets/backend/js/plugins/validator.min.js"></script>
    <!-- The javascript plugin to display page loading on top-->
    <script src="/assets/backend/js/plugins/pace.min.js"></script>
</body>

</html>