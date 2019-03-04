<!-- Bread crumb -->
<div class="row page-titles">
    <div class="col-md-5 align-self-center">
        <h3 class="text-hnn font-weight-bold">CHÍNH SÁCH</h3>
    </div>
    <div class="col-md-7 align-self-center">
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a href="{{ url('/adcp/dashboard') }}">BẢNG ĐIỀU KHIỂN</a>
            </li>
            <li class="breadcrumb-item active">Chính sách</li>
        </ol>
    </div>
</div>
<?php echo $this->flashSession->output() ?>
<!-- End Bread crumb -->
<div class="container-fluid">
    <!-- Start Page Content -->
    <div class="row">
        <div class="col-md-12 pt-2 bg-white">
            <h5 class="text-uppercase text-danger"><i class="fa fa-check-square-o" aria-hidden="true"></i> Chính sách bảo mật</h5>
            <article>
                <p>Nội dung chính sách bảo mật</p>
            </article>
            <h5 class="text-uppercase text-danger"><i class="fa fa-check-square-o" aria-hidden="true"></i> Chính sách xử lý Ticket</h5>
            <article>
                <p>Nội dung chính sách xử lý ticket</p>
            </article>
        </div>
    </div>
    <!-- End PAge Content -->
</div>