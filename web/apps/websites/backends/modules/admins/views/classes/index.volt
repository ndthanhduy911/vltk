<main class="app-content">
    <div class="app-title mb-3">
        <div>
            <h1><i class="fa fa-th-list"></i> DANH SÁCH LỚP</h1>
            <p>Quản lý lớp học</p>
        </div>
        <ul class="app-breadcrumb breadcrumb side">
            <li class="breadcrumb-item"><a class="link" href="{{ config.application.backenduri }}"><i class="fa fa-home fa-lg"></i></a></li>
            <li class="breadcrumb-item">Danh sách lớp</li>
        </ul>
    </div>

    <div class="body-message">
        <?php echo $this->flashSession->output(); ?>
    </div>

    <div class="row">
        <div class="col-md-12 p-0">
            <div class="tile">
                <div class="col-12 p-0 mb-2">
                    <a id="addClasses" href="{{ config.application.backendUri }}/classes/update" title="Tạo" class="btn btn-success fa fa-plus pull-right pull-right"></a>
                </div>
                <div class="tile-body">
                    <table id="classes" class="table table-bordered table-hover">
                        <thead>
                            <tr class="bg-primary">
                                <th class="align-middle text-center text-white w-20-px">#</th>
                                <th class="align-middle text-center text-white">Tiêu đề</th>
                                <th class="align-middle text-center text-white">Mô tả</th>
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