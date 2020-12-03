<div class="content-header">
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-6 d-flex align-items-center">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="<?= WEB_ADMIN_URL ?>"><i class="fas fa-home"></i></a></li>
                    <li class="breadcrumb-item active">{{ title }}</li>
                </ol>
            </div>
            <div class="col-sm-6">
                <div class="btn-group float-right">
                    <a id="deletePosts" href="<?= WEB_ADMIN_URL ?>/trashs/delete" title="Xóa vĩnh viễn"
                        class="ml-2 btn btn-hnn btn-hnn-danger"><span><i class="fas fa-trash"></i></span></a>
                </div>
                <div class="btn-group float-right">
                    <a id="restorePosts" href="<?= WEB_ADMIN_URL ?>/trashs/restore" title="Khôi phục"
                        class="ml-2 btn btn-hnn btn-hnn-info"><span><i class="fas fa-sync"></i></span></a>
                </div>
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
            <div class="col-md-12">
                <div class="card card-primary card-outline">
                    <div class="card-body">
                        <div class="table-responsive">
                            <table id="trashs" class="table table-bordered table-hover rounded">
                                <thead>
                                    <tr>
                                        <th data-col="no" class="align-middle text-center" style="width: 20px;">
                                            <input id="trashsCheckboxAll" type="checkbox" value="1">
                                        </th>
                                        <th data-col="no" class="align-middle text-center">#</th>
                                        <th data-col="title" class="align-middle text-center">Tiêu đề</th>
                                        <th data-col="des" class="align-middle text-center">Mô tả</th>
                                        <th data-col="updatedat" class="align-middle text-center">Thời gian xóa</th>
                                        <th data-col="no" class="align-middle text-center">Thao tác</th>
                                    </tr>
                                </thead>
                                <tbody>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</section>