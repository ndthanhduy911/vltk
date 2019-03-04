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
    .pb-cmnt-container {
        font-family: Lato;
    }
    .pb-cmnt-textarea {
        resize: none;
        padding: 20px;
        height: 130px;
        width: 100%;
        border: 1px solid #F2F2F2;
    }
</style>
<!-- Bread crumb -->
<div class="row page-titles">
    <div class="col-md-8 align-self-center">
        <h3 class="text-hnn font-weight-bold">HỖ TRỢ CỦA TÔI</h3>
        <span>Thông tin các hỗ trợ mà bạn được giao giải quyết.</span>
    </div>
    <div class="col-md-4 align-self-center">
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a href="{{ url('/adcp/dashboard') }}">BẢNG ĐIỀU KHIỂN</a>
            </li>
            <li class="breadcrumb-item active">Hỗ trợ của tôi</li>
        </ol>
    </div>
</div>
<?php echo $this->flashSession->output() ?>
<!-- End Bread crumb -->
<div class="container-fluid">
    <div class="row">
        <div class="col-12">
            <div class="card" style="font-size: 0.8rem">
                <div class="card-body">
                    <div class="row">
                        <h2 class="card-title font-weight-bold col-md-3" style="font-size: 1rem">Danh sách yêu cầu hỗ trợ</h2><h2 class="card-title col-md-9" style="font-size: 1rem;"><span class="font-weight-bold">Loại yêu cầu:</span><span class="badge badge-primary" style="font-size: 0.7rem; padding: 0.5rem">UPDATE</span> Thêm mới, nâng cấp hoặc sửa chữa; <span class="badge badge-success" style="font-size: 0.7rem; padding: 0.5rem">OTHER</span> Yêu cầu khác</h2>
                    </div>
                    <div class="table-responsive">
                        <table id="mysupport" class="table table-bordered table-hover">
                            <thead class="text-center" style="line-height: 2.0">
                                <tr style="background: #EE161E">
                                    <th class="align-middle text-white" style="min-width: 20px;">#</th>
                                    <th class="align-middle text-white" style="min-width: 100px;">Mã hỗ trợ</th>
                                    <th class="align-middle text-white" style="min-width: 80px;">Loại yêu cầu</th>
                                    <th class="align-middle text-white" style="min-width: 90px;">Người yêu cầu</th>
                                    <th class="align-middle text-white" style="min-width: 100px;">Nội dung</th>
                                    <th class="align-middle text-white" style="min-width: 80px;">Tệp tin</th>
                                    <th class="align-middle text-white" style="min-width: 80px;">Mức độ</th>
                                    <th class="align-middle text-white" style="min-width: 90px;">Thời gian yêu cầu</th>
                                    <th class="align-middle text-white" style="min-width: 90px;">Người giao</th>
                                    <th class="align-middle text-white" style="min-width: 90px;">Thời gian giao việc</th>
                                    <th class="align-middle text-white" style="min-width: 90px;">Thời gian hoàn thành</th>
                                    
                                    <th class="align-middle text-white" style="min-width: 60px;">Trạng thái</th>
                                    <th class="align-middle text-white">Thao tác</th>
                                    <th class="hidden">Content</th>
                                    <th class="hidden">Đơn vị</th>
                                    <th class="hidden">Progress</th>
                                    <th class="hidden">Note</th>
                                    <th class="hidden">File</th>
                                    <th class="hidden">Department other</th>
                                    <th class="hidden">Des Assign</th>
                                    <th class="hidden">Main Person Assgin</th>
                                    <th class="hidden">Person Assgin</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php $stt = 1; ?> {% for mysupport in page.items %}
                                <tr class="text-center" role="row">
                                    <td><?php echo $stt++; ?></td>
                                    <td><span class="tb_ticket">{{ mysupport.ticket }}</span></td>
                                    <td>
                                        <span class="tb_reqPackage"><?php echo $this->helper->get_req_package($mysupport->req_package) ?></span>
                                    </td>
                                    <td>
                                        <span class="tb_clientName"><a class="text-primary btnShowClient" href="javascript:;" data-id="{{mysupport.client_id}}">{{ mysupport.client_name }}</a></span>
                                    </td>
                                    <?php $content = json_decode($mysupport->content) ?>
                                    <td><span class="tb_content"><?php echo !empty($content->content) ? $content->content : 'Tạo tài khoản email mới' ; ?></span></td>
                                    <td><span class="tb_image">
                                    <?php $list_file = json_decode($mysupport->file); ?>
                                    <?php foreach ($list_file as $key => $file) {
                                        if(preg_match('/(\.|\/)(gif|jpe?g|png)$/i',$file)){ ?>
                                        <a href="<?php echo '/files/support/'.$file ?>">
                                            <img style="width: 60px" src="<?php echo '/files/support/'.$file ?>" alt="">
                                        </a>
                                        <p class="text-center mb-0"><?php echo '('.count($list_file).')' ?></p>
                                        <?php break; }
                                    } ?>
                                    </span></td>
                                    <td><span class="tb_priority"><?php echo $this->helper->get_priority($mysupport->priority) ?></span></td>
                                    <td><span class="tb_createAt"><?php echo date_format(date_create($mysupport->created_at),"d-m-Y H:i:s") ?></span></td>
                                    <?php $user_key = array_search($mysupport->user_assign_id, array_column($user, 'id')); ?>
                                    <td>
                                        <span class="tb_assignUser" data-id="{{mysupport.user_assign_id}}"><a class='text-primary btnShowUser' href='javascript:;' data-id='{{mysupport.user_assign_id}}'><?php echo $user_key || $user_key===0? $user[$user_key]['fullname'] : '' ?></a></span>
                                    </td>
                                    <td><span class="tb_dateAssign"><?php echo $mysupport->date_assign ? date_format(date_create($mysupport->date_assign),"d-m-Y H:i:s") : '' ?></span></td>
                                    <td><span class="tb_deadline"><?php echo $mysupport->deadline ? date_format(date_create($mysupport->deadline),"d-m-Y H:i:s") : '' ?></span></td>
                                    <td>
                                        <span class="tb_status" data-id="{{mysupport.status}}"><?php echo $this->helper->get_status_my_support($mysupport->status) ?></span>
                                    </td>
                                    <td>
                                        <a class="mt-1 mb-1 btn btn-primary btn-sm editMySupport" data-id={{ mysupport.id }} href="/adcp/support/dosupport/{{ mysupport.id }}">
                                            <i class="fa fa-edit"></i>
                                        </a>
                                    </td>
                                    <td class="hidden"><span class="tb_allContent">{{ mysupport.content }}</span></td>
                                    <td class="hidden"><span class="tb_departmentName">{{ mysupport.department_name}}</span></td>
                                    <td class="hidden"><span class="tb_progress">{{ mysupport.progress }}</span></td>
                                    <td class="hidden"><span class="tb_note">{{ mysupport.note }}</span></td>
                                    <td class="hidden"><span class="tb_file">{{ mysupport.file }}</spa></td>
                                    <td class="hidden"><span class="tb_departmentOther">{{ mysupport.department_other }}</span></td>
                                    <td class="hidden"><span class="tb_desAssign">{{ mysupport.des_assign }}</span></td>
                                    <?php
                                    $array_person = $mysupport->main_assign_person ? json_decode($mysupport->main_assign_person) : []; 
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
                                    <td class="hidden"><span class="tb_mainAssignPerson"><?php echo $assign_person; ?></span></td>
                                    <?php
                                    $array_person = $mysupport->assign_person_id ? json_decode($mysupport->assign_person_id) : []; 
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
                                    <td class="hidden"><span class="tb_assignPerson"><?php echo $assign_person; ?></span></td>
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

