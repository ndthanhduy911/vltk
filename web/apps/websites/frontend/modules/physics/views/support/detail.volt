<div class="container-fluid">
    <div class="w-100">
        <div class="card p-b-50 p-t-15">
            <div class="pull-left col-md-12 p-l-30">
                <a href="/support/list" class="btn btn-success btn-xs ml-3 backTable"><i class="f-s-16 fa fa-arrow-left"
                        aria-hidden="true"></i> Trở về</a>
            </div>
            <div class="section landing-section detail-support pull-left">
                <div id="support-id" class="hidden" data-id="{{support.id}}"></div>
                <div id="login_user_id" class="hidden" data-id="<?= $this->session->get('user_id') ?>"></div>
                <div id="login_name" class="hidden" data-id="<?= $this->session->get('fullName') ?>"></div>
                <div id="login_mail" class="hidden" data-id="<?= $this->session->get('emailAddress') ?>"></div>
                <div id="login_avatar" class="hidden">
                    <?= $this->session->get('avatar') ?>
                </div>
                <div class="col-md-12 pl-5 pr-5 pull-left">
                    <div class="col-md-4 pull-left">
                        <h4 class="text-dark text-uppercase" style="font-weight: bold">THÔNG TIN YÊU CẦU</h2>
                            <?php $content = json_decode($support->content); ?>
                            <table class="table table-bordered">
                                <tbody>
                                    <tr>
                                        <td class="p-5 text-primary">Mã hỗ trợ</td>
                                        <td class="p-5">{{support.ticket}}</td>
                                    </tr>
                                    <tr>
                                        <td class="p-5 text-primary">Loại dịch vụ</td>
                                        <?php $package_key = array_search($support->package_id, array_column($package, 'id')); ?>
                                        <td class="p-5">
                                            <?= $package_key || $package_key===0? $package[$package_key]['name'] : '' ?>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="p-l-5 p-0 text-primary">Loại yêu cầu</td>
                                        <td class="p-l-5 p-0">
                                            <?= $this->helper->get_frontend_req_package($support->req_package) ?>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="p-l-5 p-0 text-primary">Mức độ</td>
                                        <td class="p-l-5 p-0">
                                            <?= $this->helper->get_frontend_priority($support->priority) ?>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="p-l-5 p-0 text-primary">Tình trạng</td>
                                        <td class="p-l-5 p-0">
                                            <?= $this->helper->get_frontend_status_support($support->status) ?>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="p-5 text-primary">Người thực hiện</td>
                                        <td class="p-5">
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
                                            }
                                            ?>
                                            <?= $assign_person; ?>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="p-5 text-primary">Thời gian khởi tạo</td>
                                        <td class="p-5">
                                            <?= date_format(date_create($support->created_at),"d-m-Y H:i"); ?>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="p-5 text-primary">Lần cập nhật cuối</td>
                                        <td class="p-5">
                                            <?= $support->updated_at?date_format(date_create($support->updated_at),"d-m-Y H:i"):date_format(date_create($support->created_at),"d-m-Y H:i"); ?>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="p-5 text-primary">Thời gian hoàn thành</td>
                                        <td class="p-5">
                                            <?= $support->deadline?date_format(date_create($support->deadline),"d-m-Y H:i"):''; ?>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="p-5 text-primary">Người được liên hệ</td>
                                        <td class="p-5">
                                            <?= !empty($content->req_name) ? $content->req_name : '' ?>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="p-5 text-primary">Số điện thoại</td>
                                        <td class="p-5">
                                            <?= !empty($content->req_phone) ? $content->req_phone : '' ?>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="p-5 text-primary">Đơn vị</td>
                                        <?php $department_key = array_search($support->department_id, array_column($department, 'id')); ?>
                                        <td class="p-5">
                                            <?= $department_key || $department_key===0? $department[$department_key]['name'] : '' ?>
                                        </td>
                                    </tr>
                                    {% if support.status == 2 %}
                                    <tr>
                                        <td class="p-5 text-primary">Đánh giá</td>
                                        <td class="p-5">
                                            <select name="assess" id="assess" data-id="{{support.id}}" class="form-control-sm">
                                                <option value="0" {% if support.assess=='0' %}selected{% endif %}>Không
                                                    đánh
                                                    giá</option>
                                                <option value="1" {% if support.assess=='1' %}selected{% endif %}>Đã
                                                    hoàn thành</option>
                                                <option value="2" {% if support.assess=='2' %}selected{% endif %}>Chưa
                                                    hoàn
                                                    thành</option>
                                            </select>
                                        </td>
                                    </tr>
                                    {% endif %}
                                </tbody>
                            </table>

                            <h4 class="text-dark text-uppercase m-b-0 pull-left" style="font-weight: bold">NỘI DUNG YÊU
                                CẦU</h4>
                            <?php if(!empty($content->req_name_create)){ ?>
                            <div class="w-100 pull-left">
                                <h6>Đăng ký email mới có thông tin như sau:</h6>
                                <div class="w-100 text-primary" style="font-weight: bold">Họ và
                                    tên</div>
                                <div class="w-100 pull-left">{{content.req_name_create}}</div>
                                <?php $department_key = array_search($support->department_id, array_column($department, 'id')); ?>
                                <div class="w-100 text-primary" style="font-weight: bold">Đơn vị</div>
                                <div class="w-100 pull-left">
                                    <?= $department_key || $department_key===0? $department[$department_key]['name'] : '' ?>
                                </div>
                                <div class="w-100 text-primary" style="font-weight: bold">Địa chỉ
                                    Email</div>
                                <div class="w-100 pull-left">{{content.req_email}}</div>
                                <div class="w-100 text-primary" style="font-weight: bold">Số điện
                                    thoại</div>
                                <div class="w-100 pull-left">{{content.req_phone}}</div>
                                <?php if($support->note){ ?>
                                <div class="w-100 text-primary" style="font-weight: bold">Ghi chú</div>
                                <div class="w-100 pull-left">{{support.note}}</div>
                                <?php } ?>
                            </div>
                            <?php } else{ ?>
                            <div class="w-100 pull-left">
                                <article class="pull-left">
                                    {{content.content}}
                                </article>
                            </div>
                            <?php } ?>
                    </div>
                    <div class="col-md-8 pull-left p-l-0">
                        <div class="nav-center pull-left w-100">
                            <ul class="nav nav-pills nav-pills-warning nav-pills-icons" role="tablist">
                                <li class="active">
                                    <a href="#comment-tab" role="tab" data-toggle="tab">
                                        <i class="material-icons">chat</i> TIN NHẮN
                                    </a>
                                </li>
                                <!-- <li>
                                    <a href="#schedule-1" role="tab" data-toggle="tab">
                                        <i class="material-icons">location_on</i> Location
                                    </a>
                                </li>
                                <li>
                                    <a href="#schedule-1" role="tab" data-toggle="tab">
                                        <i class="material-icons">location_on</i> Location
                                    </a>
                                </li>
                                <li>
                                    <a href="#tasks-1" role="tab" data-toggle="tab">
                                        <i class="material-icons">gavel</i> Legal Info
                                    </a>
                                </li>
                                <li>
                                    <a href="#tasks-2" role="tab" data-toggle="tab">
                                        <i class="material-icons">help_outline</i> Help Center
                                    </a>
                                </li> -->
                            </ul>
                        </div>
                        <div class="tab-content m-t-10 pull-left w-100">
                            <div class="tab-pane active" id="comment-tab">
                                <div class="card">
                                    <p class="col-md-12 m-t-15 pull-left">(Bạn có thể để lại tin nhắn cho chúng tôi tại đây)</p>
                                    <div class="comment-all pull-left"></div>
                                    <div class="col-md-12 pull-left">
                                        <hr>
                                    </div>
                                    <div class="w-100 new_comment pull-left">
                                        <h5 class="col-md-12 m-b-0">Soạn tin nhắn</h5>
                                        <div class="col-md-12 card">
                                            <div class="form-group label-floating">
                                                <textarea rows="5" name="content-comment" class="form-control content-comment"
                                                    placeholder="Nội dung tin nhắn"></textarea>
                                            </div>
                                            <div id="fileupload">
                                                <div class="row fileupload-buttonbar">
                                                    <div class="col-md-12">
                                                        <!-- The fileinput-button span is used to style the file input field as button -->
                                                        <div class="fileinput fileinput-new text-center m-b-0"
                                                            data-provides="fileinput">
                                                            <div>
                                                                <span class="btn btn-success btn-sm btn-round btn-file m-b-0">
                                                                    <span>Thêm tệp tin</span>
                                                                    <input id="file" type="file" name="files[]"
                                                                        multiple>
                                                                </span>
                                                            </div>
                                                        </div>
                                                        <legend class="text-primary f-s-15 m-t-5 m-b-0">Chấp nhận tệp
                                                            tin (<span class="text-rose">.gif, .jpg, .png, .xlsx,
                                                                .docx, .zip</span>)</legend>
                                                    </div>
                                                    <div class="fileupload-progress fade">
                                                        <div class="progress-extended"></div>
                                                    </div>
                                                </div>
                                                <table role="presentation" class="table m-b-0">
                                                    <tbody class="files"></tbody>
                                                </table>
                                            </div>
                                            <div class="w-100 text-right">
                                                <button class="btn btn-primary btn-round sendComment" data-id="{{support.id}}"
                                                    type="button">Gửi
                                                    tin
                                                    nhắn</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- <div class="tab-pane" id="schedule-1">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="card-title">Location of the product</h4>
                                        <p class="category">
                                            More information here
                                        </p>
                                    </div>
                                    <div class="card-content">
                                        Efficiently unleash cross-media information without cross-media value.
                                        Quickly maximize timely deliverables for real-time schemas.
                                        <br />
                                        <br /> Dramatically maintain clicks-and-mortar solutions without functional
                                        solutions.
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane" id="tasks-1">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="card-title">Legal info of the product</h4>
                                        <p class="category">
                                            More information here
                                        </p>
                                    </div>
                                    <div class="card-content">
                                        Completely synergize resource taxing relationships via premier niche
                                        markets. Professionally cultivate one-to-one customer service with robust
                                        ideas.
                                        <br />
                                        <br />Dynamically innovate resource-leveling customer service for state of
                                        the art customer service.
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane" id="tasks-2">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="card-title">Help center</h4>
                                        <p class="category">
                                            More information here
                                        </p>
                                    </div>
                                    <div class="card-content">
                                        From the seamless transition of glass and metal to the streamlined profile,
                                        every detail was carefully considered to enhance your experience. So while
                                        its display is larger, the phone feels just right.
                                        <br />
                                        <br /> Another Text. The first thing you notice when you hold the phone is
                                        how great it feels in your hand. The cover glass curves down around the
                                        sides to meet the anodized aluminum enclosure in a remarkable, simplified
                                        design.
                                    </div>
                                </div>
                            </div> -->
                        </div>
                    </div>
                </div>
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