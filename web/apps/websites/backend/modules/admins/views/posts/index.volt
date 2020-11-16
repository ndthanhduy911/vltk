<div class="content-header">
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-6 d-flex align-items-center">
                <ol class="breadcrumb">
                    {% if dispatcher.getControllerName() != 'index' %}
                    <li class="breadcrumb-item"><a href="<?= WEB_ADMIN_URL ?>"><i class="fas fa-home"></i></a></li>
                    {% endif %}
                    <li class="breadcrumb-item active">{{ title }}</li>
                </ol>
            </div>
            <div class="col-sm-6">
                {% if master.checkPermission('posts', 'trashs') %}
                <div class="btn-group float-right">
                    <a id="deletePosts" data-href="<?= WEB_ADMIN_URL ?>/posts/trashs" title="Thùng rác"
                        class="ml-2 btn btn-hnn btn-hnn-danger"><span><i class="fas fa-trash"></i></span></a>
                </div>
                {% endif %}
                {% if master.checkPermission('posts', 'update') %}
                <div class="btn-group float-right">
                    <a id="addPosts" href="#" data-href="<?= WEB_ADMIN_URL ?>/posts/update" title="Tạo mới"
                        class="ml-2 btn btn-hnn btn-hnn-success"><span><i class="fas fa-plus"></i></span></a>
                </div>
                {% endif %}
            </div>
        </div>
    </div>
</div>

<div class="col-md-12">
    <div class="col-md-12">
        <?php echo $this->flashSession->output(); ?>
    </div>
</div>

<section class="content col-md-12">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card card-primary card-outline">
                    <div class="card-body">
                        <form action="" id="searchRole" class="searchForm">
                            <div class="row d-md-flex align-items-md-center">
                                <span class="col-auto mt-2">Tìm kiếm</span>
                                <div class="flex-1 col-auto row pr-0">
                                    <div class="col-md-12 row pr-0">
                                    {% for key,ffilter in fFilters %}
                                    <div class="form-group label-floating flex-1 col-auto">
                                        <div class="input-group">
                                            <label class="control-label">{{searchForm.getLabel(ffilter~'Search')}}</label>
                                            {{ searchForm.render(ffilter~'Search',['value': request.get(ffilter~'Search')]) }}
                                            <div class="invalid-feedback">
                                            </div>
                                        </div>
                                    </div>
                                    <?php if (($key+1) % \FilterSetting::getBeautyRow(count($fFilters)) == 0){ ?>
                                    </div>
                                    <div class="col-md-12 row pr-0">
                                    <?php } ?>
                                    {% endfor %}
                                    </div>
                                </div>
                                <div class="form-group col-auto mt-s-0">
                                    <button title="TÌm kiếm" data-toggle="tooltip" class="btn btn-hnn btn-hnn-info" type="submit"><span><i class="fas fa-search"></i></span></button>
                                </div>
                            </div>
                        </form>
                        <div class="table-responsive">
                            <table id="posts" class="table table-bordered table-hover rounded">
                                <thead>
                                    <tr>
                                        <th data-col="no" class="align-middle text-center" style="width: 20px;">
                                            <input id="assetCheckboxAll" type="checkbox" value="1">
                                        </th>
                                        <th data-col="no" class="align-middle text-center" style="width: 20px;">STT</th>
                                        {% for key,table in fTables %}
                                        <th data-col="{{table}}" class="align-middle text-center"><?= \Posts::filedName($table) ?></th>
                                        {% endfor %}
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