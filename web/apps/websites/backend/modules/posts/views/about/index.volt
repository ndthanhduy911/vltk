<!-- Bread crumb -->
<style>
    .address-icon i {
        font-size: 36px;
        line-height: 32px;
    }

    .icons i {
        color: #fff;
        padding: 8px 0px;
        text-align: center;
        height: 30px;
        width: 30px;
        margin-right: 5px;
    }

    .fa-facebook {
        background-color: #3A5A99;
    }

    .fa-twitter {
        background-color: #39CBFA;
    }

    .fa-linkedin {
        background-color: #3D99C0;
    }

    .fa-github {
        background-color: #000;
    }
</style>
<div class="row page-titles">
    <div class="col-md-5 align-self-center">
        <h3 class="text-hnn font-weight-bold">LIÊN HỆ</h3>
    </div>
    <div class="col-md-7 align-self-center">
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a href="{{ url('/adcp/dashboard') }}">BẢNG ĐIỀU KHIỂN</a>
            </li>
            <li class="breadcrumb-item active">Liên hệ</li>
        </ol>
    </div>
</div>
<?php echo $this->flashSession->output() ?>
<!-- End Bread crumb -->
<div class="container-fluid">
    <!-- Start Page Content -->
    <div class="row">
        <div class="col-12">
            <div class="card" style="background: #007bff">
                <div class="card-body">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12 col-12">
                                <div class="row bg-light pt-3 pb-3 mb-4">
                                    <div class="col-lg-12">
                                        <h6 class="text-hnn">ĐỊA CHỈ :</h6>
                                    </div>
                                    <div class="col-lg-4 col-4">
                                        685 Hưng Phú, Phường 9, Quận 8, TP.HCM
                                    </div>
                                    <div class="col-lg-4 col-4">
                                        <p class="m-0 text-hnn">
                                            <i class="fa fa-phone-square" aria-hidden="true"></i>
                                            0938.357.205
                                        </p>
                                        <p class="m-0 text-info">
                                            <i class="fa fa-envelope" aria-hidden="true"></i>
                                            info@physics.vn
                                        </p>
                                    </div>
                                </div>
                                <div class="row bg-light pt-3 pb-3 mb-4">
                                    <div class="col-lg-6 col-12">
                                        <form>
                                            <div class="form-row mb-3">
                                                <div class="col">
                                                    <input type="text" class="form-control" placeholder="Họ & Tên">
                                                </div>
                                                <div class="col">
                                                    <input type="text" class="form-control" placeholder="Đơn vị">
                                                </div>
                                            </div>
                                            <div class="form-row mb-3">
                                                <div class="col">
                                                    <input type="text" class="form-control" placeholder="Địa chỉ Email">
                                                </div>
                                                <div class="col">
                                                    <input type="text" class="form-control" placeholder="Điện thoại">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="Nội dung :"></textarea>
                                            </div>
                                            <button type="submit" class="btn btn-primary mb-4">Gửi</button>
                                        </form>
                                    </div>
                                    <div class="col-lg-6 col-12">
                                        <div style="width: 100%">
                                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3919.8512810546263!2d106.66591031414886!3d10.745942992342199!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752e564817c07f%3A0xbd3e80fc4f0c5c74!2zNjg1IEjGsG5nIFBow7osIFBoxrDhu51uZyA5LCBRdeG6rW4gOCwgSOG7kyBDaMOtIE1pbmgsIFZp4buHdCBOYW0!5e0!3m2!1svi!2s!4v1534907478303" width="100%" height="300" frameborder="0" style="border:0" allowfullscreen></iframe>
                                        </div>
                                        <div class="icons">
                                            <a href="">
                                                <i class="fa fa-facebook"></i>
                                            </a>
                                            <a href="">
                                                <i class="fa fa-twitter"></i>
                                            </a>
                                            <a href="">
                                                <i class="fa fa-linkedin"></i>
                                            </a>
                                            <a href="">
                                                <i class="fa fa-github"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End PAge Content -->
</div>