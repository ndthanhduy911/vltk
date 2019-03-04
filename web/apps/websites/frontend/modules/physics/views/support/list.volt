<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header card-header-icon" data-background-color="red">
                    <i class="material-icons">assignment</i>
                </div>
                <div class="card-content">
                    <h4 class="card-title">DANH SÁCH YÊU CẦU HỖ TRỢ</h4>
                    <div class="toolbar">
                        <!--        Here you can write extra buttons/actions for the toolbar              -->
                    </div>
                    <div class="material-datatables">
                        <table id="account" class="table table-striped table-no-bordered table-hover" cellspacing="0"
                            width="100%" style="width:100%">
                            <thead>
                                <tr class="f-s-12 bg-primary" style="height: 60px">
                                    <th class="text-white text-center align-middle">#</th>
                                    <th class="text-white text-center align-middle">Mã hỗ trợ</th>
                                    <th class="text-white text-justify align-middle">Nội dung yêu cầu</th>
                                    <th class="text-white text-center align-middle">Thời gian khởi tạo</th>
                                    <th class="text-white text-center align-middle">Thời gian hoàn thành</th>
                                    <th class="text-white text-center align-middle">Tình trạng</th>
                                    <th class="text-white text-center align-middle">Người thực hiện</th>
                                    <th class="disabled-sorting text-center align-middle">Thao tác</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php $stt = 1 ;?>
                                <?php foreach($supports as $key => $support){ ?>
                                <tr>
                                    <td>
                                        <?= $stt++ ?>
                                    </td>
                                    <td>{{support.ticket}}</td>
                                    <?php $content =json_decode($support->content); ?>
                                    <td>
                                        <a class="detail-link" href="/support/detail/{{support.id}}">
                                            <?= !empty($content->content) ? $content->content : 'Tạo tài khoản email mới' ?>
                                        </a>
                                    </td>
                                    <td>
                                        <?= date_format(date_create($support->created_at),"d-m-Y H:i"); ?>
                                    </td>
                                    <td>
                                        <?= $support->deadline?date_format(date_create($support->deadline),"d-m-Y H:i"):''; ?>
                                    </td>
                                    <td>
                                        <?= $this->helper->get_frontend_status_support($support->status) ?>
                                    </td>
                                    <?php
                                        $array_person = $support->assign_person_id ? json_decode($support->assign_person_id) : []; 
                                        $assign_person = ''; 
                                        foreach ($array_person as $key => $value) {
                                            $user_key = array_search($value, array_column($user, 'id'));
                                            $fullname = $user_key || $user_key===0 ? $user[$user_key]['fullname'] : '';
                                            $user_id = $user_key || $user_key===0 ? $user[$user_key]['id'] : '';
                                            if($key === 0){
                                                $assign_person .= "<a class='tb_assign_person_id text-primary' href='javascript:;' data-id='{$user_id}'>{$fullname};</a>";
                                            }else{
                                                $assign_person .= "<br><a class='tb_assign_person_id text-primary' href='javascript:;' data-id='{$user_id}'>{$fullname};</a>";
                                            }
                                            
                                        }?>
                                    <td>
                                        <?php echo $assign_person; ?>
                                    </td>
                                    <td>
                                        <div class="dropdown">
                                            <button type="button" class="btn btn-info btn-xs dropdown-toggle"
                                                data-toggle="dropdown">
                                                <i class="material-icons">build</i>
                                                <span class="caret"></span>
                                            </button>
                                            <ul class="dropdown-menu dropdown-menu-right" role="menu">
                                                <li>
                                                    {% if support.status !== '2' %}<a href="/support/edit/{{support.id}}"
                                                        class="btnEditSupport" support_id="{{support.id}}">Sửa nhanh</a>{%
                                                    endif %}
                                                </li>
                                                <li>
                                                    <a class="detail-link" href="/support/detail/{{support.id}}">Chi tiết</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </td>
                                </tr>
                                <?php } ?>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- end content-->
            </div>
            <!--  end card  -->
        </div>
    </div>
</div>

