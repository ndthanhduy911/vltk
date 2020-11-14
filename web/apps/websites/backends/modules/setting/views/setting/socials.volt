<main class="app-content">
    <div class="app-title mb-3">
        <div>
            <h1><i class="fa fa-th-list"></i> BIỂU TƯỢNG</h1>
            <p>Quản lý biểu tượng</p>
        </div>
        <ul class="app-breadcrumb breadcrumb side">
            <li class="breadcrumb-item"><a class="social" href="{{ config.application.backenduri }}"><i class="fa fa-home fa-lg"></i></a></li>
            <li class="breadcrumb-item">Biểu tượng</li>
        </ul>
    </div>

    <div class="body-message">
        <?php echo $this->flashSession->output(); ?>
    </div>

    <div class="row">
        <div class="col-md-12 p-0">
            <div class="tile">
                <div class="tile-body">
                    <table id="socials" class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th class="align-middle text-center text-white w-20-px">#</th>
                                <th class="align-middle text-center text-white">Tiêu đề</th>
                                <th class="align-middle text-center text-white">Biểu tượng</th>
                                <th class="align-middle text-center text-white">Link</th>
                                <th class="align-middle text-center text-white">Sắp xếp</th>
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