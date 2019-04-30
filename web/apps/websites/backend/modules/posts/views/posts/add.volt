<main class="app-content">
    <div class="app-title">
        <div>
            <h1><i class="fa fa-th-list"></i> THÊM BÀI VIẾT</h1>
            <p>Thêm mới bài viết</p>
        </div>
        <ul class="app-breadcrumb breadcrumb side">
            <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
            <li class="breadcrumb-item">Bài viết</li>
            <li class="breadcrumb-item">Thêm mới</li>
        </ul>
    </div>
    <div class="body-message">
        <?php echo $this->flashSession->output(); ?>
    </div>
    <div class="row">
        <form class="col-md-12 row p-0 m-0" id="frmGalary" method="post" enctype="multipart/form-data" data-toggle="validator"
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
                                    {{form.render('title')}}
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
                            <div id="editor" class="rounded">

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
                                        <div class="input-group-text fa fa-list-alt"></div>
                                    </div>
                                    {{form.render('except')}}
                                    <div class="invalid-tooltip"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-3 pr-0">
                <h5 class="font-weight-normal text-primary">Đăng bài</h5>
                <div class="tile">
                    <div class="row m-0">
                        <div class="col-md-12 p-0 mb-2">
                            <a href="#" class="btn btn-info btn-sm pull-left">Xem trước</a>
                        </div>

                        <div class="col-md-12 p-0">
                            <div class="d-inline-block w-100 mb-2">
                                <i class="fa fa-key mr-1"></i>
                                <span class="f-s-90">Trạng thái:</span>
                                <select name="status" id="status" class="ml-1 form-control-sm pull-right">
                                    <option value="1">Chờ duyệt</option>
                                    <option value="2">Bản nháp</option>
                                </select>
                            </div>
                            <div class="d-inline-block w-100 mb-2">
                                <i class="fa fa-eye  mr-1"></i>
                                <span class="f-s-90">Hiển thị:</span>
                                <select name="visibility" id="visibility" class="ml-1 form-control-sm pull-right">
                                    <option value="1">Công khai</option>
                                    <option value="2">Có mật khẩu</option>
                                    <option value="3">Riêng tư</option>
                                </select>
                            </div>
                            <div class="d-inline-block w-100 mb-2">
                                <i class="fa fa-calendar"></i>
                                <span class="f-s-90">Lịch:</span>
                                <input type="text" class="form-control-sm pull-right" name="calendar">
                            </div>
                        </div>
                        <div class="col-md-12 p-0">
                            <button type="submit" class="btn btn-success float-right btn-sm">Đăng bài</button>
                        </div>

                    </div>
                </div>

                <h5 class="font-weight-normal text-primary">Danh mục</h5>
                <div class="tile">
                    <div class="row m-0">
                        <div class="col-md-12 p-0">
                            <select name="visibility" id="visibility" class="ml-1 form-control-sm pull-right w-100">
                                <option value="1">Khác</option>
                                <option value="2">Tin giáo vụ</option>
                                <option value="3">Tin serminar</option>
                                <option value="4">Tin CB-NV</option>
                            </select>
                        </div>
                    </div>
                </div>

                <!-- <h5 class="font-weight-normal text-primary">Thẻ</h5>
                <div class="tile">
                    <div class="row m-0">
                        <div class="col-md-12 p-0">
                            <select name="visibility" id="visibility" class="ml-1 form-control-sm pull-right w-100">
                                <option value="1">Khác</option>
                                <option value="2">Tin giáo vụ</option>
                                <option value="3">Tin serminar</option>
                                <option value="4">Tin CB-NV</option>
                            </select>
                        </div>
                    </div>
                </div> -->

                <h5 class="font-weight-normal text-primary">Ảnh đại diện</h5>
                <div class="tile">
                    <div class="row m-0">
                        <div class="col-md-12 p-0">
                            <img id="showImg" src="" alt="" width="100%">
                            <input id="uploadImageValue" name="file" type="text" hidden>
                            <a id="uploadImage" href="#" class="link">Đặt ảnh đại diện</a>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</main>