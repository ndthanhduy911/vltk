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
                <div class="col-md-12 p-0">
                    <div class="bs-component bg-white rounded">
                        <ul class="nav nav-tabs">
                            <li class="nav-item"><a style="font-size : 1rem" class="nav-link font-weight-bold active" data-toggle="tab" href="#banner">Banner</a></li>
                            <li class="nav-item"><a style="font-size : 1rem" class="nav-link font-weight-bold" data-toggle="tab" href="#posts">Thông báo</a></li>
                            <li class="nav-item"><a style="font-size : 1rem" class="nav-link font-weight-bold" data-toggle="tab" href="#depts">Bộ môn</a></li>
                            <li class="nav-item"><a style="font-size : 1rem" class="nav-link font-weight-bold" data-toggle="tab" href="#staffs">Lãnh đạo</a></li>
                            <li class="nav-item"><a style="font-size : 1rem" class="nav-link font-weight-bold" data-toggle="tab" href="#partners">Liên kết</a></li>
                            <li class="nav-item"><a style="font-size : 1rem" class="nav-link font-weight-bold" data-toggle="tab" href="#contacts">Liên hệ</a></li>
                        </ul>
                        <div class="tab-content p-3">
                            <div class="tab-pane fade active show" id="banner">
                                <form class="col-md-12 p-0" method="POST" enctype="multipart/form-data" data-toggle="validator" role="form" action="<?= $this->config->application->backendUri ?>/home/update/1">

                                    <div class="form-row">
                                        <div class="form-group col-md-12 mb-3">
                                            <label for="">Cài đặt</label>
                                            <div class="input-group">
                                                <textarea name="setting" class="form-control"></textarea>
                                                <div class="invalid-tooltip"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-row mt-3">
                                        <div class="col-md-12">
                                            <button type="submit" class="btn btn-success float-left btn-sm">Cập nhật</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="tab-pane fade" id="posts">
                                <form class="col-md-12 p-0" method="POST" enctype="multipart/form-data" data-toggle="validator" role="form" action="<?= $this->config->application->backendUri ?>/home/update/2">
                                    <ul class="nav nav-tabs">
                                        <li class="nav-item"><a style="font-size : 1rem" class="nav-link font-weight-bold active" data-toggle="tab" href="#viPosts">Tiếng Việt</a></li>
                                        <li class="nav-item"><a style="font-size : 1rem" class="nav-link font-weight-bold" data-toggle="tab" href="#enPosts">Tiếng Anh</a></li>
                                    </ul>
                                    <div class="tab-content p-3 border rounded-bottom mb-3">
                                        <div class="tab-pane fade active show" id="viPosts">
                                            <div class="form-row">
                                                <div class="form-group col-md-12 mb-3">
                                                    <label for="">Tiêu đề</label>
                                                    <div class="input-group">
                                                        <input type="text" name="title[1]" class="form-control">
                                                        <div class="invalid-tooltip"></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-row">
                                                <div class="form-group col-md-12 mb-3">
                                                    <label for="">Giới thiệu</label>
                                                    <div class="input-group">
                                                        <textarea name="description[1]" class="form-control"></textarea>
                                                        <div class="invalid-tooltip"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane fade rounded" id="enPosts">
                                            <div class="form-row">
                                                <div class="form-group col-md-12 mb-3">
                                                    <label for="">Tiêu đề</label>
                                                    <div class="input-group">
                                                        <input type="text" name="title[2]" class="form-control">
                                                        <div class="invalid-tooltip"></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-row">
                                                <div class="form-group col-md-12 mb-3">
                                                    <label for="">Giới thiệu</label>
                                                    <div class="input-group">
                                                        <textarea name="description[2]" class="form-control"></textarea>
                                                        <div class="invalid-tooltip"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-md-12 mb-3">
                                            <label for="">Cài đặt</label>
                                            <div class="input-group">
                                                <textarea name="" class="form-control"></textarea>
                                                <div class="invalid-tooltip"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-md-12 mb-3">
                                            <label for="">Hình nền</label>
                                            <div class="w-100">
                                                <img id="showImg" src="#" alt="" width="100%">
                                                <input type="hidden" name="background">
                                                <a href="#" class="link">Đặt hình nền</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-row mt-3">
                                        <div class="col-md-12">
                                            <button type="submit" class="btn btn-success float-left btn-sm">Cập nhật</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="tab-pane fade" id="depts">
                                <form class="col-md-12 p-0" method="POST" enctype="multipart/form-data" data-toggle="validator" role="form" action="<?= $this->config->application->backendUri ?>/home/update/3">
                                    <ul class="nav nav-tabs">
                                        <li class="nav-item"><a style="font-size : 1rem" class="nav-link font-weight-bold active" data-toggle="tab" href="#viDepts">Tiếng Việt</a></li>
                                        <li class="nav-item"><a style="font-size : 1rem" class="nav-link font-weight-bold" data-toggle="tab" href="#enDepts">Tiếng Anh</a></li>
                                    </ul>
                                    <div class="tab-content p-3 border rounded-bottom mb-3">
                                        <div class="tab-pane fade active show" id="viDepts">
                                            <div class="form-row">
                                                <div class="form-group col-md-12 mb-3">
                                                    <label for="">Tiêu đề</label>
                                                    <div class="input-group">
                                                        <input type="text" name="title[1]" class="form-control">
                                                        <div class="invalid-tooltip"></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-row">
                                                <div class="form-group col-md-12 mb-3">
                                                    <label for="">Giới thiệu</label>
                                                    <div class="input-group">
                                                        <textarea name="description[1]" class="form-control"></textarea>
                                                        <div class="invalid-tooltip"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane fade rounded" id="enDepts">
                                            <div class="form-row">
                                                <div class="form-group col-md-12 mb-3">
                                                    <label for="">Tiêu đề</label>
                                                    <div class="input-group">
                                                        <input type="text" name="title[2]" class="form-control">
                                                        <div class="invalid-tooltip"></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-row">
                                                <div class="form-group col-md-12 mb-3">
                                                    <label for="">Giới thiệu</label>
                                                    <div class="input-group">
                                                        <textarea name="description[2]" class="form-control"></textarea>
                                                        <div class="invalid-tooltip"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-md-12 mb-3">
                                            <label for="">Cài đặt</label>
                                            <div class="input-group">
                                                <textarea name="setting" class="form-control"></textarea>
                                                <div class="invalid-tooltip"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-md-12 mb-3">
                                            <label for="">Hình nền</label>
                                            <div class="w-100">
                                                <img id="showImg" src="#" alt="" width="100%">
                                                <input type="hidden" name="background">
                                                <a href="#" class="link">Đặt hình nền</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-row mt-3">
                                        <div class="col-md-12">
                                            <button type="submit" class="btn btn-success float-left btn-sm">Cập nhật</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="tab-pane fade" id="staffs">
                                <form class="col-md-12 p-0" method="POST" enctype="multipart/form-data" data-toggle="validator" role="form" action="<?= $this->config->application->backendUri ?>/home/update/4">
                                    <ul class="nav nav-tabs">
                                        <li class="nav-item"><a style="font-size : 1rem" class="nav-link font-weight-bold active" data-toggle="tab" href="#viStaffs">Tiếng Việt</a></li>
                                        <li class="nav-item"><a style="font-size : 1rem" class="nav-link font-weight-bold" data-toggle="tab" href="#enStaffs">Tiếng Anh</a></li>
                                    </ul>
                                    <div class="tab-content p-3 border rounded-bottom mb-3">
                                        <div class="tab-pane fade active show" id="viStaffs">
                                            <div class="form-row">
                                                <div class="form-group col-md-12 mb-3">
                                                    <label for="">Tiêu đề</label>
                                                    <div class="input-group">
                                                        <input type="text" name="title[1]" class="form-control">
                                                        <div class="invalid-tooltip"></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-row">
                                                <div class="form-group col-md-12 mb-3">
                                                    <label for="">Giới thiệu</label>
                                                    <div class="input-group">
                                                        <textarea name="description[1]" class="form-control"></textarea>
                                                        <div class="invalid-tooltip"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane fade rounded" id="enStaffs">
                                            <div class="form-row">
                                                <div class="form-group col-md-12 mb-3">
                                                    <label for="">Tiêu đề</label>
                                                    <div class="input-group">
                                                        <input type="text" name="title[2]" class="form-control">
                                                        <div class="invalid-tooltip"></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-row">
                                                <div class="form-group col-md-12 mb-3">
                                                    <label for="">Giới thiệu</label>
                                                    <div class="input-group">
                                                        <textarea name="description[2]" class="form-control"></textarea>
                                                        <div class="invalid-tooltip"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-md-12 mb-3">
                                            <label for="">Cài đặt</label>
                                            <div class="input-group">
                                                <textarea name="setting" class="form-control"></textarea>
                                                <div class="invalid-tooltip"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-md-12 mb-3">
                                            <label for="">Hình nền</label>
                                            <div class="w-100">
                                                <img id="showImg" src="#" alt="" width="100%">
                                                <input type="hidden" name="background">
                                                <a href="#" class="link">Đặt hình nền</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-row mt-3">
                                        <div class="col-md-12">
                                            <button type="submit" class="btn btn-success float-left btn-sm">Cập nhật</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="tab-pane fade" id="partners">
                                <form class="col-md-12 p-0" method="POST" enctype="multipart/form-data" data-toggle="validator" role="form" action="<?= $this->config->application->backendUri ?>/home/update/5">
                                    <ul class="nav nav-tabs">
                                        <li class="nav-item"><a style="font-size : 1rem" class="nav-link font-weight-bold active" data-toggle="tab" href="#viPartners">Tiếng Việt</a></li>
                                        <li class="nav-item"><a style="font-size : 1rem" class="nav-link font-weight-bold" data-toggle="tab" href="#enPartners">Tiếng Anh</a></li>
                                    </ul>
                                    <div class="tab-content p-3 border rounded-bottom mb-3">
                                        <div class="tab-pane fade active show" id="viPartners">
                                            <div class="form-row">
                                                <div class="form-group col-md-12 mb-3">
                                                    <label for="">Tiêu đề</label>
                                                    <div class="input-group">
                                                        <input type="text" name="title[1]" class="form-control">
                                                        <div class="invalid-tooltip"></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-row">
                                                <div class="form-group col-md-12 mb-3">
                                                    <label for="">Giới thiệu</label>
                                                    <div class="input-group">
                                                        <textarea name="description[1]" class="form-control"></textarea>
                                                        <div class="invalid-tooltip"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane fade rounded" id="enPartners">
                                            <div class="form-row">
                                                <div class="form-group col-md-12 mb-3">
                                                    <label for="">Tiêu đề</label>
                                                    <div class="input-group">
                                                        <input type="text" name="title[2]" class="form-control">
                                                        <div class="invalid-tooltip"></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-row">
                                                <div class="form-group col-md-12 mb-3">
                                                    <label for="">Giới thiệu</label>
                                                    <div class="input-group">
                                                        <textarea name="description[2]" class="form-control"></textarea>
                                                        <div class="invalid-tooltip"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-md-12 mb-3">
                                            <label for="">Cài đặt</label>
                                            <div class="input-group">
                                                <textarea name="setting" class="form-control"></textarea>
                                                <div class="invalid-tooltip"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-md-12 mb-3">
                                            <label for="">Hình nền</label>
                                            <div class="w-100">
                                                <img id="showImg" src="#" alt="" width="100%">
                                                <input type="hidden" name="background">
                                                <a href="#" class="link">Đặt hình nền</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-row mt-3">
                                        <div class="col-md-12">
                                            <button type="submit" class="btn btn-success float-left btn-sm">Cập nhật</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="tab-pane fade" id="contacts">
                                <form class="col-md-12 p-0" method="POST" enctype="multipart/form-data" data-toggle="validator" role="form" action="<?= $this->config->application->backendUri ?>/home/update/6">
                                    <ul class="nav nav-tabs">
                                        <li class="nav-item"><a style="font-size : 1rem" class="nav-link font-weight-bold active" data-toggle="tab" href="#viContacts">Tiếng Việt</a></li>
                                        <li class="nav-item"><a style="font-size : 1rem" class="nav-link font-weight-bold" data-toggle="tab" href="#enContacts">Tiếng Anh</a></li>
                                    </ul>
                                    <div class="tab-content p-3 border rounded-bottom mb-3">
                                        <div class="tab-pane fade active show" id="viContacts">
                                            <div class="form-row">
                                                <div class="form-group col-md-12 mb-3">
                                                    <label for="">Tiêu đề</label>
                                                    <div class="input-group">
                                                        <input type="text" name="title[1]" class="form-control">
                                                        <div class="invalid-tooltip"></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-row">
                                                <div class="form-group col-md-12 mb-3">
                                                    <label for="">Giới thiệu</label>
                                                    <div class="input-group">
                                                        <textarea name="description[1]" class="form-control"></textarea>
                                                        <div class="invalid-tooltip"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane fade rounded" id="enContacts">
                                            <div class="form-row">
                                                <div class="form-group col-md-12 mb-3">
                                                    <label for="">Tiêu đề</label>
                                                    <div class="input-group">
                                                        <input type="text" name="title[2]" class="form-control">
                                                        <div class="invalid-tooltip"></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-row">
                                                <div class="form-group col-md-12 mb-3">
                                                    <label for="">Giới thiệu</label>
                                                    <div class="input-group">
                                                        <textarea name="description[2]" class="form-control"></textarea>
                                                        <div class="invalid-tooltip"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-md-12 mb-3">
                                            <label for="">Cài đặt</label>
                                            <div class="input-group">
                                                <textarea name="setting" class="form-control"></textarea>
                                                <div class="invalid-tooltip"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-md-12 mb-3">
                                            <label for="">Hình nền</label>
                                            <div class="w-100">
                                                <img id="showImg" src="#" alt="" width="100%">
                                                <input type="hidden" name="background">
                                                <a href="#" class="link">Đặt hình nền</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-row mt-3">
                                        <div class="col-md-12">
                                            <button type="submit" class="btn btn-success float-left btn-sm">Cập nhật</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
    
                <!-- <input class="tokenCSRF" type="hidden" name="<?= $this->security->getTokenKey() ?>"
                    value="<?= $this->security->getToken() ?>"> -->
            </form>
        </div>
    </main>