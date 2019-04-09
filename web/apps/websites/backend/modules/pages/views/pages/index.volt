<main class="app-content">
    <div class="app-title">
        <div>
            <h1><i class="fa fa-th-list"></i> BÀI VIẾT</h1>
            <p>Quản lý bài viết</p>
        </div>
        <ul class="app-breadcrumb breadcrumb side">
            <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
            <li class="breadcrumb-item">Tài khoản</li>
        </ul>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <div class="col-12 p-0 mb-2">
                    <a id="addPosts" href="{{ config.application.backendUri }}/posts/add" title="Tạo" class="btn btn-success fa fa-plus"></a>
                </div>
                <div class="tile-body">
                    <table id="posts" class="table table-bordered table-hover">
                        <thead>
                            <tr class="bg-primary">
                                <th class="align-middle text-center text-white" style="width: 10px">#</th>
                                <th class="align-middle text-center text-white">Tiêu đề</th>
                                <th class="align-middle text-center text-white">Tác giả</th>
                                <th class="align-middle text-center text-white">Danh mục</th>
                                <th class="align-middle text-center text-white">Tags</th>
                                <th class="align-middle text-center text-white">Ngày đăng</th>
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
<div class="modal" id="modalPosts">
    <div class="modal-dialog" role="document" style="min-width: 80%">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Modal title</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
            </div>
            <form id="frmPosts" method="post" enctype="multipart/form-data" data-toggle="validator" role="form">

                <div class="modal-footer">
                    <button id="btnSummitPosts" type="submit" class="btn btn-success">Thêm mới</button>
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Đóng</button>
                </div>
            </form>
        </div>
    </div>
</div>