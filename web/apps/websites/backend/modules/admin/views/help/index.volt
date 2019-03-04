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
        <h3 class="text-hnn font-weight-bold">HƯỚNG DẪN</h3>
    </div>
    <div class="col-md-7 align-self-center">
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a href="{{ url('/adcp/dashboard') }}">BẢNG ĐIỀU KHIỂN</a>
            </li>
            <li class="breadcrumb-item active">Hướng dẫn</li>
        </ol>
    </div>
</div>
<?php echo $this->flashSession->output() ?>
<!-- End Bread crumb -->
<div class="container-fluid">
    <!-- Start Page Content -->
    <div class="row">
        <h3>ĐANG CẬP NHẬT...</h3>
    </div>
    <!-- End PAge Content -->
</div>