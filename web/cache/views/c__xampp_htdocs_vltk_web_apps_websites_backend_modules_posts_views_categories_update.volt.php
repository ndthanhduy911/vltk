<main class="app-content">
    <div class="app-title">
        <div>
            <h1><i class="fa fa-th-list"></i> <?= $title ?> danh mục</h1>
        </div>
        <ul class="app-breadcrumb breadcrumb side">
            <li class="breadcrumb-item"><a class="link" href="<?= $this->config->application->backendUri ?>"><i class="fa fa-home fa-lg"></i></a></li>
            <li class="breadcrumb-item"><a class="link" href="<?= $this->config->application->backendUri ?>/categories">Danh mục</a></li>
            <li class="breadcrumb-item"><?= $title ?></li>
        </ul>
    </div>

    <div class="body-message">
        <?php echo $this->flashSession->output(); ?>
    </div>

    <div class="row">
        <form class="col-md-12 row p-0 m-0" method="post" enctype="multipart/form-data" data-toggle="validator"
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
                        <div class="tab-pane fade <?= (!$key ? 'active show' : '') ?>"
                            id="lang<?= $lang->id ?>">
                            <h5 class="font-weight-bold text-primary">Tiêu đề</h5>
                            <div class="tile p-3">
                                <div class="modal-body p-0">
                                    <div class="form-row">
                                        <div class="form-group col-md-12 m-0">
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <div class="input-group-text fa fa-header"></div>
                                                </div>
                                                <?= $forms_lang[$lang->id]->render('name', ['id' => 'name' . $lang->id, 'name' => 'name[' . $lang->id . ']']) ?>
                                                <div class="invalid-tooltip"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <h5 class="font-weight-bold text-primary">Mô tả</h5>
                            <div class="tile p-0">
                                <div class="modal-body pb-0">
                                    <div class="form-row">
                                        <div class="form-group col-md-12">
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <div class="input-group-text fa fa-tags"></div>
                                                </div>
                                                <?= $forms_lang[$lang->id]->render('description', ['id' => 'description' . $lang->id, 'name' => 'description[' . $lang->id . ']']) ?>
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
                <h5 class="font-weight-bold text-primary"><?= $title ?></h5>
                <div class="tile p-3">
                    <div class="row m-0">
                        <div class="col-md-12 p-0">
                            <i class="fa fa-key"></i>
                            <span class="f-s-90">Trạng thái:</span>
                            <div class="form-group mt-1">
                                <div class="input-group">
                                    <?= $form_cat->render('status') ?>
                                    <div class="invalid-tooltip"></div>
                                </div>
                            </div>

                            <div class="d-inline-block w-100 mb-2">
                                <i class="fa fa-link"></i>
                                <span class="f-s-90">Slug:</span>
                                <div class="form-group mt-1">
                                    <div class="input-group">
                                        <?= $form_cat->render('slug') ?>
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

                <h5 class="font-weight-bold text-primary">Ảnh đại diện</h5>
                <div class="tile p-3">
                    <div class="row m-0">
                        <div class="col-md-12 p-0">
                            <img id="showImg" src="<?php echo $post->featured_image ? $post->featured_image : '' ?>"
                                alt="" width="100%">
                            <?= $form_cat->render('featured_image') ?>
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