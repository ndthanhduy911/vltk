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

        #particles-js {
            position: absolute;
            left: 0;
            top: 0;
            width: 100vw;
            /* min-height: 661px; */
            height: 100%;
            background-image: url("");
            background-repeat: no-repeat;
            background-size: cover;
            background-position: 50% 50%;
            background: #2196F2;
            /* Old browsers */
            background: -moz-linear-gradient(left, #2196F2 0%, #2196F2 35%, #2196F2 68%, #2196F2 100%);
            /* FF3.6-15 */
            background: -webkit-linear-gradient(left, #2196F2 0%, #2196F2 35%, #2196F2 68%, #2196F2 100%);
            /* Chrome10-25,Safari5.1-6 */
            background: linear-gradient(to right, #2196F2 0%, #2196F2 35%, #2196F2 68%, #2196F2 100%);
            /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#6819e8', endColorstr='#6980f2', GradientType=1);
            /* IE6-9 */
        }

        #boxLogin {
            padding: 40px 15px;
        }

        .logoImage{
            height: 70px;
        }

        .btn-hnn {
            line-height: 1.5;
        }

        .alert {
            padding: 10px;
        }

        .logo {
            width: 80px;
            height: 80px;
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
            margin-left: -30px;
        }

        .input-group-text {
            background-color: transparent;
            border: none;
            padding-left: 8px;
            padding-right: 8px;
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

        @media screen and (max-width: 480px) {
            #imageBlock{
                display: none;
            }
            .pv-0 {
                padding: 0 !important;
            }
            .card.rounded.mt-5 {
                margin-top: 15px !important;
            }
            #boxLogin{
                padding: 30px 15px;
            }
            .login-title {
                font-size: 36px;
            }
            .logoImage{
                height: 60px;
            }
        }
    </style>
</head>

<body>
    <div id="particles-js"><canvas class="particles-js-canvas-el"></canvas></div>
    <div class="container">
        <div class="container-fluid">
            <div class="card rounded mt-5">
                <div class="row d-flex p-3 pv-0">
                    <div class="col-md-7" id="imageBlock">
                        <div class="card1 pb-5">
                            <div class="row"><img src="<?= LOGO ?>" class="logo" width="80px"> </div>
                            <div class="row px-3 justify-content-center mt-4 mb-5"> <img src="/assets/images/it.png" class="image"> </div>
                        </div>
                    </div>
                    <div class="col-md-5">
                        <form action="<?= WEB_ADMIN_URL ?>/login" id="frmLogin" data-toggle="validator" role="form" method="POST">
                            <div class="card border-0 mb-0" id="boxLogin">
                                <h2 class="text-center font-weight-bold text-primary login-title mt-3 mb-4"><?= WEB_TITLE ?></h2>
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
                <hr class="mb-0">
                <div class="bg-eee rounded-bottom border-0">
                    <div class="row p-3"> <span class="m-auto f-s-14">&copy;<?= date('Y') ?> - Phát triển bởi <a href="https://honeynet.vn" class="text-danger font-weight-bold"><?= DEPTDEV ?></a></span></div>
                </div>
            </div>
        </div>
    </div>
    <script src="<?= WEB_URL.'/assets/backend/dist/' ?>plugins/jquery/jquery.min.js"></script>
    <script src="<?= WEB_URL.'/assets/backend/dist/' ?>plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="<?= WEB_URL ?>/assets/js/particles.min.js"></script>
    <script src="<?= WEB_URL ?>/assets/js/validator.min.js"></script>
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
                        $('[data-tooltip="tooltip"]').tooltip()
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

        particlesJS("particles-js", {
            "particles": {
                "number": {
                    "value": 80,
                    "density": {
                        "enable": true,
                        "value_area": 800
                    }
                },
                "color": {
                    "value": "#ffffff"
                },
                "shape": {
                    "type": "circle",
                    "stroke": {
                        "width": 0,
                        "color": "#000000"
                    },
                    "polygon": {
                        "nb_sides": 5
                    },
                    "image": {
                        "src": "img/github.svg",
                        "width": 100,
                        "height": 100
                    }
                },
                "opacity": {
                    "value": 0.5,
                    "random": false,
                    "anim": {
                        "enable": false,
                        "speed": 1,
                        "opacity_min": 0.1,
                        "sync": false
                    }
                },
                "size": {
                    "value": 3,
                    "random": true,
                    "anim": {
                        "enable": false,
                        "speed": 40,
                        "size_min": 0.1,
                        "sync": false
                    }
                },
                "line_linked": {
                    "enable": true,
                    "distance": 150,
                    "color": "#ffffff",
                    "opacity": 0.4,
                    "width": 1
                },
                "move": {
                    "enable": true,
                    "speed": 6,
                    "direction": "none",
                    "random": false,
                    "straight": false,
                    "out_mode": "out",
                    "bounce": false,
                    "attract": {
                        "enable": false,
                        "rotateX": 600,
                        "rotateY": 1200
                    }
                }
            },
            "interactivity": {
                "detect_on": "canvas",
                "events": {
                    "onhover": {
                        "enable": true,
                        "mode": "grab"
                    },
                    "onclick": {
                        "enable": true,
                        "mode": "push"
                    },
                    "resize": true
                },
                "modes": {
                    "grab": {
                        "distance": 140,
                        "line_linked": {
                            "opacity": 1
                        }
                    },
                    "bubble": {
                        "distance": 400,
                        "size": 40,
                        "duration": 2,
                        "opacity": 8,
                        "speed": 3
                    },
                    "repulse": {
                        "distance": 200,
                        "duration": 0.4
                    },
                    "push": {
                        "particles_nb": 4
                    },
                    "remove": {
                        "particles_nb": 2
                    }
                }
            },
            "retina_detect": true
        });
    </script>
</body>

</html>