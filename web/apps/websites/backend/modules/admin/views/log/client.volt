<!-- Bread crumb -->
<div class="row page-titles">
    <div class="col-md-8 align-self-center">
        <h3 class="text-hnn font-weight-bold">QUẢN LÝ LOG NGƯỜI DÙNG</h3>
        <span>Quản lý các hành động có thay đổi dữ liệu dưới cơ sở dữ liệu cũng như quản lý đăng nhập của các tài khoản người dùng</span>
    </div>
    <div class="col-md-4 align-self-center">
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a href="{{ url('/adcp/dashboard') }}">BẢNG ĐIỀU KHIỂN</a>
            </li>
            <li class="breadcrumb-item active">Quản lý log người dùng</li>
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
                        <h2 class="card-title font-weight-bold col-md-11" style="font-size: 1rem">Danh sách log
                        </h2>
                    </div>
                    <div class="table-responsive">
                        <table id="log_client" class="table table-bordered table-hover">
                            <thead class="text-center" style="line-height: 2.5">
                                <tr style="background: #EE161E">
                                    <th class="align-middle text-white">#</th>
                                    <th class="align-middle text-white">Loại</th>
                                    <th class="align-middle text-white">Tài khoản</th>
                                    <th class="align-middle text-white">Tiêu đề</th>
                                    <th class="align-middle text-white">Thời gian</th>
                                    <th class="align-middle text-white text-center">Chi tiết</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php $stt=1; ?>{% for log in logs %}
                                <tr class="text-center">
                                    <td><?php echo $stt++ ?></td>
                                    <td class="align-middle"><?php echo $this->helper->get_type_log($log->type) ?></td>
                                    <?php $user_key = array_search($log->user_id, array_column($user, 'id')); ?>
                                    <td class="align-middle"><?php echo $user_key || $user_key===0? $user[$user_key]['name'] : '' ?></td>
                                    <td class="align-middle">{{ log.name }}</td>
                                    <td class="align-middle"> <?php echo $log->created_at ? date_format(date_create($log->created_at),"d-m-Y H:i:s") : '' ?></td>
                                    <td class="align-middle text-center">
                                        <?php if($this->rolemaster::isPermission($this->session->get("permission"),'log','view')){ ?>
                                        <a class="viewLog btn btn-primary btn-sm m-2-4" href="/adcp/log/view/{{ log.id }}">
                                            <i class="fa fa-eye"></i>
                                        </a>
                                        <?php } ?>
                                        <?php if($this->rolemaster::isPermission($this->session->get("permission"),'log','delete')){ ?>
                                        <!-- <a class="delete-confirm btn btn-danger btn-sm m-2-4" data-id={{ log.id }} href="/adcp/log/delete" obj="Log">
                                            <i class="fa fa-remove"></i>
                                        </a> -->
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

<div id="modalViewLog" class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="modalViewLogLabel"
    aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header" style="background: #EE161E">
                <h5 class="modal-title text-white" id="modalViewLogLabel">View Log</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Đóng" style="font-size: 2rem; padding: 0; margin-right: 15px; margin-top: 0px;">
                    <span class="text-white" aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="" id="frmViewLog" method="post" data-toggle="validator" role="form">
                <div class="modal-body">
                    <div class="container">
                        ĐANG CẬP NHẬT...
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                </div>
            </form>
        </div>
    </div>
</div>