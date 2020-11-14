<main class="app-content">
    <div class="app-title mb-3">
        <div>
            <h1><i class="fa fa-th-list"></i> LỊCH HỌC</h1>
            <p>Quản lý lịch học</p>
        </div>
        <ul class="app-breadcrumb breadcrumb side">
            <li class="breadcrumb-item"><a class="link" href="{{ config.application.backenduri }}"><i class="fa fa-home fa-lg"></i></a></li>
            <li class="breadcrumb-item">Lịch học</li>
        </ul>
    </div>

    <div class="body-message">
        <?php echo $this->flashSession->output(); ?>
    </div>

    <div class="row">
        <div class="col-md-12 p-0">
            <div class="tile">
                <div class="col-12 p-0 mb-2">
                    <a id="addCalendars" href="{{ config.application.backendUri }}/calendars/update" title="Tạo" class="btn btn-success fa fa-plus pull-right pull-right"></a>
                </div>
                <div class="tile-body">
                    <table id="calendars" class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th class="align-middle text-center text-white w-20-px">#</th>
                                <th class="align-middle text-center text-white">Tên môn học</th>
                                <th class="align-middle text-center text-white">Học kỳ</th>
                                <th class="align-middle text-center text-white">Ngày bắt đầu</th>
                                <th class="align-middle text-center text-white">Bắt đầu</th>
                                <th class="align-middle text-center text-white">Kết thúc</th>
                                <th class="align-middle text-center text-white">Phòng học</th>
                                <th class="align-middle text-center text-white">Trạng thái</th>
                                <th class="align-middle text-center text-white">Thao tác</th>
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