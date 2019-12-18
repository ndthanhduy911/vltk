<main class="app-content">
    <div class="app-title">
        <div>
            <h1><i class="fa fa-th-list"></i> <?= ($pages_lang[1]->title ? 'Cập nhật trang' : 'Thêm trang mới') ?></h1>
        </div>
        <ul class="app-breadcrumb breadcrumb side">
            <li class="breadcrumb-item"><a class="link" href="<?= $this->config->application->backendUri ?>"><i class="fa fa-home fa-lg"></i></a></li>
            <li class="breadcrumb-item"><a class="link" href="<?= $this->config->application->backendUri ?>/pages">Trang</a></li>
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
                        <div class="tab-pane fade <?= (!$key ? 'active show' : '') ?>" id="lang<?= $lang->id ?>">
                            <h5 class="text-primary font-weight-normal">Tiêu đề</h5>
                            <div class="form-row mb-3">
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

                            <h5 class="text-primary font-weight-normal">Tóm tắt</h5>
                            <div class="form-row">
                                <div class="form-group col-md-12">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <div class="input-group-text fa fa-tags"></div>
                                        </div>
                                        <?= $forms_lang[$lang->id]->render('excerpt', ['id' => 'excerpt' . $lang->id, 'name' => 'excerpt[' . $lang->id . ']']) ?>
                                        <div class="invalid-tooltip"></div>
                                    </div>
                                </div>
                            </div>

                            <h5 class="text-primary font-weight-normal">Nội dung</h5>

                            <div class="form-row">
                                <div class="form-group col-md-12">
                                    <div class="input-group">
                                        <textarea id="editor<?= $lang->id ?>" name="content[<?= $lang->id ?>]" class="rounded">
                                            <?= $page_content[$lang->id] ?>
                                        </textarea>
                                        <div class="invalid-tooltip"></div>
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
                    <h5 class="text-primary font-weight-normal">Đăng bài</h5>
                    <div class="row m-0">
                        <div class="col-md-12 p-0">
                            <div class="d-inline-block w-100">
                                
                                <span class="text-primary">Trạng thái:</span>
                                <div class="form-group mt-1">
                                    <div class="input-group">
                                        <?= $form_page->render('status') ?>
                                        <div class="invalid-tooltip"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="d-inline-block w-100">
                                
                                <span class="text-primary">Slug:</span>
                                <div class="form-group mt-1">
                                    <div class="input-group">
                                        <?= $form_page->render('slug') ?>
                                        <div class="invalid-tooltip"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="d-inline-block w-100">
                                
                                <span class="text-primary">Giao diện:</span>
                                <div class="form-group mt-1">
                                    <div class="input-group">
                                        <?= $form_page->render('attribute_id') ?>
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
                    <div class="row m-0">
                        <div class="col-md-12 p-0">
                            <img id="showImg" src="<?php echo $page->featured_image ? $page->featured_image : '' ?>"
                                alt="" width="100%">
                            <?= $form_page->render('featured_image') ?>
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