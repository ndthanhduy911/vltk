<div class="content-header">
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-6 d-flex align-items-center">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="<?= WEB_ADMIN_URL ?>"><i class="fas fa-home"></i></a></li>
                    <li class="breadcrumb-item active">{{ title }}</li>
                </ol>
            </div>
            <div class="col-sm-6">
                {% if master.checkPermission('categories', 'delete') %}
                <div class="btn-group float-right">
                    <a href="<?= WEB_ADMIN_URL ?>/categories/delete" title="Xóa"
                        class="btn btn-hnn btn-hnn-danger ml-2"><span><i class="fas fa-trash"></i></span></a>
                </div>
                {% endif %}
                {% if master.checkPermission('categories', 'update') %}
                <div class="btn-group float-right">
                    <a id="addCategories" href="<?= WEB_ADMIN_URL ?>/categories/view" title="Tạo mới"
                        class="btn btn-hnn btn-hnn-success"><span><i class="fas fa-plus"></i></span></a>
                </div>
                {% endif %}
            </div>
        </div>
    </div>
</div>

<div class="col-md-12">
    <div class="col-md-12">
        {{flashSession.output()}}
    </div>
</div>

<section class="content col-md-12">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card card-primary card-outline">
                    <div class="card-body">
                        <form action="" id="searchCategories" class="searchForm">
                            <div class="row d-md-flex align-items-md-center">
                                <span class="col-auto mt-2">Tìm kiếm</span>
                                <div class="flex-1 col-auto row pr-0">
                                    <div class="form-group label-floating flex-1 col-auto">
                                        <div class="input-group">
                                            <label class="control-label">{{searchForm.getLabel('nameSearch')}}</label>
                                            {{ searchForm.render('nameSearch',['value': request.get('nameSearch')]) }}
                                            <div class="invalid-feedback"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="flex-1 col-auto row pr-0">
                                    <div class="form-group label-floating flex-1 col-auto">
                                        <div class="input-group">
                                            <label class="control-label">{{searchForm.getLabel('statusSearch')}}</label>
                                            {{ searchForm.render('statusSearch',['value': request.get('statusSearch')]) }}
                                            <div class="invalid-feedback"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="flex-1 col-auto row pr-0">
                                    <div class="form-group label-floating flex-1 col-auto">
                                        <div class="input-group">
                                            <label class="control-label">{{searchForm.getLabel('createdatSearch')}}</label>
                                            {{ searchForm.render('createdatSearch',['value': request.get('createdatSearch')]) }}
                                            <div class="invalid-feedback"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group col-auto mt-s-0">
                                    <button title="TÌm kiếm" data-toggle="tooltip" class="btn btn-hnn btn-hnn-info" type="submit"><span><i class="fas fa-search"></i></span></button>
                                </div>
                            </div>
                        </form>
                        <div class="table-responsive">
                            <table id="categories" class="table table-bordered table-hover rounded">
                                <thead>
                                    <tr>
                                        <th data-col="no" class="align-middle text-center" style="width: 20px;">
                                            <input id="categoriesCheckboxAll" type="checkbox" value="1">
                                        </th>
                                        <th data-col="no" class="align-middle text-center" style="width: 20px;">STT</th>
                                        <th data-col="image" class="align-middle text-center">Ảnh đại diện</th>
                                        <th data-col="title" class="align-middle text-center">Tiêu đề</th>
                                        <th data-col="excerpt" class="align-middle text-center">Mô tả</th>
                                        <th data-col="createdat" class="align-middle text-center">Ngày đăng</th>
                                        <th data-col="status" class="align-middle text-center">Trạng thái</th>
                                        <th data-col="no" class="align-middle text-center">Thao tác</th>
                                    </tr>
                                </thead>
                                <tbody>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</section>