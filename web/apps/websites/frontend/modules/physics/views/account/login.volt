<!doctype html>
<html " xml:lang="en">
<head>
    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="/favicon.ico" />
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>PHYSICS SUPPORT - HNN</title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />
    <!-- Canonical SEO -->
    <link rel="canonical" href="http://physics.vn" />
    <meta property="og:description" content="Website support for client of PHYSICS" />
    <meta property="og:site_name" content="HNN" />
    
    <!-- Tell the browser to be responsive to screen width -->
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css" >
    <link href="/assets/backend/css/lib/sweetalert/sweetalert.css" rel="stylesheet">
    <link rel="stylesheet" href="/assets/frontend/fonts/font-awesome/css/font-awesome.min.css">
    <style>
        html {
            font-family: 'Roboto', sans-serif;
        }
        .text-primary {
            color: #281374;
        }

        .btn-primary {
            background: #281374;
        }

        .text-danger {
            color: #EE161E;
        }

        .btn-danger {
            background: #EE161E;
        }

        .panel.with-nav-tabs .nav-tabs {
            border-bottom: none;
        }

        .panel.with-nav-tabs .nav-justified {
            margin-bottom: -4px;
        }

        .panel {
            margin: 5% 7% 7%;
            background-color: rgb(255, 255, 255);
        }

        .modal-header {
            background: #EE161E;
            color: white;
            text-align: center;
        }

        .input-group-addon {
            background-color: #EE161E;
            color: white;
        }

        .iga1 {
            background-color: #f0ad4e;
            color: white;
        }

        .iga2 {
            background-color: #FF3838;
            color: white;
        }

        .form-login {
            margin-top: 30px;
            z-index: 2;
            font-size: 15px;
        }

        .has-success .form-control {
            border-color: #49A44D;
        }

        .has-success .input-group-addon {
            color: #fff;
            background-color: #49A44D;
            border-color: #49A44D;
        }

        .has-success .checkbox,
        .has-success .checkbox-inline,
        .has-success .control-label,
        .has-success .help-block,
        .has-success .radio,
        .has-success .radio-inline,
        .has-success.checkbox label,
        .has-success.checkbox-inline label,
        .has-success.radio label,
        .has-success.radio-inline label {
            color: #281374;
        }

        .form-login .panel-heading {
            height: 5rem;
        }

        #particles-js {
            width: 100%;
            height: 100%;
            background-size: cover;
            background-position: 50% 50%;
            position: fixed;
            top: 0px;
            z-index: 1;
            background: rgba(255, 223, 13, 0.836);
        }
    </style>
</head>