<div id="modalEditMySupport" class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog"
     aria-labelledby="modalEditMySupportLabel"
     aria-hidden="true">
    <div class="modal-dialog" style="max-width: 1200px; width: 90%;">
        <div class="modal-content">
            <div class="modal-header" style="background: #EE161E">
                <h5 class="modal-title text-white" id="modalEditMySupportLabel">Thông tin hỗ trợ</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Đóng"
                        style="font-size: 2rem; padding: 0; margin-right: 15px; margin-top: 0px;">
                    <span class="text-white" aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="" id="frmEditMySupport" method="post" data-toggle="validator" role="form">
                <div class="modal-body">
                    <div class="col-md-4 mb-5 float-left border border-danger border-bottom-0 border-top-0 border-left-0">
                        <div class="col-md-12">
                            <h2 class="text-hnn font-weight-bold">THÔNG TIN</h2>
                        </div>
                        <div class="col-md-12 m-b-10">
                            <i class="fa fa-check-square m-r-10" aria-hidden="true"></i><span class="text-danger">Mã hỗ trợ: </span><span class="package_name"></span>
                        </div>
                        <div class="col-md-12 m-b-10">
                            <i class="fa fa-check-square m-r-10" aria-hidden="true"></i><span class="text-danger">Tiêu đề: </span><span class="req_packge_name"></span>
                        </div>
                        <div class="col-md-12 m-b-10">
                            <i class="fa fa-check-square m-r-10" aria-hidden="true"></i><span class="text-danger">Người yêu cầu: </span><span class="client_name"></span>
                        </div>
                        <div class="col-md-12 m-b-10">
                            <i class="fa fa-check-square m-r-10" aria-hidden="true"></i><span class="text-danger">Mức độ ưu tiên: </span><span class="priority"></span>
                        </div>
                        <div class="col-md-12 m-b-10">
                            <i class="fa fa-check-square m-r-10" aria-hidden="true"></i><span class="text-danger">Người giao: </span><span class="user_assign"></span>
                        </div>
                        <div class="col-md-12 m-b-10">
                            <i class="fa fa-check-square m-r-10" aria-hidden="true"></i><span class="text-danger">Những người được giao: </span>
                            <div class="person_assign col-md-12 pl-4"></div>
                        </div>
                        <div class="col-md-12 m-b-10">
                            <i class="fa fa-check-square m-r-10" aria-hidden="true"></i><span class="text-danger">Người chịu trách nhiệm chính: </span>
                            <div class="main_assign col-md-12 pl-4"></div>
                        </div>
                        <div class="col-md-12 m-b-10">
                            <i class="fa fa-check-square m-r-10" aria-hidden="true"></i><span class="text-danger">Ngày giao việc: </span><span class="date_assign"></span>
                        </div>
                        <div class="col-md-12 m-b-10">
                            <i class="fa fa-check-square m-r-10" aria-hidden="true"></i><span class="text-danger">Ngày hoàn thành: </span><span class="deadline"></span>
                        </div>
                        <div class="col-md-12 m-b-10">
                            <i class="fa fa-check-square m-r-10" aria-hidden="true"></i>{{ form.label('status') }}
                            <div class="input-group">
                                {{ form.render('status') }}
                                <div class="invalid-tooltip">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 m-b-10">
                            <i class="fa fa-check-square m-r-10" aria-hidden="true"></i>{{ form.label('progress') }}
                            <div class="input-group">
                                {{ form.render('progress') }}
                                <div class="invalid-tooltip">
                                </div>
                                <span class="label label-rouded label-success" style="font-size: 1rem; margin-left: 2px; padding:10px 20px 0">%</span>
                            </div>
                        </div>

                        <div class="col-md-12 mt-2">
                            <button type="submit" class="btn btn-danger">Cập nhật</button>
                        </div>
                    </div>
                    <div class="col-md-8 mb-5 float-left">
                        <div class="col-md-12">
                            <h2 class="text-hnn font-weight-bold">NỘI DUNG YÊU CẦU HỖ TRỢ</h2>
                        </div>
                        <div class="col-md-12 m-t-5 m-b-5 float-left">
                            <div class="col-4 float-left"><i class="fa fa-location-arrow m-r-10" aria-hidden="true"></i><span class="text-danger">Đơn vị</span></div>
                            <div class="col-8 float-left">:<strong class="text-dark m-l-10 department_name"></strong></div>
                        </div>
                        <div class="content-support float-left">
                        </div>
                        <div class="col-md-12 m-t-5 m-b-5 float-left">
                            <div class="col-4 float-left"><i class="fa fa-location-arrow m-r-10" aria-hidden="true"></i><span class="text-danger">Ghi chú</span></div>
                            <div class="col-8 float-left">:<strong class="text-dark m-l-10 note_mysupport"></strong></div>
                        </div>
                        <div class="col-md-12 float-left">
                            <hr>
                        </div>
                        <div class="content-assign float-left">
                            <h2 class="col-md-12 mt-3 text-uppercase text-hnn font-weight-bold float-left">NỘI DUNG CÔNG VIỆC</h2>
                            <article class="col-md-12">
                                
                            </article>
                        </div>
                        <div class="col-md-12 float-left">
                            <hr>
                        </div>
                        <h2 class="col-md-12 mt-3 text-uppercase text-hnn font-weight-bold float-left">TRAO ĐỔI / BÌNH LUẬN</h2>
                        <div class="card mt-0 pt-0">
                            <div class="card-body p-b-0">
                                <ul class="nav nav-tabs customtab" id="tabComment" role="tablist">
                                    <li class="nav-item"> <a class="nav-link active" data-toggle="tab" href="#adminTab" role="tab"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Người thực hiện</span></a> </li>
                                    <li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#clientTab" role="tab"><span class="hidden-sm-up"><i class="ti-user"></i></span> <span class="hidden-xs-down">Người yêu cầu</span></a> </li>
                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane active" id="adminTab" role="tabpanel">
                                        <div class="p-20 pl-0 pr-0">
                                            <div class="comment-support col-md-12 float-left p-0">
                                                <div class="col-md-12 comment p-0">
                                                    <p id="empty_comment" class="text-danger">Không có bất kỳ bình luận nào !</p>
                                                </div>
                                                <div class="pb-cmnt-container col-md-12">
                                                    <div class="row">
                                                        <div class="col-md-12 p-0">
                                                            <div class="card-info card bg-info mt-0 p-t-20">
                                                                <div class="panel-body">
                                                                    <textarea placeholder="Hãy viết bình luận của bạn ở đây!" class="content-comment pb-cmnt-textarea"></textarea>
                                                                    <form class="form-inline">
                                                                        <button class="btn btn-info float-right sendCommnet" type="button">Bình luận</button>
                                                                    </form>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane  p-20 pl-0 pr-0" id="clientTab" role="tabpanel">
                                        <div class="content-message col-md-12 float-left p-0">
                                            <div class="col-md-12 message-client p-0">
                                                <p id="empty_client_comment" class="text-danger">Không có bất kỳ bình luận nào !</p>
                                            </div>
                                            <div class="container pb-cmnt-container">
                                                <div class="row">
                                                    <div class="col-md-12 p-0">
                                                        <div class="card-info card bg-info mt-0 p-t-20">
                                                            <div class="panel-body">
                                                                <textarea placeholder="Hãy viết bình luận của bạn ở đây!" class="content-comment-client pb-cmnt-textarea"></textarea>
                                                                <form class="form-inline float-right">
                                                                    <button class="btn btn-info float-right sendClientComment" type="button">Bình luận</button>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- <div class="content-message" style="display: none">
                            <h2 class="col-md-12 mt-3 text-uppercase text-danger font-weight-bold">Tin nhắn của người yêu cầu</h2>
                            <div class="col-md-12 message-client">
                                
                            </div>
                        </div>
                        <div class="comment-support col-md-12 float-left p-0">
                            <h2 class="col-md-12 mt-3 text-uppercase text-hnn font-weight-bold">Bình luận</h2>
                            <div class="col-md-12 comment">
                            </div>
                            <div class="pb-cmnt-container col-md-12">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="card-info card bg-info mt-0">
                                            <div class="card-block">
                                                <textarea placeholder="Hãy viết bình luận của bạn ở đây!" class="content-comment float-left"></textarea>
                                                <input name="image" type="file" id="upload" class="hidden" onchange="">
                                                <form class="form-inline">
                                                    <div class="btn-group mt-2">
                                                        <button class="btn" type="button"><span class="fa fa-picture-o fa-lg"></span></button>
                                                        <button class="btn" type="button"><span class="fa fa-file-archive-o fa-lg"></span></button>
                                                        <button class="btn" type="button"><span class="fa fa-microphone fa-lg"></span></button>
                                                        <button class="btn" type="button"><span class="fa fa-music fa-lg"></span></button>
                                                    </div>
                                                    <button class="btn btn-info float-right mt-2 sendCommnet" type="button">Bình luận</button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div> -->
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