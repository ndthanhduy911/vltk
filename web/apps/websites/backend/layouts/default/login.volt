<!DOCTYPE html >
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="vi">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>ADCP - PHYSICS</title>
    <meta name="author" content="PHYSICS" />
    <meta name="copyright" content="PHYSICS" />
    <meta name="application-name" content="Article" />
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css" />
    <style>
        @import url('https://fonts.googleapis.com/css?family=Nunito');
        @import url('https://fonts.googleapis.com/css?family=Poiret+One');

        .btn-primary {
            transition: 0.5s;
        }

        .btn-primary:hover,
        .btn-primary:focus {
            background: white;
            border-color: #EE141E;
            color: black;
            transition: all 0.4s;
        }

        .btn-warning {
            transition: 0.5s;
        }

        .btn-warning:hover,
        .btn-warning:focus {
            background: white;
            color: black;
            border-color: #f0ad4e;
        }

        .panel.with-nav-tabs .nav-tabs {
            border-bottom: none;
        }

        .panel.with-nav-tabs .nav-justified {
            margin-bottom: -4px;
        }

        .panel {
            margin: 15% 7% 7%;
            background-color: rgb(255, 255, 255);
        }

        .modal-header {
            background: #FF3838;
            color: white;
            text-align: center;
        }

        .input-group-addon {
            background-color: #EE141E;
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
            z-index: 2;
            font-size: 15px;
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
            background: rgba(255, 223, 13, 0.832);
        }
    </style>
</head>

<body class="hold-transition login-page">
    <div class="wrapper">
        {{ content() }}
    </div>
    <!-- ./wrapper -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script>
        $.getScript("https://cdnjs.cloudflare.com/ajax/libs/particles.js/2.0.0/particles.min.js", function () {
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
</body>

</html>