<body class="hold-transition login-page">
    <div class="wrapper">
        <div class="container">
            <div class="row block-login">
                <div class="col-md-6 form-login col-md-offset-3">
                    <div class="panel with-nav-tabs panel-info">
                        <div class="panel-body">
                            <div class="tab-content">
                                <form id="login" action="/account/login" class="tab-pane fade in active register" method="POST">
                                    <div class="container-fluid">
                                        <div class="row">
                                            <h2 class="text-center">
                                                <strong>
                                                    <a href="http://physics.vn">
                                                        <img width="60%" src="/images/physics.png" alt="">
                                                    </a>
                                                </strong>
                                            </h2>
                                            <?php if(trim($login_title)){ ?>
                                                <div class="text-center" style="vertical-align: middle; padding:10px; border: #EE161E solid 1px; border-radius: 1rem">{{login_title}}</div>
                                            <?php } ?>
                                            <hr/>
                                            <div class="row">
                                                <div class="col-xs-12 col-sm-12 col-md-12">
                                                    <div class="form-group">
                                                        <div class="form-group has-feedback">
                                                            <label class="text-danger font-weight-bold" for="loginemail">E-mail
                                                                <strong class="text-danger">*</strong>
                                                            </label>
                                                            <div class="input-group">
                                                                <span class="input-group-addon">
                                                                    <i class="fa fa-envelope-o" aria-hidden="true"></i>
                                                                </span>
                                                                {{ form.render('email',['id' : 'loginemail']) }}
                                                            </div>
                                                            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                                            <div class="help-block with-errors"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-xs-12 col-sm-12 col-md-12">
                                                    <div class="form-group">
                                                        <div class="form-group has-feedback">
                                                            <label class="text-danger font-weight-bold" for="loginpassword">Mật khẩu
                                                                <strong class="text-danger">*</strong>
                                                            </label>
                                                            <div class="input-group">
                                                                <span class="input-group-addon">
                                                                    <i class="fa fa-unlock" aria-hidden="true"></i>
                                                                </span>
                                                                {{ form.render('password',['id' : 'loginpassword']) }}
                                                            </div>
                                                            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                                            <div class="help-block with-errors"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <label class="text-danger col-md-12 p-0 font-weight-bold" for="loginpassword">Xác thực
                                                    <strong class="text-danger">*</strong>
                                                </label>
                                                <div class="col-md-12">
                                                    <div class="col-md-5 captchaReset" style="padding: 0">
                                                        <img src='/captchas?type=login_client' alt="">
                                                    </div>
                                                    <div class="form-group col-md-7" style="padding: 0">
                                                        <div class="form-group has-feedback">
                                                            <div class="input-group">
                                                                <span class="input-group-addon">
                                                                    <i class="fa fa-lock" aria-hidden="true"></i>
                                                                </span>
                                                                <input type="text" name="captcha" class="form-control" placeholder="Nhập mã xác thực" required="1" maxlength="6" data-required-error="Vui lòng nhập mã xác thực.">
                                                            </div>
                                                            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                                            <div class="help-block with-errors"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-xs-12 col-sm-12 col-md-12">
                                                    <button type="submit" class="btn btn-danger btn-block btn-lg"> Đăng nhập </button>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="panel-heading">
                            <div class="row text-center" style="vertical-align: middle; font-size: 16px">
                                Copyright © 2018
                                <a href="http://physics.vn/" class="text-danger">PHYSICS</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="particles-js"></div>
    </div>x
    <!-- ./wrapper -->
    <script src="/assets/frontend/js/lib/jquery-3.1.1.min.js"></script>
    <script src="/assets/frontend/js/lib/bootstrap3.min.js"></script>
    <script src="/assets/frontend/js/lib/validator.min.js"></script>
    <script src="/assets/backend/js/lib/sweetalert/sweetalert.min.js"></script>
    <script>
        $.getScript("/assets/frontend/js/lib/particles.min.js", function () {
            particlesJS('particles-js', {
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
                            "color": "#EE141E"
                        },
                        "polygon": {
                            "nb_sides": 5
                        },
                        "image": {
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
                        "value": 5,
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
                            "mode": "repulse"
                        },
                        "onclick": {
                            "enable": true,
                            "mode": "push"
                        },
                        "resize": true
                    },
                    "modes": {
                        "grab": {
                            "distance": 400,
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
                            "distance": 200
                        },
                        "push": {
                            "particles_nb": 4
                        },
                        "remove": {
                            "particles_nb": 2
                        }
                    }
                },
                "retina_detect": true,
                "config_demo": {
                    "hide_card": false,
                    "background_color": "#b61924",
                    "background_image": "",
                    "background_position": "50% 50%",
                    "background_repeat": "no-repeat",
                    "background_size": "cover"
                }
            });

        });
    </script>
    <script>
        $(document).ready(function () {
            if(window.location.pathname === '/public_html/'){
                history.pushState('', '', '/');
            }
            let form = $('#login');
            form.validator().on('submit', function (e) {
                if (e.isDefaultPrevented()) {
                    
                } else {
                    let data = form.serializeArray();
                    $.ajax({
                        type: "POST",
                        url: '/account/login',
                        data: data,
                        dataType: "json",
                        success: function (results) {
                            if(results.client_id === 'admin'){
                                window.location.href='/adcp/dashboard/';
                            }else{
                                sessionStorage.setItem('client_id', results.client_id);
                                window.location.href='/account/';
                            }                            
                        },
                        error: function (error) {
                            if (error.responseJSON === undefined) {
                                swal({
                                    title: "Lỗi !!",
                                    text: `<strong class="text-danger">Lỗi chưa xác định !!</strong>`,
                                    type: "error",
                                    html: true
                                });
                            } else {
                                let err = '';
                                error.responseJSON.error.forEach(element => {
                                    err += element + ' !!</br>';
                                });
                                swal({
                                    title: "Lỗi !!",
                                    text: `<strong class="text-danger"> ${err}</strong>`,
                                    type: "error",
                                    html: true
                                });
                            }
                            $('.captchaReset img').attr('src','/captchas?type=login_client');
                            // window.location.reload();
                        }
                    });
                    e.preventDefault();
                }
            });
        });
    </script>
</body>

</html>