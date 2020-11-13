<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="shortcut icon" href="<?= WEB_URL ?>/favicon.ico" type="image/x-icon">
    <title><?= WEB_TITLE ?></title>
    <link rel="stylesheet" href="<?= WEB_URL.'/assets/backend/dist/' ?>plugins/fontawesome-free/css/all.min.css">
    <link rel="stylesheet" href="<?= WEB_URL.'/assets/backend/dist/' ?>/css/adminlte.min.css">
    <link rel="stylesheet" href="<?= WEB_URL.'/assets/backend/' ?>material-dashboard.css">
    <!-- custom -->
    <link rel="stylesheet" href="<?= WEB_URL.'/assets/backend/' ?>custom.css">
    <style>
        @font-face {
            font-family: "Roboto";
            src: url(/assets/backend/dist/fonts/roboto/Roboto-Regular.ttf);
        }
    </style>
    <style>
        body {
            overflow-x: hidden;
            height: 100%;
            background-color: #B0BEC5 !important;
            background-repeat: no-repeat
        }

        .btn-hnn {
            line-height: 1.5;
        }

        .alert {
            padding: 10px;
        }

        .logo {
            width: 80px;
            /* height: 100px; */
            margin-top: 20px;
            margin-left: 35px
        }

        .image {
            width: 360px;
            height: 280px
        }

        .line {
            height: 1px;
            width: 45%;
            background-color: #E0E0E0;
            margin-top: 10px
        }

        .or {
            width: 10%;
            font-weight: bold
        }

        .input-group-append {
            margin-left: -35px;
        }

        .input-group-text {
            background-color: transparent;
            border: none;
        }

        .f-s-14 {
            font-size: 14px;
        }

        @media screen and (max-width: 991px) {
            .logo {
                margin-left: 0px
            }

            .image {
                width: 300px;
                height: 220px
            }

            .border-line {
                border-right: none
            }
}
    </style>
</head>

