<main class="app-content">
    <div class="app-title mb-3">
        <div>
            <h1><i class="fa fa-th-list"></i> Nhân sự</h1>
            <p>Quản lý nhân sự</p>
        </div>
        <ul class="app-breadcrumb breadcrumb side">
            <li class="breadcrumb-item"><a class="link" href="{{ config.application.backenduri }}"><i class="fa fa-home fa-lg"></i></a></li>
            <li class="breadcrumb-item">Nhân sự</li>
        </ul>
    </div>

    <div class="body-message">
        <?php echo $this->flashSession->output(); ?>
    </div>

    <div class="row">
        <div class="col-md-12 p-0">
            <div class="tile">
                <div class="col-12 p-0 mb-2 text-right">
                    <a id="addPosts" href="{{ config.application.backendUri }}/staff/update" title="Tạo" class="btn btn-success fa fa-plus pull-right"></a>
                </div>
                <div class="tile-body">
                    <table id="staff" class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th class="align-middle text-center text-white w-20-px">#</th>
                                <th class="align-middle text-center text-white">Ảnh đại diện</th>
                                <th class="align-middle text-center text-white">Họ & Tên</th>
                                <th class="align-middle text-center text-white">Chức vụ</th>
                                <th class="align-middle text-center text-white">Bộ môn</th>
                                <th class="align-middle text-center text-white w-150-px">Ngày đăng</th>
                                <th class="align-middle text-center text-white w-70-px">Trạng thái</th>
                                <th class="align-middle text-center text-white w-70-px">Thao tác</th>
                            </tr>
                        </thead>
                        <tbody>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</main>