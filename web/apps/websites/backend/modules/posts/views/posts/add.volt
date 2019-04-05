<main class="app-content">
    <div class="app-title">
        <div>
            <h1><i class="fa fa-th-list"></i> BÀI VIẾT</h1>
            <p>Thêm mới bài viết</p>
        </div>
        <ul class="app-breadcrumb breadcrumb side">
            <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
            <li class="breadcrumb-item">Bài viết</li>
            <li class="breadcrumb-item">Thêm mới</li>
        </ul>
    </div>
    <div class="row m-0">
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

                <h5 class="font-weight-normal text-primary">URL</h5>
                <div class="tile p-0">
                    <div class="modal-body pb-0">
                        <div class="form-row">
                            <div class="form-group col-md-12">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text fa fa-link"></div>
                                    </div>
                                    {{form.render('title')}}
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
                        <div class="col-md-6 p-0 mb-2">
                            <a href="#" class="btn btn-warning btn-sm pull-left">Lưu nháp</a>
                        </div>

                        <div class="col-md-6 p-0 mb-2">
                            <a href="#" class="btn btn-info btn-sm pull-right">Xem trước</a>
                        </div>

                        <div class="col-md-12 p-0">
                            <p class="small"><i class="fa fa-key  mr-1"></i>Trạng thái:
                                <select name="status" id="status" class="ml-1 form-control-sm pull-right">
                                    <option value="1">Chờ duyệt</option>
                                    <option value="2">Bản nháp</option>
                                </select>
                            </p>
                            <p class="small"><i class="fa fa-eye  mr-1"></i>Hiển thị:
                                <select name="visibility" id="visibility" class="ml-1 form-control-sm pull-right">
                                    <option value="1">Công khai</option>
                                    <option value="2">Có mật khẩu</option>
                                    <option value="3">Riêng tư</option>
                                </select>
                            </p>
                            <p class="small d-flex"><i class="fa fa-calendar mr-1 mt-1"></i>Lịch:
                                <input type="text" class="form-control-sm" name="calendar">
                            </p>
                        </div>
                        <div class="col-md-12 p-0">
                            <a href="#" class="btn btn-success float-right btn-sm">Đăng bài</a>
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

                <h5 class="font-weight-normal text-primary">Thẻ</h5>
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

                <h5 class="font-weight-normal text-primary">Ảnh đại diện</h5>
                <div class="tile">
                    <div class="row m-0">
                        <div class="col-md-12 p-0">
                            <img id="showImg" src="" alt="">
                            <input name="file" type="file" hidden>
                            <a href="#" class="link" data-toggle="modal" data-target="#modalImg">Đặt ảnh đại diện</a>
                        </div>
                    </div>
                </div>
            </div>

        </form>
    </div>
</main>

<div class="modal" id="modalImg" id="modalImg" tabindex="-1" role="dialog" aria-labelledby="modalImgLabel" aria-hidden="true">
    <div class="modal-dialog" role="document" style="min-width: 90%">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Ảnh đại diện</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
            </div>
            <form id="frmImg" method="post" enctype="multipart/form-data" data-toggle="validator" role="form">
                <div class="modal-body">
                    <div id="elfinder"></div>
                </div>
                <div class="modal-footer">
                    <button id="btnSummitImg" type="submit" class="btn btn-success">Chọn</button>
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Đóng</button>
                </div>
            </form>
        </div>
    </div>
</div>