<div class="modal fade" id="updateSupport" tabindex="-1" role="dialog" aria-labelledby="updateSupportLabel" aria-hidden="true"
    novalidate>
    <div class="modal-dialog modal-lg m-t-50">
        <div class="modal-content pull-left">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="material-icons">clear</i></button>
                <h5 class="modal-title text-uppercase" id="updateSupportLabel">Cập nhật hỗ trợ</h5>
            </div>
            <div class="modal-body">
                <form action="" id="updateSupportForm" class="contact-form pull-left" method="POST">
                    <div class="pull-left pull-left" id="form-content">
                        <div class="card m-0 bg-primary p-15">
                            Cung cấp đầy đủ thông tin yêu cầu về hỗ trợ kỹ thuật: cài đặt, gỡ bỏ ứng dụng/ hệ điều
                            hành/ trình duyệt và thay thế/ sửa chữa/ nâng cấp phần cứng (RAM, CPU, HDD, Keyboard,
                            Mouse, Monitor), mất kết nối mạng, virus, sao lưu, phục hồi, …</div>
                        <div class="w-100 m-t-20 pull-left">
                            <div class="w-50 pull-left">
                                <legend class="text-primary m-b-0 f-s-15">Mã hỗ trợ</legend>
                                <div class="input-group">
                                    <span class="input-group-addon">
                                        <i class="material-icons">reorder</i>
                                    </span>
                                    <div class="form-group label-floating">
                                        <input type="text" id="ticket" name="ticket" value="HD-00001" class="form-control"
                                            placeholder="Ghi chú" maxlength="255" size="255" required="1" readonly="1"
                                            disabled="1"> </div>
                                    <div class="invalid-tooltip"></div>
                                </div>
                            </div>
                            <div class="w-50 pull-left">
                                <legend class="text-primary m-b-0 f-s-15">Đơn vị</legend>
                                <div class="input-group">
                                    <span class="input-group-addon">
                                        <i class="material-icons">account_box</i>
                                    </span>
                                    <div class="form-group label-floating">
                                        <select id="department_id" name="department_id" class="form-control select2-hidden-accessible"
                                            data-live-search="true" data-size="15" required="1" data-required-error="Vui lòng chọn dịch vụ."
                                            data-select2-id="department_id" tabindex="-1" aria-hidden="true">
                                            <optgroup class="dept" label="Đơn vị/ Phòng ban">
                                                <option value="2" data-select2-id="7">Phòng Kỹ Thuật</option>
                                            </optgroup>
                                            <optgroup label="Đơn vị/ Phòng ban khác">
                                                <option value="1">Khác/ Mô tả</option>
                                            </optgroup>
                                        </select>
                                    </div>

                                    <div class="invalid-tooltip"></div>
                                </div>
                            </div>
                        </div>

                        <div id="dept_hide" class="w-100 m-t-10 pull-left">
                            <div class="input-group w-50 pull-right">
                                <span class="input-group-addon">
                                    <i class="material-icons">account_box</i>
                                </span>
                                <div class="form-group label-floating">
                                    <input type="text" id="department_other" name="department_other" value="" class="form-control"
                                        placeholder="Mô tả/ Khác" maxlength="255" size="255" style="display: none;">
                                </div>
                                <div class="invalid-tooltip"></div>
                            </div>
                        </div>
                        <div class="w-100 m-t-10 pull-left">
                            <div class="w-50 pull-left">
                                <legend class="text-primary m-b-0 f-s-15">Số điện thoại</legend>
                                <div class="input-group">
                                    <span class="input-group-addon">
                                        <i class="material-icons">phone</i>
                                    </span>
                                    <div class="form-group label-floating">
                                        <input value="" data-required-error="Vui lòng nhập số điện thoại người liên hệ."
                                            data-error="Chưa đúng định dạng." type="text" id="req_phone" name="req_phone"
                                            class="form-control" placeholder="Số điện thoại người liên hệ" required=""
                                            size="255">
                                        <span class="material-icons form-control-feedback">clear</span>
                                    </div>
                                    <div class="invalid-tooltip"></div>
                                </div>
                            </div>

                            <div class="w-50 pull-left">
                                <legend class="text-primary m-b-0 f-s-15">Họ và tên người liên hệ</legend>
                                <div class="input-group">
                                    <span class="input-group-addon">
                                        <i class="material-icons">account_circle</i>
                                    </span>
                                    <div class="form-group label-floating">
                                        <input data-required-error="Vui lòng nhập thông tin người liên hệ." data-error="Chưa đúng định dạng."
                                            type="text" id="req_name" name="req_name" class="form-control" placeholder="Họ và tên"
                                            required="" size="255">
                                        <span class="material-icons form-control-feedback">clear</span>
                                    </div>
                                    <div class="invalid-tooltip"></div>
                                </div>
                            </div>
                        </div>

                        <div class="w-100 m-t-10 pull-left">
                            <legend class="text-primary m-b-0 f-s-15">Nội dung yêu cầu</legend>
                            <div class="input-group">
                                <span class="input-group-addon">
                                    <i class="material-icons">report</i>
                                </span>
                                <div class="form-group label-floating">
                                    <textarea rows="2" name="content" class="form-control" placeholder="Nội dung yêu cầu"
                                        size="255" data-error="Vui lòng nhập nội dung yêu cầu." required>Thay laptop</textarea>
                                </div>
                                <div class="invalid-tooltip"></div>
                            </div>
                        </div>

                        <div class="w-100 m-t-10 pull-left">
                            <legend class="text-primary f-s-15 m-b-0">Tệp tin đính kèm (đính kèm hình ảnh để mô tả các
                                sự cố, nếu có) Chấp nhận
                                tệp
                                tin (<span class="text-rose">.gif, .jpg, .png, .xlsx, .docx, .zip</span>)
                            </legend>
                            <div id="fileupload">
                                <div class="row fileupload-buttonbar">
                                    <div class="col-lg-7">
                                        <!-- The fileinput-button span is used to style the file input field as button -->
                                        <div class="fileinput fileinput-new text-center" data-provides="fileinput">
                                            <div>
                                                <span class="btn btn-success btn-round btn-file">
                                                    <span>Thêm tệp tin</span>
                                                    <input id="file" type="file" name="files[]" multiple="">
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- The global progress state -->
                                    <div class="col-lg-5 fileupload-progress fade">
                                        <!-- The global progress bar -->
                                        <div class="progress progress-striped active" role="progressbar" aria-valuemin="0"
                                            aria-valuemax="100">
                                            <div class="progress-bar progress-bar-success" style="width:0%;"></div>
                                        </div>
                                    </div>
                                </div>
                                <table role="presentation" class="table m-b-0"></table>
                            </div>
                        </div>

                        <div class="w-100 m-t-0 pull-left">
                            <legend class="text-primary m-b-0 m-t-0 f-s-15 pull-left">Mức độ khẩn cấp</legend>
                            <div class="input-group">
                                <span class="input-group-addon">
                                    <i class="material-icons">swap_vert</i>
                                </span>
                                <div class="form-group label-floating">
                                    <select id="priority" name="priority" class="form-control select-style" style="height: 36px"
                                        required="1" data-required-error="Vui lòng chọn độ khẩn cấp.">
                                        <option value="low">Chậm</option>
                                        <option selected="selected" value="normal">Bình thường</option>
                                        <option value="height">Cao</option>
                                        <option value="urgent">Khẩn cấp</option>
                                    </select> </div>
                                <div class="invalid-tooltip"></div>
                            </div>
                        </div>

                        <div class="w-100 m-t-10 pull-left">
                            <legend class="text-primary m-b-0 m-t-0 f-s-15 pull-left">Ghi chú</legend>
                            <div class="input-group">
                                <span class="input-group-addon">
                                    <i class="material-icons">create</i>
                                </span>
                                <div class="form-group label-floating">
                                    <textarea rows="2" name="content" class="form-control" placeholder="Ghi chú" size="255"></textarea>
                                </div>
                                <div class="invalid-tooltip"></div>
                            </div>
                        </div>
                        <div style="display: none" class="req_package_import">update</div>
                        <div style="display: none" class="package_id_import">1</div>
                    </div>
                    <div class="modal-footer text-center">
                        <button type="submit" class="btn btn-primary btn-round">Cập nhật</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="infoPersonAssign" tabindex="-1" role="dialog" aria-labelledby="infoPersonAssignLabel"
    aria-hidden="true" novalidate>
    <div class="modal-dialog modal-md m-t-50">
        <div class="modal-content pull-left p-b-50">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="material-icons">clear</i></button>
                <h5 class="modal-title text-uppercase" id="infoPersonAssignLabel">THÔNG TIN NGƯỜI THỰC HIỆN</h5>
            </div>
            <div class="modal-body">
                <div class="w-100">
                    <div class="col-md-12 m-b-15">
                        <label class="text-primary m-b-0" for="name">Họ và tên:</label>
                        <div class="input-group">
                            <span class="input-group-addon">
                                <i class="fa fa-user"></i>
                            </span>
                            <input type="text" id="name_person" value="" class="form-control" readonly="1">
                        </div>
                    </div>
                    <div class="col-md-12 m-b-15">
                        <label class="text-primary m-b-0" for="name">Email:</label>
                        <div class="input-group">
                            <span class="input-group-addon">
                                <i class="fa fa-envelope"></i>
                            </span>
                            <input type="text" id="email_person" value="" class="form-control" readonly="1">
                        </div>
                    </div>
                    <div class="col-md-12 m-b-15">
                        <label class="text-primary m-b-0" for="name">Số điện thoại:</label>
                        <div class="input-group">
                            <span class="input-group-addon">
                                <i class="fa fa-phone"></i>
                            </span>
                            <input type="text" id="phone_person" value="" class="form-control" readonly="1">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>