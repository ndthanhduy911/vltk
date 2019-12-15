<main class="app-content">
        <div class="app-title">
            <div>
                <h1><i class="fa fa-th-list"></i> <?= ($staffs_lang[1]->title ? 'Cập nhật nhân sự' : 'Thêm nhân sự mới') ?></h1>
            </div>
            <ul class="app-breadcrumb breadcrumb side">
                <li class="breadcrumb-item"><a class="link" href="<?= $this->config->application->backendUri ?>"><i class="fa fa-home fa-lg"></i></a></li>
                <li class="breadcrumb-item"><a class="link" href="<?= $this->config->application->backendUri ?>/staff">Nhận sự</a></li>
                <li class="breadcrumb-item"><?= $title ?></li>
            </ul>
        </div>
    
        <div class="body-message">
            <?php echo $this->flashSession->output(); ?>
        </div>
    
        <div class="row">
            <form class="col-md-12 row p-0 m-0" method="POST" enctype="multipart/form-data" data-toggle="validator"
                role="form">
                <div class="col-md-9 p-0">
                    <div class="bs-component bg-white rounded">
                        <ul class="nav nav-tabs">
                            <?php foreach ($languages as $key => $lang) { ?>
                            <li class="nav-item"><a style="font-size : 1rem" class="nav-link font-weight-bold <?= (!$key ? 'active' : '') ?>" data-toggle="tab"
                                    href="#lang<?= $lang->id ?>"><?= $lang->name ?></a></li>
                            <?php } ?>
                        </ul>
                        <div class="tab-content p-3">
                            <?php foreach ($languages as $key => $lang) { ?>
                            <div class="tab-pane fade <?= (!$key ? 'active show' : '') ?>"id="lang<?= $lang->id ?>">
                                <h5 class="font-weight-bold text-primary">Tiêu đề</h5>
                                <div class="mb-3">
                                    <div class="form-row">
                                        <div class="form-group col-md-12 m-0">
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <div class="input-group-text fa fa-header"></div>
                                                </div>
                                                <?= $forms_lang[$lang->id]->render('title', ['id' => 'title' . $lang->id, 'name' => 'title[' . $lang->id . ']']) ?>
                                                <div class="invalid-tooltip"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                 
                                <h5 class="font-weight-bold text-primary">Giới thiệu</h5>
                                <div class="tile p-0">
                                    <div class="row m-0">
                                        <div class="col-md-12 p-0">
                                            <div class="form-group mb-0">
                                                <div class="input-group">
                                                    <textarea id="editor<?= $lang->id ?>" name="content[<?= $lang->id ?>]" class="rounded">
                                                        <?= $staff_content[$lang->id] ?>
                                                    </textarea>
                                                    <div class="invalid-tooltip"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <?php } ?>
                        </div>
                    </div>
                </div>
    
                <div class="col-md-3 pr-0">
                    <div class="tile p-3">

                        <div class="row m-0">
                            <div class="col-md-12 p-0">
                                <h5 class="font-weight-bold text-primary">Trạng thái</h5>
                                <div class="form-group mt-1">
                                    <div class="input-group">
                                        <?= $form_staff->render('status') ?>
                                        <div class="invalid-tooltip"></div>
                                    </div>
                                </div>
                                <div class="d-inline-block w-100 mb-2">
                                    <h5 class="font-weight-bold text-primary">Slug</h5>
                                    <div class="form-group mt-1">
                                        <div class="input-group">
                                            <?= $form_staff->render('slug') ?>
                                            <div class="invalid-tooltip"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
    
                            <div class="col-md-12 p-0">
                                <button type="submit" class="btn btn-success float-right btn-sm"><?= $title ?></button>
                            </div>
                        </div>
                    </div>
    
                    <div class="tile p-3">
                        <h5 class="font-weight-bold text-primary">Bộ môn</h5>
                        <div class="row m-0">
                            <div class="form-group mt-1 w-100">
                                <div class="input-group">
                                    <?= $form_staff->render('dept_id') ?>
                                    <div class="invalid-tooltip"></div>
                                </div>
                            </div>
                        </div>
                        <?php if ($dept_id == 1) { ?>
                        <h5 class="font-weight-bold text-primary">Chức vụ Khoa</h5>
                        <div class="row m-0">
                            <div class="form-group mt-1 w-100">
                                <div class="input-group">
                                    <?= $form_staff->render('dean') ?>
                                    <div class="invalid-tooltip"></div>
                                </div>
                            </div>
                        </div>
                        <?php } ?>
                        <h5 class="font-weight-bold text-primary">Chức vụ Bộ Môn</h5>
                        <div class="row m-0">
                            <div class="form-group mt-1 w-100">
                                <div class="input-group">
                                    <?= $form_staff->render('dept_position') ?>
                                    <div class="invalid-tooltip"></div>
                                </div>
                            </div>
                        </div>
                        <h5 class="font-weight-bold text-primary">E-mail</h5>
                        <div class="row m-0">
                            <div class="form-group mt-1 w-100">
                                <div class="input-group">
                                    <?= $form_staff->render('email') ?>
                                    <div class="invalid-tooltip"></div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="tile p-3">
                        <div class="row m-0">
                            <div class="col-md-12 p-0">
                                <img id="showImg" src="<?php echo $staff->featured_image ? $staff->featured_image : '' ?>"
                                    alt="" width="100%">
                                <?= $form_staff->render('featured_image') ?>
                                <a id="uploadImage" href="#" class="link">Đặt ảnh đại diện</a>
                            </div>
                        </div>
                    </div>
                </div>
                <input class="tokenCSRF" type="hidden" name="<?= $this->security->getTokenKey() ?>"
                    value="<?= $this->security->getToken() ?>">
            </form>
        </div>
    </main>