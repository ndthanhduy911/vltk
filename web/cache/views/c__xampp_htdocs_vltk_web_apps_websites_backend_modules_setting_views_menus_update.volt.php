<main class="app-content">
    <div class="app-title">
        <div>
            <h1><i class="fa fa-th-list"></i> <?= $title ?> menu</h1>
        </div>
        <ul class="app-breadcrumb breadcrumb side">
            <li class="breadcrumb-item"><a class="link" href="<?= $this->config->application->backendUri ?>"><i class="fa fa-home fa-lg"></i></a></li>
            <li class="breadcrumb-item"><a class="link" href="<?= $this->config->application->backendUri ?>/menu">Menu</a></li>
            <li class="breadcrumb-item"><?= $title ?></li>
        </ul>
    </div>

    <div class="body-message">
        <?php echo $this->flashSession->output(); ?>
    </div>

    <div class="row">
        <form id="frmMenus" class="col-md-12 row p-0 m-0" method="post" enctype="multipart/form-data" data-toggle="validator" role="form">
            <div class="col-md-4 p-0">
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
                            <h5 class="text-primary font-weight-normal">Tiêu đề</h5>
                            <div class="form-group m-0">
                                <div class="input-group">
                                    <?= $forms_lang[$lang->id]->render('name', ['id' => 'name' . $lang->id, 'name' => 'name[' . $lang->id . ']']) ?>
                                    <div class="invalid-tooltip"></div>
                                </div>
                            </div>
                        </div>
                        <?php } ?>
                    </div>
                </div>
            </div>

            <div class="col-md-4 pr-0">
                <div class="tile p-3">
                    <div class="row m-0">
                        <div class="col-md-12 p-0">
                            <span class="text-primary">Menu gốc</span>
                            <div class="form-group mt-1">
                                <div class="input-group">
                                    <?= $form_menu->render('parent_id') ?>
                                    <div class="invalid-tooltip"></div>
                                </div>
                            </div>
                            <div class="d-inline-block w-100 mb-2">
                                <span class="text-primary">Loại menu</span>
                                <div class="form-group mt-1">
                                    <div class="input-group">
                                        <?= $form_menu->render('type') ?>
                                        <div class="invalid-tooltip"></div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="typeSeleted w-100 mb-2 <?= ($menu->post_id && $menu->type == 1 ? '' : 'hidden') ?>" data-type="1">
                                <span class="text-primary">Bài viết</span>
                                <div class="form-group mt-1">
                                    <div class="input-group"">
                                        <?= $form_menu->render('post_id') ?>
                                        <div class="invalid-tooltip"></div>
                                    </div>
                                </div>
                            </div>

                            <div class="typeSeleted w-100 mb-2 <?= ($menu->page_id && $menu->type == 2 ? '' : 'hidden') ?>" data-type="2">
                                <span class="text-primary">Trang</span>
                                <div class="form-group mt-1">
                                    <div class="input-group">
                                        <?= $form_menu->render('page_id') ?>
                                        <div class="invalid-tooltip"></div>
                                    </div>
                                </div>
                            </div>

                            <div class="typeSeleted w-100 mb-2 <?= ($menu->cat_id && $menu->type == 3 ? '' : 'hidden') ?>" data-type="3">
                                <span class="text-primary">Danh mục</span>
                                <div class="form-group mt-1">
                                    <div class="input-group">
                                        <?= $form_menu->render('cat_id') ?>
                                        <div class="invalid-tooltip"></div>
                                    </div>
                                </div>
                            </div>

                            <div class="typeSeleted w-100 mb-2 <?= ($menu->dept && $menu->type == 4 ? '' : 'hidden') ?>" data-type="4">
                                <span class="text-primary">Bộ môn</span>
                                <div class="form-group mt-1">
                                    <div class="input-group">
                                        <?= $form_menu->render('dept') ?>
                                        <div class="invalid-tooltip"></div>
                                    </div>
                                </div>
                            </div>

                            <div class="typeSeleted w-100 mb-2 <?= ($menu->type == 5 ? '' : 'hidden') ?>" data-type="5">
                                <span class="text-primary">Link</span>
                                <div class="form-group mt-1">
                                    <div class="input-group">
                                        <?= $form_menu->render('links') ?>
                                        <div class="invalid-tooltip"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-4 pr-0">
                <div class="tile p-3">
                    <div class="row m-0">
                        <div class="col-md-12 p-0">
                            <span class="text-primary">Trạng thái</span>
                            <div class="form-group mt-1">
                                <div class="input-group">
                                    <?= $form_menu->render('status') ?>
                                    <div class="invalid-tooltip"></div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-12 p-0">
                            <span class="text-primary">Biểu tượng</span>
                            <div class="form-group mt-1">
                                <div class="input-group">
                                    <?= $form_menu->render('icon') ?>
                                    <div class="invalid-tooltip"></div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-12 p-0">
                            <span class="text-primary">Mục tiêu</span>
                            <div class="form-group mt-1">
                                <div class="input-group">
                                    <?= $form_menu->render('target') ?>
                                    <div class="invalid-tooltip"></div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-12 p-0">
                            <span class="text-primary">Sắp xếp</span>
                            <div class="form-group mt-1">
                                <div class="input-group">
                                    <?= $form_menu->render('sort') ?>
                                    <div class="invalid-tooltip"></div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-12 p-0">
                            <button type="submit" class="btn btn-success float-right btn-sm"><?= $title ?></button>
                        </div>
                    </div>
                </div>
            </div>
            <input class="tokenCSRF" type="hidden" name="<?= $this->security->getTokenKey() ?>" value="<?= $this->security->getToken() ?>">
        </form>
    </div>
</main>