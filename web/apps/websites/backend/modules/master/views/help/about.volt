<div class="content-header header-about">
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
        <div class="row">
            <div class="col-auto mr-auto ml-auto content-h">
                <div class="card card-primary card-outline">
                    <div class="card-body p-1">
                        <img src="/uploads/help/about.jpg" alt="HONEYNET" class="rounded about-img">
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>