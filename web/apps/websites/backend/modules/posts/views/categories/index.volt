<main class="app-content">
    <div class="app-title">
        <div>
            <h1><i class="fa fa-th-list"></i> DANH MỤC</h1>
            <p>Quản lý danh mục</p>
        </div>
        <ul class="app-breadcrumb breadcrumb side">
            <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
            <li class="breadcrumb-item">Danh mục</li>
        </ul>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <div class="col-12 p-0 mb-2">
                    <a id="addPosts" href="{{ config.application.backendUri }}/categories/update" title="Tạo" class="btn btn-success fa fa-plus"></a>
                </div>
                <div class="tile-body">
                    <table id="categories" class="table table-bordered table-hover">
                        <thead>
                            <tr class="bg-primary">
                                <th class="align-middle text-center text-white w-20-px">#</th>
                                <th class="align-middle text-center text-white">Tiêu đề</th>
                                <th class="align-middle text-center text-white">Tác giả</th>
                                <th class="align-middle text-center text-white">Ngày đăng</th>
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