<main class="app-content">
    <div class="app-title mb-3">
        <div>
            <h1><i class="fa fa-th-list"></i> MENU</h1>
            <p>Quản lý vị trí menu</p>
        </div>
        <ul class="app-breadcrumb breadcrumb side">
            <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
            <li class="breadcrumb-item">Vị trí menu</li>
        </ul>
    </div>

    <div class="body-message">
        <?php echo $this->flashSession->output(); ?>
    </div>

    <div class="row">
        <div class="col-md-12 p-0">
            <div class="tile">
                <div class="col-12 p-0 mb-2">
                    <a id="addMenuLocation" href="<?= $this->config->application->backendUri ?>/menu/updatelocation" title="Tạo" class="btn btn-success fa fa-plus"></a>
                </div>
                <div class="tile-body">
                    <table id="menulocation" class="table table-bordered table-hover">
                        <thead>
                            <tr class="bg-primary">
                                <th class="align-middle text-center text-white">#</th>
                                <th class="align-middle text-center text-white">Tên vị trí</th>
                                <th class="align-middle text-center text-white">Mô tả</th>
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