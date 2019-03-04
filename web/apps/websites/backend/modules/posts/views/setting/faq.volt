<!-- Bread crumb -->
<div class="row page-titles">
    <div class="col-md-8 align-self-center">
        <h3 class="text-hnn font-weight-bold">THIẾT LẬP CÂU HỎI THƯỜNG GẶP</h3>
        <span>Quản lý các câu hỏi thường gặp ở trang quản trị hoặc trang hiển thị phía người dùng</span>
    </div>
    <div class="col-md-4 align-self-center">
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a href="{{ url('/adcp/dashboard') }}">BẢNG ĐIỀU KHIỂN</a>
            </li>
            <li class="breadcrumb-item active">Thiết lập câu hỏi thường gặp</li>
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
                        <h2 class="card-title font-weight-bold col-md-11" style="font-size: 1rem">Danh sách câu hỏi thường gặp
                        </h2>
                        <?php if($this->rolemaster::isPermission($this->session->get("permission"),'setting','faq')){ ?>
                        <span class="col-md-1">
                            <a href="/adcp/setting/addfaq" class="addFaq btn btn-success waves-effect waves-light m-r-5">
                                <i class="fa fa-plus"></i>
                            </a>
                        </span>
                        <?php } ?>
                    </div>
                    <div class="table-responsive">
                        <table id="faq" class="table table-bordered table-hover">
                            <thead class="text-center" style="line-height: 2.0">
                                <tr style="background: #EE161E">
                                    <th class="align-middle text-white">STT</th>
                                    <th class="align-middle text-white">Loại dịch vụ</th>
                                    <th class="align-middle text-white">Câu hỏi</th>
                                    <th class="align-middle text-white">Trả lời</th>
                                    <th class="align-middle text-white">Trang hiển thị</th>
                                    <th class="align-middle text-white" style="min-width: 100px">Trạng thái</th>
                                    <th class="align-middle text-white text-center" style="min-width: 100px;">Thao tác</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php $stt=1 ?>{% for faq in page.items %}
                                <tr class="text-center">
                                    <td><?php echo $stt++ ?></td>
                                    <td class="align-middle"><span class="tb_package" data-id="{{ faq.package_id }}">{{ faq.package_name }}</span></td>
                                    <td class="align-middle"><span class="tb_ask">{{ faq.ask }}</span></td>
                                    <td class="align-middle"><span class="tb_answer">{{ faq.answer }}</span></td>
                                    <td class="align-middle">
                                        {% if faq.location == 1 %}
                                        <span data-id="{{faq.location}}" class="badge badge-success tb_location" style="font-size: 0.7rem; padding: 0.5rem">Quản trị</span>
                                        {% elseif faq.location == 2 %}
                                        <span data-id="{{faq.location}}" class="badge badge-primary tb_location" style="font-size: 0.7rem; padding: 0.5rem">Người dùng</span>
                                        {% else %}
                                        <span data-id="{{faq.location}}" class="badge badge-info tb_location" style="font-size: 0.7rem; padding: 0.5rem">Tất cả</span>
                                        {% endif %}
                                    </td>
                                    <td class="align-middle">
                                        {% if faq.status == 1 %}
                                        <span data-id="{{faq.status}}" class="badge badge-success tb_status" style="font-size: 0.7rem; padding: 0.5rem">Active</span>
                                        {% else %}
                                        <span data-id="{{faq.status}}" class="badge badge-danger tb_status" style="font-size: 0.7rem; padding: 0.5rem">Disabled</span>
                                        {% endif %}
                                    </td>
                                    <td class="align-middle text-center">
                                        <?php if($this->rolemaster::isPermission($this->session->get("permission"),'setting','editfaq')){ ?>
                                        <a class="editFaq btn btn-primary btn-sm m-2-4" href="/adcp/setting/editfaq/{{ faq.id }}">
                                            <i class="fa fa-edit"></i>
                                        </a>
                                        <?php } ?>
                                        <?php if($this->rolemaster::isPermission($this->session->get("permission"),'faq','delete')){ ?>
                                        <a class="delete-confirm btn btn-danger btn-sm m-2-4" data-id={{ faq.id }} href="/adcp/setting/deletefaq" obj="Câu hỏi">
                                            <i class="fa fa-remove"></i>
                                        </a>
                                        <?php } ?>
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
    <!-- End PAge Content -->
</div>

<div id="modalEditFaq" class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="modalEditFaqLabel"
    aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header" style="background: #EE161E">
                <h5 class="modal-title text-white" id="modalEditFaqLabel">Edit faq</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Đóng" style="font-size: 2rem; padding: 0; margin-right: 15px; margin-top: 0px;">
                    <span class="text-white" aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="" id="frmEditFaq" method="post" data-toggle="validator" role="form">
                <div class="modal-body">
                    <div class="container">
                        <div class="form-row">
                            <div class="col-md-12 mb-3 group-val">
                                {{ form.label('package_id') }}
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" style="background: #EE161E">
                                            <i class="fa fa-edit text-white"></i>
                                        </span>
                                    </div>
                                    {{ form.render('package_id') }}
                                    <div class="invalid-tooltip">

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-md-12 mb-3 group-val">
                                {{ form.label('ask') }}
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" style="background: #EE161E">
                                            <i class="fa fa-edit text-white"></i>
                                        </span>
                                    </div>
                                    {{ form.render('ask') }}
                                    <div class="invalid-tooltip">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-md-12 mb-3 group-val">
                                {{ form.label('answer') }}
                                <div class="input-group">
                                    {{ form.render('answer') }}
                                    <input name="image" type="file" id="upload" class="hidden" onchange="">
                                    <div class="invalid-tooltip">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-md-6 mb-3 group-val">
                                {{ form.label('location') }}
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" style="background: #EE161E">
                                            <i class="fa fa-edit text-white"></i>
                                        </span>
                                    </div>
                                    {{ form.render('location') }}
                                    <div class="invalid-tooltip">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 mb-3 group-val">
                                {{ form.label('status') }}
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" style="background: #EE161E">
                                            <i class="fa fa-edit text-white"></i>
                                        </span>
                                    </div>
                                    {{ form.render('status') }}
                                    <div class="invalid-tooltip">

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-danger">Update</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                </div>
            </form>
        </div>
    </div>
</div>