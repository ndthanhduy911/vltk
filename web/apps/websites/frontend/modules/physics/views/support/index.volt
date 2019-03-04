<div class="container-fluid">
    <div class="w-100">
        <div class="card p-t-16 p-b-16 p-l-16 p-r-16">
            <form action="/support/import" method="POST">
                <div id="fileimport">
                    <div class="dropdown" style="display: inline-block">
                        <a href="#" class="dropdown-toggle btn btn-round btn-info m-b-0 m-t-0" data-toggle="dropdown">Tải
                            biểu mẫu hỗ trợ <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="/files/forms/importemailform.xlsx">Tạo email mới</a></li>
                            <li><a class="dropdown-item" href="/files/forms/importotherform.xlsx">Các dịch vụ khác</a></li>
                        </ul>
                    </div>

                    <div class="fileinput fileinput-new text-center m-b-0" data-provides="fileinput">
                        <span class="btn btn-round btn-success btn-file">
                            <span class="fileinput-new">Thêm mẫu sử dụng</span>
                            <input style="cursor: pointer" type="file" name="fileimport" />
                        </span>
                    </div>
                </div>
            </form>
            <form id="supportForm" action="/support" class="contact-form" method="POST" novalidate enctype="multipart/form-data">
                <legend class="m-b-0 m-t-10 f-s-16">Dịch vụ</legend>
                <div class="input-group">
                    <span class="input-group-addon">
                        <i class="material-icons">inbox</i>
                    </span>
                    <div class="form-group label-floating">
                        {{ formSuport.render('package_id') }}
                    </div>
                    <div class="invalid-tooltip"></div>
                </div>
                <legend class="m-b-0 m-t-10 f-s-16">Yêu cầu</legend>
                <div class="row">
                    <div class="col-md-12 checkbox-radios">
                        <div class="radio">
                            <label>
                                <input disabled id="req_package1" type="radio" name="req_package" required value="update"> Yêu cầu thêm mới, nâng cấp hoặc sửa chữa
                            </label>
                        </div>
                        <div class="radio">
                            <label>
                                <input disabled id="req_package3" type="radio" name="req_package" required value="other"> Yêu cầu khác
                            </label>
                        </div>
                    </div>
                </div>
                <div class="w-100">
                    <div class="content-support">
                        <div class="m-3 border rounded  border-danger">
                            <h4 class="text-info">Vui lòng chọn
                                <strong class="text-danger">DỊCH VỤ</strong> và
                                <strong class="text-danger">YÊU CẦU</strong> bạn cần hỗ trợ để chúng tôi có thể hỗ
                                trợ bạn tốt nhất.
                            </h4>
                        </div>
                    </div>
                    <div class="col-md-12 text-left mt-3 submitSupport" style="display: none">
                        <button type="submit" class="btn btn-primary btn-md disabled">Gửi yêu cầu</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>