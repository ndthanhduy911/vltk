<?php use Library\RoleMaster\RoleMaster; ?>
<style>
    .fade {
        opacity: 0;
        -webkit-transition: opacity .15s linear;
        -o-transition: opacity .15s linear;
        transition: opacity .15s linear
    }

    .fade.in {
        opacity: 1
    }

    .title-file {
        position: absolute;
        top: 380px;
        color: #F44336;
        width: 100%;
        font-size: 20px;
        text-align: center;
        display: inline-block;
    }
</style>
<!-- Bread crumb -->
<div class="row page-titles">
    <div class="col-md-8 align-self-center">
        <h3 class="text-hnn font-weight-bold">YÊU CẦU HỖ TRỢ</h3>
        <span>Thông tin các yêu cầu cần được hỗ trợ</span>
    </div>
    <div class="col-md-4 align-self-center">
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a href="{{ url('/adcp/dashboard') }}">BẢNG ĐIỀU KHIỂN</a>
            </li>
            <li class="breadcrumb-item active">Danh sách yêu cầu hỗ trợ</li>
        </ol>
    </div>
</div>
<?php echo $this->flashSession->output() ?>
<!-- End Bread crumb -->
<div class="container-fluid">
    <!-- Start Page Content -->
    <div class="row">
        <div class="col-12">
            <div class="card" style="font-size: 0.8rem">
                <div class="card-body">
                    <div class="row">
                        <h2 class="card-title font-weight-bold col-md-3" style="font-size: 1rem">Danh sách yêu cầu hỗ trợ</h2>
                        <h2 class="card-title col-md-9" style="font-size: 1rem;">
                            <span class="font-weight-bold">Loại yêu cầu:</span>
                            <span class="badge badge-primary" style="font-size: 0.7rem; padding: 0.5rem">UPDATE</span> Thêm mới, nâng cấp hoặc sửa chữa;
                            <span class="badge badge-success" style="font-size: 0.7rem; padding: 0.5rem">OTHER</span> Yêu cầu khác</h2>
                    </div>
                    <div class="table-responsive">
                        <table id="support" class="table table-bordered table-hover">
                            <thead class="text-center" style="line-height: 2.0">
                                <tr style="background: #EE161E">
                                    <th class="align-middle text-white" style="min-width: 20px;">#</th>
                                    <th class="align-middle text-white" style="min-width: 100px;">Mã hỗ trợ</th>
                                    <th class="align-middle text-white" style="min-width: 80px;">Loại yêu cầu</th>
                                    <th class="align-middle text-white" style="min-width: 80px;">Người yêu cầu</th>
                                    <th class="align-middle text-white" style="min-width: 100px;">Nội dung</th>
                                    <th class="align-middle text-white" style="min-width: 60px;">Tệp tin</th>
                                    <th class="align-middle text-white" style="min-width: 80px;">Mức độ</th>
                                    <th class="align-middle text-white" style="min-width: 90px;">Thời gian yêu cầu</th>
                                    <th class="align-middle text-white" style="min-width: 80px;">Người được giao</th>
                                    <th class="align-middle text-white" style="min-width: 90px;">Thời gian giao việc</th>
                                    <th class="align-middle text-white" style="min-width: 90px;">Thời gian hoàn thành</th>
                                    <th class="align-middle text-white" style="min-width: 50px;">Tình trạng</th>
                                    <th class="align-middle text-white">Thao tác</th>
                                    <th class="hidden">Content</th>
                                    <th class="hidden">Đơn vị</th>
                                    <th class="hidden">Progress</th>
                                    <th class="hidden">Note</th>
                                    <th class="hidden">File</th>
                                    <th class="hidden">Department other</th>
                                    <th class="hidden">Main Person</th>
                                    <th class="hidden">Des Assign</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php $stt = 1; ?> {% for support in page.items %}
                                <tr class="text-center" role="row">
                                    <td>
                                        <?php echo $stt++; ?>
                                    </td>
                                    <td>
                                        <span class="tb_ticket">{{ support.ticket }}</span>
                                    </td>
                                    <td>
                                        <span class="tb_reqPackage">
                                            <?php echo $this->helper->get_req_package($support->req_package) ?>
                                        </span>
                                    </td>
                                    <td>
                                        <span class="tb_clientName"><a class="text-primary btnShowClient" href="javascript:;" data-id="{{support.client_id}}">{{ support.client_name }}</a></span>
                                    </td>
                                    <?php $content = json_decode($support->content) ?>
                                    <td>
                                        <span class="tb_content">
                                            <?php echo !empty($content->content) ? $content->content : 'Tạo tài khoản email mới' ; ?>
                                        </span>
                                    </td>
                                    <td>
                                        <span class="tb_image">
                                            <?php $list_file = $support->file ? json_decode($support->file) : []; ?>
                                            <?php foreach ($list_file as $key => $file) {
                                                if(preg_match('/(\.|\/)(gif|jpe?g|png)$/i',$file)){ ?>
                                            <a href="<?php echo '/files/support/'.$file ?>">
                                                <img style="width: 60px" src="<?php echo '/files/support/'.$file ?>" alt="">
                                            </a>
                                            <p class="text-center mb-0">
                                                <?php echo '('.count($list_file).')' ?>
                                            </p>
                                            <?php break; }
                                            } ?>
                                        </span>
                                    </td>
                                    <td>
                                        <span class="tb_priority">
                                            <?php echo $this->helper->get_priority($support->priority) ?>
                                        </span>
                                    </td>
                                    <td>
                                        <span class="tb_createAt">
                                            <?php echo date_format(date_create($support->created_at),"d-m-Y H:i:s") ?>
                                        </span>
                                    </td>
                                    <?php
                                    $array_person = $support->assign_person_id ? json_decode($support->assign_person_id) : []; 
                                    $assign_person = ''; 
                                    foreach ($array_person as $key => $value) {
                                        $user_key = array_search($value, array_column($user, 'id'));
                                        $fullname = $user_key || $user_key===0 ? $user[$user_key]['fullname'] : '';
                                        $user_id = $user_key || $user_key===0 ? $user[$user_key]['id'] : '';
                                        if($key === 0){
                                            $assign_person .= "<a class='text-primary btnShowUser' href='javascript:;' data-id='{$user_id}'>{$fullname};</a>";
                                        }else{
                                            $assign_person .= "<br><a class='text-primary btnShowUser' href='javascript:;' data-id='{$user_id}'>{$fullname};</a>";
                                        }
                                        
                                    }?>
                                        <td>
                                            <span>
                                                <span class="tb_assignPerson hidden">{{support.assign_person_id}}</span>
                                                <?php echo $assign_person; ?>
                                            </span>
                                        </td>
                                        <td>
                                            <span class="tb_dateAssign">
                                                <?php echo $support->date_assign ? date_format(date_create($support->date_assign),"d-m-Y H:i:s") : '' ?>
                                            </span>
                                        </td>
                                        <td>
                                            <span class="tb_deadline">
                                                <?php echo $support->deadline ? date_format(date_create($support->deadline),"d-m-Y H:i:s") : '' ?>
                                            </span>
                                        </td>
                                        <td>
                                            <span class="tb_status">
                                                <?php echo $this->helper->get_status_support($support->status) ?>
                                            </span>
                                        </td>
                                        <td>
                                            <?php if($this->rolemaster::isPermission($this->session->get("permission"),'support','assign')){ ?>
                                            <a class="mt-1 mb-1 btn btn-primary btn-sm editSupport" data-id={{ support.id }} href="javascript:;" data-href="/adcp/support/assign/{{ support.id }}">
                                                <i class="fa fa-edit"></i>
                                            </a>
                                            <?php } ?>
                                            <?php if($this->rolemaster::isPermission($this->session->get("permission"),'support','delete')){ ?>
                                            <a class="mt-1 mb-1 delete-confirm btn btn-danger btn-sm" data-id={{ support.id }} obj="Support" href="/adcp/support/delete">
                                                <i style="width: 12px;" class="fa fa-remove"></i>
                                            </a>
                                            <?php } ?>
                                        </td>
                                        <td class="hidden">
                                            <span class="tb_allContent">{{ support.content }}</span>
                                        </td>
                                        <td class="hidden">
                                            <span class="tb_departmentName">{{ support.department_name}}</span>
                                        </td>
                                        <td class="hidden">
                                            <span class="tb_progress">{{ support.progress }}</span>
                                        </td>
                                        <td class="hidden">
                                            <span class="tb_note">{{ support.note }}</span>
                                        </td>
                                        <td class="hidden">
                                            <span class="tb_file">{{ support.file }}</spa>
                                        </td>
                                        <td class="hidden">
                                            <span class="tb_departmentOther">{{ support.department_other }}</span>
                                        </td>
                                        <td class="hidden">
                                            <span class="tb_mainAssignPerson">{{ support.main_assign_person }}</span>
                                        </td>
                                        <td class="hidden">
                                            <span class="tb_desAssign">{{ support.des_assign }}</span>
                                        </td>
                                </tr>
                                {% endfor %}
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="modalEditSupport" class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="modalEditSupportLabel"
    aria-hidden="true">
    <div class="modal-dialog" style="max-width: 1200px; width: 90%;">
        <div class="modal-content">
            <div class="modal-header" style="background: #EE161E">
                <h5 class="modal-title text-white" id="modalEditSupportLabel">Cập nhật hỗ trợ</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Đóng" style="font-size: 2rem; padding: 0; margin-right: 15px; margin-top: 0px;">
                    <span class="text-white" aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="/adcp/support/assign" id="frmEditSupport" method="post" data-toggle="validator" role="form">
                <div class="modal-body">
                    <div class="col-md-4 mb-5 float-left border border-danger border-bottom-0 border-top-0 border-left-0">
                        <div class="col-md-12">
                            <h2 class="text-hnn font-weight-bold">THÔNG TIN</h2>
                        </div>
                        <div class="col-md-12 m-b-10">
                            <i class="fa fa-check-square m-r-10" aria-hidden="true"></i>
                            <span class="text-danger">Mã hỗ trợ: </span>
                            <span class="package_name"></span>
                        </div>
                        <div class="col-md-12 m-b-10">
                            <i class="fa fa-check-square m-r-10" aria-hidden="true"></i>
                            <span class="text-danger">Tiêu đề: </span>
                            <span class="req_packge_name"></span>
                        </div>
                        <div class="col-md-12 m-b-10">
                            <i class="fa fa-check-square m-r-10" aria-hidden="true"></i>
                            <span class="text-danger">Người yêu cầu: </span>
                            <span class="client_name"></span>
                        </div>
                        <div class="col-md-12 m-b-10">
                            <i class="fa fa-check-square m-r-10" aria-hidden="true"></i>
                            <span class="text-danger">Mức độ ưu tiên: </span>
                            <span class="priority"></span>
                        </div>
                        <div class="col-md-12 m-b-10">
                            <i class="fa fa-check-square m-r-10" aria-hidden="true"></i>
                            <span class="text-danger">Ngày nhận yêu cầu: </span>
                            <span class="created_at"></span>
                        </div>
                        <div class="col-md-12 m-b-10">
                            <i class="fa fa-check-square m-r-10" aria-hidden="true"></i>
                            <span class="text-danger">Ngày giao việc: </span>
                            <span class="date_assign"></span>
                        </div>
                        <div class="col-md-12 m-b-10">
                            <i class="fa fa-check-square m-r-10" aria-hidden="true"></i>{{ form.label('assign_person_id') }}
                            <div class="input-group">
                                {{ form.render('assign_person_id',['name':'assign_person_id[]']) }}
                                <div class="invalid-tooltip">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 m-b-10 hidden" id="main_assgin_person">
                            <div class="p-0 col-md-12">
                                <div class="col-md-12 p-0">
                                    <i class="fa fa-check-square m-r-10" aria-hidden="true"></i>
                                    <label>
                                        <span class="text-danger">Người chịu trách nhiệm chính</span>
                                    </label>
                                </div>
                                <div class="col-md-12 p-0 groupBox m-l-26">
                                    <div class="checkbox">

                                    </div>
                                </div>
                                <div class="col-md-12 p-0 m-b-10">
                                    <i class="fa fa-check-square m-r-10" aria-hidden="true"></i>{{ form.label('des_assign') }}
                                    <div class="input-group">
                                        {{ form.render('des_assign') }}
                                        <div class="invalid-tooltip">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-12 m-b-10">
                            <i class="fa fa-check-square m-r-10" aria-hidden="true"></i>{{ form.label('deadline') }}
                            <div class="input-group">
                                {{ form.render('deadline') }}
                                <div class="invalid-tooltip">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 m-b-10">
                            <i class="fa fa-check-square m-r-10" aria-hidden="true"></i>
                            <span class="text-danger">Tiến độ</span>
                            <span class="pull-right value_progress">85%</span>
                            <div class="progress m-t-10">
                                <div id="progress" class="progress-bar bg-danger" style="width: 85%; height:6px;" role="progressbar"></div>
                            </div>
                        </div>
                        <div class="col-md-12 mt-3">
                            <button type="submit" class="btn btn-danger">Cập nhật</button>
                        </div>
                    </div>
                    <div class="col-md-8 mb-5 float-left">
                        <div class="col-md-12">
                            <h2 class="text-hnn font-weight-bold">NỘI DUNG YÊU CẦU</h2>
                        </div>
                        <div class="col-md-12 m-t-5 m-b-5 float-left">
                            <div class="col-4 float-left">
                                <i class="fa fa-location-arrow m-r-10" aria-hidden="true"></i>
                                <span class="text-danger">Đơn vị</span>
                            </div>
                            <div class="col-8 float-left">:
                                <strong class="text-dark m-l-10 department_name"></strong>
                            </div>
                        </div>
                        <div class="content-support float-left">
                        </div>
                        <div class="col-md-12 m-t-5 m-b-5 float-left">
                            <div class="col-4 float-left">
                                <i class="fa fa-location-arrow m-r-10" aria-hidden="true"></i>
                                <span class="text-danger">Ghi chú</span>
                            </div>
                            <div class="col-8 float-left">:
                                <strong class="text-dark m-l-10 note_support">Yêu cầu tạo trước ngày 11/09/1995</strong>
                            </div>
                        </div>
                        <div class="col-md-12 float-left">
                            <hr>
                        </div>
                        <div class="content-message" style="display: none">
                            <h2 class="col-md-12 mt-3 text-uppercase text-hnn font-weight-bold">TIN NHẮN CỦA NGƯỜI YÊU CẦU</h2>
                            <div class="col-md-12 message-client">

                            </div>
                        </div>
                        <div class="comment-support float-left">
                            <h2 class="col-md-12 mt-3 text-uppercase text-hnn font-weight-bold">TRAO ĐỔI GIỮA CÁC NGƯỜI THỰC HIỆN</h2>
                            <div class="comment">

                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<div id="modalSider" class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="modalSiderLabel"
    aria-hidden="true">
    <div class="modal-dialog mt-1" style="max-width: 1200px; width: 90%;">
        <div class="modal-content">
            <div class="modal-header" style="background: #EE161E">
                <h5 class="modal-title text-white" id="modalSiderLabel">Tệp tin</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Đóng" style="font-size: 2rem; padding: 0; margin-right: 15px; margin-top: 0px;">
                    <span class="text-white" aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="sider-iamge">
                <div id="sider-iamge" class="carousel slide" data-interval="false" data-ride="carousel">
                    <div class="carousel-inner" role="listbox">

                    </div>
                    <a class="carousel-control-prev" href="#sider-iamge" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#sider-iamge" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="hidden" id="showPersonAssign">
    <div class="modal-dialog" style="max-width: 1200px; width: 50%;">
        <div class="modal-content">
            <div class="modal-header" style="background: #EE161E">
                <h5 class="modal-title text-white" id="infoPersonAssignLabel">THÔNG TIN TÀI KHOẢN</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Đóng" style="font-size: 2rem; padding: 0; margin-right: 15px; margin-top: 0px;">
                    <span class="text-white" aria-hidden="true">×</span>
                </button>
            </div>
            <form>
                <div class="modal-body col-md-12 float-left">
                    <div class="container">
                        <div class="form-row">
                            <div class="col-md-12 mb-3 group-val">
                                <label for="name">Họ và tên
                                </label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" style="background: #EE161E">
                                            <i class="fa fa-edit text-white"></i>
                                        </span>
                                    </div>
                                    <input type="text" id="name_person" value="" class="form-control" readonly="1">
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-md-12 mb-3 group-val">
                                <label for="name">Email
                                </label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" style="background: #EE161E">
                                            <i class="fa fa-edit text-white"></i>
                                        </span>
                                    </div>
                                    <input type="text" id="email_person" value="" class="form-control" readonly="1">
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-md-12 mb-3 group-val">
                                <label for="name">Số điện thoại
                                </label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" style="background: #EE161E">
                                            <i class="fa fa-edit text-white"></i>
                                        </span>
                                    </div>
                                    <input type="text" id="phone_person" value="" class="form-control" readonly="1">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="hidden" id="showClientAssign">
    <div class="modal-dialog" style="max-width: 1200px; width: 60%;">
        <div class="modal-content">
            <div class="modal-header" style="background: #EE161E">
                <h5 class="modal-title text-white" id="infoPersonAssignLabel">THÔNG TIN TÀI KHOẢN</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Đóng" style="font-size: 2rem; padding: 0; margin-right: 15px; margin-top: 0px;">
                    <span class="text-white" aria-hidden="true">×</span>
                </button>
            </div>
            <form>
                <div class="modal-body col-md-12 float-left">
                    <div class="container">
                        <div class="form-row">
                            <div class="col-md-6 mb-3 group-val">
                                <label for="name">Họ và tên
                                </label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" style="background: #EE161E">
                                            <i class="fa fa-edit text-white"></i>
                                        </span>
                                    </div>
                                    <input type="text" id="name_client" value="" class="form-control" readonly="1">
                                </div>
                            </div>
                            <div class="col-md-6 mb-3 group-val">
                                <label for="name">Email
                                </label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" style="background: #EE161E">
                                            <i class="fa fa-edit text-white"></i>
                                        </span>
                                    </div>
                                    <input type="text" id="email_client" value="" class="form-control" readonly="1">
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-md-6 mb-3 group-val">
                                <label for="name">Số điện thoại
                                </label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" style="background: #EE161E">
                                            <i class="fa fa-edit text-white"></i>
                                        </span>
                                    </div>
                                    <input type="text" id="phone_client" value="" class="form-control" readonly="1">
                                </div>
                            </div>
                            <div class="col-md-6 mb-3 group-val">
                                <label for="name">Đơn vị
                                </label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" style="background: #EE161E">
                                            <i class="fa fa-edit text-white"></i>
                                        </span>
                                    </div>
                                    <input type="text" id="department_client" value="" class="form-control" readonly="1">
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-md-12 mb-3 group-val">
                                <label for="name">Địa chỉ
                                </label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" style="background: #EE161E">
                                            <i class="fa fa-edit text-white"></i>
                                        </span>
                                    </div>
                                    <input type="text" id="address_client" value="" class="form-control" readonly="1">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>