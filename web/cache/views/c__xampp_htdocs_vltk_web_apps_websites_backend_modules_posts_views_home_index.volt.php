<main class="app-content">
        <div class="app-title">
            <div>
                <h1><i class="fa fa-th-list"></i>Thiết lập trang chủ</h1>
            </div>
            <ul class="app-breadcrumb breadcrumb side">
                <li class="breadcrumb-item"><a class="link" href="<?= $this->config->application->backendUri ?>"><i class="fa fa-home fa-lg"></i></a></li>
                <li class="breadcrumb-item">Trang chủ</li>
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
                                <h5 class="font-weight-bold text-primary"><?= ($dept_id == 1 ? 'Bộ môn' : 'Hướng nghiên cứu') ?></h5>
                                <div class="form-row mb-3">
                                    <div class="form-group col-md-12 m-0">
                                        <label for="">Tiêu đề</label>
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <div class="input-group-text fa fa-edit"></div>
                                            </div>
                                            <input type="text" id="specialized_title<?= $lang->id ?>" name="specialized_title[<?= $lang->id ?>]" class="form-control" placeholder="Tiêu đề" maxlength="255" data-error="Tiêu đề không đúng quy định.">
                                            <div class="invalid-tooltip"></div>
                                        </div>
                                    </div>
                                </div>

                                <h5 class="font-weight-bold text-primary">Lãnh đạo</h5>
                                <div class="form-row mb-3">
                                    <div class="form-group col-md-12 m-0">
                                        <label for="">Tiêu đề</label>
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <div class="input-group-text fa fa-edit"></div>
                                            </div>
                                            <input type="text" id="staff_title<?= $lang->id ?>" name="staff_title[<?= $lang->id ?>]" class="form-control" placeholder="Tiêu đề" maxlength="255" data-error="Tiêu đề không đúng quy định.">
                                            <div class="invalid-tooltip"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-row mb-3">
                                    <div class="form-group col-md-12 m-0">
                                        <label for="">Giới thiệu</label>
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <div class="input-group-text fa fa-edit"></div>
                                            </div>
                                            <textarea rows="4" id="staff_des<?= $lang->id ?>" name="staff_des[<?= $lang->id ?>]" class="form-control" placeholder="Giới thiệu"></textarea>
                                            <div class="invalid-tooltip"></div>
                                        </div>
                                    </div>
                                </div>

                                <h5 class="font-weight-bold text-primary">Liên kết</h5>
                                <div class="form-row mb-3">
                                    <div class="form-group col-md-12 m-0">
                                        <label for="">Tiêu đề</label>
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <div class="input-group-text fa fa-edit"></div>
                                            </div>
                                            <input type="text" id="partner_title<?= $lang->id ?>" name="partner_title[<?= $lang->id ?>]" class="form-control" placeholder="Tiêu đề" maxlength="255" data-error="Tiêu đề không đúng quy định.">
                                            <div class="invalid-tooltip"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-row mb-3">
                                    <div class="form-group col-md-12 m-0">
                                        <label for="">Giới thiệu</label>
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <div class="input-group-text fa fa-edit"></div>
                                            </div>
                                            <textarea rows="4" id="partner_des<?= $lang->id ?>" name="partner_des[<?= $lang->id ?>]" class="form-control" placeholder="Giới thiệu"></textarea>
                                            <div class="invalid-tooltip"></div>
                                        </div>
                                    </div>
                                </div>

                                <h5 class="font-weight-bold text-primary">Liên hệ</h5>
                                <div class="form-row mb-3">
                                    <div class="form-group col-md-12 m-0">
                                        <label for="">Tiêu đề</label>
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <div class="input-group-text fa fa-edit"></div>
                                            </div>
                                            <input type="text" id="contact_title<?= $lang->id ?>" name="contact_title[<?= $lang->id ?>]" class="form-control" placeholder="Tiêu đề" maxlength="255" data-error="Tiêu đề không đúng quy định.">
                                            <div class="invalid-tooltip"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-row mb-3">
                                    <div class="form-group col-md-12 m-0">
                                        <label for="">Giới thiệu</label>
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <div class="input-group-text fa fa-edit"></div>
                                            </div>
                                            <textarea rows="4" id="contact_des<?= $lang->id ?>" name="contact_des[<?= $lang->id ?>]" class="form-control" placeholder="Giới thiệu"></textarea>
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
                        <div class="row m-0">
                            <h5 class="font-weight-bold text-primary w-100">Tin tức</h5>
                            <div class="animated-checkbox mb-3">
                                <label class="m-0">
                                    <input name="" type="checkbox"><span class="label-text">Liên kết bài viết với Khoa</span>
                                </label>
                            </div>

                            <h5 class="font-weight-bold text-primary w-100"><?= ($dept_id == 1 ? 'Bộ môn' : 'Hướng nghiên cứu') ?></h5>
                            <div class="w-100 mb-3">
                                <img id="showImgSpecializedBg" src="" alt="" class="w-100">
                                <input type="hidden" id="specialized_bg" name="specialized_bg">
                                <a id="uploadImageSpecializedBg" href="#" class="link">Đặt ảnh nền <?= ($dept_id == 1 ? 'bộ môn' : 'hướng nghiên cứu') ?></a>
                            </div>

                            <h5 class="font-weight-bold text-primary w-100">Liên kết</h5>
                            <div class="w-100 mb-3">
                                <img id="showImgPartnerBg" src="" alt="" class="w-100">
                                <input type="hidden" id="partner_bg" name="partner_bg">
                                <a id="uploadImagePartnerBg" href="#" class="link">Đặt ảnh nền <?= ($dept_id == 1 ? 'bộ môn' : 'hướng nghiên cứu') ?></a>
                            </div>

                            <div class="w-100">
                                <button type="submit" class="btn btn-success float-right btn-sm">Cập nhật</button>
                            </div>
                        </div>
                    </div>
                </div>
    
                <input class="tokenCSRF" type="hidden" name="<?= $this->security->getTokenKey() ?>" value="<?= $this->security->getToken() ?>">
            </form>
        </div>
    </main>