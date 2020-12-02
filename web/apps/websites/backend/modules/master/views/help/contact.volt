<div class="content-header">
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-6 d-flex align-items-center">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="<?= WEB_ADMIN_URL ?>"><i class="fas fa-home"></i></a></li>
                    <li class="breadcrumb-item active">{{ title }}</li>
                </ol>
            </div>
        </div>
    </div>
</div>

<div class="col-md-12">
    <div class="col-md-12">
        <?php echo $this->flashSession->output(); ?>
    </div>
</div>

<section class="content col-md-12">
    <div class="container-fluid">
        <div class="row d-flex align-items-stretch justify-content-center">
            <div class="col-12 col-lg-7 col-md-6">
                <div class="card bg-light">
                    <div class="card-body">
                        <div class="row align-items-center mt-2">
                            <div class="col-lg-9">
                                <h2 class="col-auto p-0 lead text-nowrap title-contact text-primary"><b>Công ty Cổ phần HONEYNET</b></h2>
                                <ul class="ml-4 mb-0 fa-ul text-muted">
                                    <li class="pt-1 pb-1"><span class="fa-li"><i class="fas fa-lg fa-building"></i></span>
                                        Địa chỉ: 685 Hưng Phú, Phường 9, Quận 8, Thành phố Hồ Chí Minh</li>
                                    <li class="pt-1 pb-1"><span class="fa-li"><i class="fas fa-lg fa-envelope"></i></span>
                                        E-mail: qlts@honeynet.vn</li>
                                    <li class="pt-1 pb-1"><span class="fa-li"><i class="fas fa-lg fa-phone"></i></span>
                                        Số điện thoại: 1900 299 911</li>
                                </ul>
                            </div>
                            <div class="col-lg-3 mt-1 justify-content-center">
                                <img src="<?= WEB_URL ?>/honeynet.png" alt="HONEYNET" class="img-fluid float-right">
                            </div>
                        </div>
                    </div>
                    <div class="card-footer">
                        <div class="text-right">
                            <a href="https://honeynet.vn" target="_blank" class="btn btn-hnn btn-hnn-primary"><span><i class="fas fa-globe"></i> Website</span></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>