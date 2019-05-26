<main class="app-content">
    <div class="app-title">
        <div>
            <h1><i class="fa fa-th-list"></i> CẬP NHẬT TRANG</h1>
            <p><?php echo $page->title ? 'Cập nhật trang': 'Thêm trang mới' ?></p>
        </div>
        <ul class="app-breadcrumb breadcrumb side">
            <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
            <li class="breadcrumb-item">Trang</li>
            <li class="breadcrumb-item">Cập nhật</li>
        </ul>
    </div>

    <div class="body-message m-0">
        <?php echo $this->flashSession->output(); ?>
    </div>

    <div class="row m-0">
        <form class="col-md-12 row p-0 m-0" method="post" enctype="multipart/form-data" data-toggle="validator"
            role="form">
            <div class="col-md-9 p-0">
                <h5 class="font-weight-normal text-primary">Tiêu đề</h5>
                <div class="tile p-0">
                    <div class="modal-body pb-0">
                        <div class="form-row">
                            <div class="form-group col-md-12">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text fa fa-header"></div>
                                    </div>
                                    <?= $form->render('title') ?>
                                    <div class="invalid-tooltip"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <h5 class="font-weight-normal text-primary">Tóm tắt</h5>
                <div class="tile p-0">
                    <div class="modal-body pb-0">
                        <div class="form-row">
                            <div class="form-group col-md-12">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text fa fa-link"></div>
                                    </div>
                                    <?= $form->render('excerpt') ?>
                                    <div class="invalid-tooltip"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <h5 class="font-weight-normal text-primary">Nội dung</h5>
                <div class="adjoined-bottom rounded mb-4">
                    <div class="grid-container rounded">
                        <div class="grid-width-100 p-0 rounded">
                            <textarea id="editor" name="content" class="rounded" >
                                <?= $page->content ?>
                            </textarea>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-3 pr-0">
                <h5 class="font-weight-normal text-primary">URL</h5>
                <div class="tile">
                    <div class="row m-0">
                        <div class="col-md-12 p-0">
                            <div class="form-group mb-0">
                                <div class="input-group">
                                    <?= $form->render('slug') ?>
                                    <div class="invalid-tooltip"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <h5 class="font-weight-normal text-primary">Đăng bài</h5>
                <div class="tile">
                    <div class="row m-0">
                        <div class="col-md-12 p-0">
                            <p class="small mb-2">Trạng thái:</p>
                            <div class="form-group">
                                <div class="input-group">
                                    <?= $form->render('status') ?>
                                    <div class="invalid-tooltip"></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 p-0">
                            <button type="submit" class="btn btn-success float-right btn-sm"><?php echo $page->title ? 'Cập nhật' : 'Thêm mới' ?></button>
                        </div> 
                    </div>
                </div>
                <h5 class="font-weight-normal text-primary">Sử dụng mẫu</h5>
                <div class="tile">
                    <div class="row m-0">
                        <div class="col-md-12 p-0">
                            <div class="form-group mb-0">
                                <div class="input-group">
                                    <?= $form->render('attribute_id') ?>
                                    <div class="invalid-tooltip"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <input class="tokenCSRF" type="hidden" name="<?= $this->security->getTokenKey() ?>" value="<?= $this->security->getToken() ?>">
        </form>
    </div>
</main>