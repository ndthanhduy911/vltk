<main class="app-content">
    <div class="app-title">
        <div>
            <h1><i class="fa fa-th-list"></i> CẬP NHẬT BÀI VIẾT</h1>
            <p><?php echo $post->title ? 'Cập nhật bài viết': 'Thêm bài viết mới' ?></p>
        </div>
        <ul class="app-breadcrumb breadcrumb side">
            <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
            <li class="breadcrumb-item">Trang</li>
            <li class="breadcrumb-item">{{title}}</li>
        </ul>
    </div>

    <div class="body-message m-0">
        <?php echo $this->flashSession->output(); ?>
    </div>

    <div class="row">
        <form class="col-md-12 row p-0 m-0" method="post" enctype="multipart/form-data" data-toggle="validator"
            role="form">
            <div class="col-md-9 p-0">
                <h5 class="font-weight-normal text-primary">Tiêu đề</h5>
                <div class="tile p-3">
                    <div class="modal-body p-0">
                        <div class="form-row">
                            <div class="form-group col-md-12 m-0">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text fa fa-header"></div>
                                    </div>
                                    {{form.render('title')}}
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
                                    {{form.render('excerpt')}}
                                    <div class="invalid-tooltip"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <h5 class="font-weight-normal text-primary">Nội dung</h5>
                <div class="tile p-0">
                    <div class="row m-0">
                        <div class="col-md-12 p-0">
                            <div class="form-group mb-0">
                                <div class="input-group">
                                    <textarea id="editor" name="content" class="rounded" >
                                        {{post.content}}
                                    </textarea>
                                    <div class="invalid-tooltip"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-3 pr-0">
                <h5 class="font-weight-normal text-primary">SLUG</h5>
                <div class="tile p-3">
                    <div class="row m-0">
                        <div class="col-md-12 p-0">
                            <div class="form-group mb-0">
                                <div class="input-group">
                                    {{form.render('slug')}}
                                    <div class="invalid-tooltip"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <h5 class="font-weight-normal text-primary">Đăng bài</h5>
                <div class="tile p-3">
                    <div class="row m-0">
                        <div class="col-md-12 p-0">
                            <i class="fa fa-key"></i>
                            <span class="f-s-90">Trạng thái:</span>
                            <div class="form-group mt-1">
                                <div class="input-group">
                                    {{form.render('status')}}
                                    <div class="invalid-tooltip"></div>
                                </div>
                            </div>
                            <div class="d-inline-block w-100 mb-2">
                                <i class="fa fa-calendar"></i>
                                <span class="f-s-90">Lịch:</span>
                                <div class="form-group mt-1">
                                    <div class="input-group">
                                        {{form.render('calendar')}}
                                        <div class="invalid-tooltip"></div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-12 p-0">
                            <button type="submit" class="btn btn-success float-right btn-sm">{{title}}</button>
                        </div> 
                    </div>
                </div>
                <h5 class="font-weight-normal text-primary">Danh mục</h5>
                <div class="tile p-3">
                    <div class="row m-0">
                        <div class="col-md-12 p-0">
                            <div class="form-group mb-0">
                                <div class="input-group">
                                    {{form.render('cat_id')}}
                                    <div class="invalid-tooltip"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <h5 class="font-weight-normal text-primary">Ảnh đại diện</h5>
                <div class="tile p-3">
                    <div class="row m-0">
                        <div class="col-md-12 p-0">
                            <img id="showImg" src="<?php echo $post->featured_image ? $post->featured_image : '' ?>" alt="" width="100%">
                            {{form.render('featured_image')}}
                            <a id="uploadImage" href="#" class="link">Đặt ảnh đại diện</a>
                        </div>
                    </div>
                </div>
            </div>
            <input class="tokenCSRF" type="hidden" name="{{ security.getTokenKey() }}" value="{{ security.getToken() }}">
        </form>
    </div>
</main>