<body>
    <div class="container">
        <div class="container-fluid px-1 px-md-5 px-lg-1 px-xl-5 py-5 mx-auto">
            <div class="card rounded">
                <div class="row d-flex p-3">
                    <div class="col-lg-6">
                        <div class="card1 pb-5">
                            <div class="row"><img src="/logo.png" class="logo"> </div>
                            <div class="row px-3 justify-content-center mt-4 mb-5"> <img src="/assets/images/it.png" class="image"> </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <form action="<?= WEB_ADMIN_URL ?>/login" id="frmLogin" data-toggle="validator" role="form" method="POST">
                            <div class="card border-0 px-4 py-5">
                                <h1 class="text-center font-weight-bold text-primary">ĐĂNG NHẬP</h1>
                                <div class="row mb-4">
                                    <div class="col-md-12 d-flex">
                                        <div class="line"></div> <small class="or text-center"><i class="fas fa-graduation-cap" aria-hidden="true"></i></small>
                                        <div class="line"></div>
                                    </div>
                                </div>
                                <div class="form-group label-floating">
                                    <div class="input-group">
                                        <label class="control-label">{{form.getLabel('username')}}</label>
                                        {{form.render('username')}}
                                        <div class="input-group-append">
                                            <div class="input-group-text">
                                                <span class="fas fa-envelope"></span>
                                            </div>
                                        </div>
                                    <div class="invalid-feedback"></div>
                                    </div>
                                </div>
                                <div class="form-group label-floating">
                                    <div class="input-group">
                                        <label class="control-label">{{form.getLabel('password')}}</label>
                                        {{form.render('password')}}
                                        <div class="input-group-append">
                                            <div class="input-group-text">
                                                <span class="fas fa-lock"></span>
                                            </div>
                                        </div>
                                        <div class="invalid-feedback"></div>
                                    </div>
                                </div>
                                <div class="form-group label-floating">
                                    <div class="input-group">
                                        <label class="control-label">{{form.getLabel('captcha')}}</label>
                                        {{form.render('captcha')}}
                                        <div class="input-group-append">
                                            <div class="input-group-text">
                                                <span class="fas fa-lock"></span>
                                            </div>
                                        </div>
                                        <div class="invalid-feedback"></div>
                                    </div>
                                </div>
                                <div class="w-100">
                                    <img class="mb-3 border rounded" src="<?= WEB_ADMIN_URL ?>/login/captcha" alt="captcha" width="100%">
                                </div>

                                <input class="tokenCSRF" type='hidden' name="{{security.getTokenKey()}}" value="{{security.getToken()}}" />
                                <div class="bg-white">
                                    <?php echo $this->flashSession->output(); ?>
                                </div>
                                <button type="submit" class="btn btn-block btn-hnn btn-hnn-primary"><span>Đăng Nhập <i class="fas fa-sign-in-alt ml-2"></i></span></button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="bg-primary rounded-bottom">
                    <div class="row p-3"> <span class="m-auto f-s-14">Bản quyền &copy; 2020. Khoa Vật Lý - Vật Lý Kỹ Thuật.</span></div>
                </div>
            </div>
        </div>
    </div>

    {#
    <div class="jumbotron jumbotron-main" id="home">
        <div id="particles-js"><canvas class="particles-js-canvas-el"></canvas></div>
        <div id="loginForm" class="d-flex align-content-center justify-content-center">
            <form action="<?= WEB_URL ?>" id="frmLogin" data-toggle="validator" role="form" method="POST" class="col-md-4 bg-white card"
                style="max-width: 450px !important">
                <div class="card-header d-flex justify-content-center mt-3">
                    <a target="_blank" href="<?= WEB_ADMIN_URL ?>">
                        <h1 class="mb-0 text-center text-primary font-weight-bold"><?= WEB_TITLE ?></h1>
                    </a>
                </div>
                <div class="card-body pb-4">
                    <div class="form-group label-floating is-empty">
                        <div class="input-group">
                            <label class="control-label">{{form.getLabel('username')}}</label>
                            {{form.render('username')}}
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <span class="fas fa-envelope"></span>
                                </div>
                            </div>
                        <div class="invalid-feedback"></div>
                        </div>
                    </div>

                    <div class="form-group label-floating is-empty">
                        <div class="input-group">
                            <label class="control-label">{{form.getLabel('password')}}</label>
                            {{form.render('password')}}
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <span class="fas fa-lock"></span>
                                </div>
                            </div>
                            <div class="invalid-feedback"></div>
                        </div>
                    </div>
                    <div class="form-group label-floating is-empty">
                        <div class="input-group">
                            <img class="mb-3 border rounded" src="<?= WEB_ADMIN_URL ?>/login/captcha" alt="captcha" width="100%">
                        </div>
                        <div class="input-group mt-3">
                            <label class="control-label">{{form.getLabel('captcha')}}</label>
                            {{form.render('captcha')}}
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <span class="fas fa-lock"></span>
                                </div>
                            </div>
                            <div class="invalid-feedback"></div>
                        </div>
                    </div>
                    <input class="tokenCSRF" type='hidden' name='<?php echo $this->security->getTokenKey() ?>'
                    value='<?php echo $this->security->getToken() ?>' />
                    <div class="bg-white">
                        <?php echo $this->flashSession->output(); ?>
                    </div>
                    <button type="submit" class="btn btn-block btn-hnn btn-hnn-primary"><span>Đăng Nhập <i class="fas fa-sign-in-alt ml-2"></i></span></button>
                </div>
            </form>
        </div>
    </div>
    #}
    <script src="<?= WEB_URL.'/assets/backend/dist/' ?>plugins/jquery/jquery.min.js"></script>
    <script src="<?= WEB_URL.'/assets/backend/dist/' ?>plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="<?= WEB_URL ?>/js/validator.min.js"></script>
    <script>
        const loaderHtml = `
        <div class="block-loader">
            <div class="loader mr-auto ml-auto"></div>
        </div>`;
        //Call API
        const callApiForm = (href,data={},type = "GET",ctype='json') => {
            return new Promise((resolve) => {
                $.ajax({
                    type: type,
                    url: href,
                    data: data,
                    dataType: ctype,
                    processData: false,
                    contentType: false,
                    success: function (response) {
                        $('body .block-loader').remove();
                        if(typeof response.logout != 'undefined'){
                            window.location.reload();
                        }else{
                            if (typeof response.error == 'undefined') {
                                if(typeof response.token != 'undefined'){
                                    $('.tokenCSRF').val(response.token.value);
                                    $('.tokenCSRF').attr('name', response.token.key);
                                }
                                resolve(response);
                            } else {
                                showErrorAjax(response);
                            }
                        }
                        $('[data-toggle="tooltip"]').tooltip()
                    },
                    error: function (error) {
                        $('body .block-loader').remove();
                        showSweetAlertError('Thất bại');
                    }
                });
            })
        }
        //Send Ajax
        const sendAjax = (form, type = "GET", loader = true) => {
            return new Promise((resolve, reject) => {
                $(form).off('submit').validator().on('submit', function (e) {
                    let href = $(this).attr('action');
                    if (e.isDefaultPrevented()) {

                    } else {
                        e.preventDefault();
                        let data = new FormData($(this)[0]);
                        if (loader) {
                            $('body').append(loaderHtml);
                        }
                        callApiForm(href,data,type).then((response)=>{
                            resolve(response);
                        })
                    }
                })
            })
        }
        //Show popup sweetalert
        const showSweetAlert = (cb = () => {}, text = "Bạn có chắc muốn thực hiện thao tác này ?") => {
            Swal.fire({
                title: 'Xác nhận',
                text: text,
                type: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#4CAF50',
                cancelButtonColor: '#F44336',
                confirmButtonText: 'Đồng ý',
                cancelButtonText: 'Hủy',
                position: 'top',
            }).then((result) => {
                if (result.value) {
                    cb();
                }
            })
        }
        const showSweetAlertOk = (title) => {
            Swal.fire({
                type: 'success',
                title: title,
                showConfirmButton: false,
                timer: 1500
            });
        }
        const showSweetAlertError = (title) => {
            Swal.fire({
                type: 'error',
                position: 'top',
                title: title,
                showConfirmButton: false,
            });
        }
    </script>
</body>

</html>