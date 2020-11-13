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
                {#
                {% if master.checkPermission('logs', 'print') %}
                <div class="btn-group float-right">
                    <a id="printLogs" href="<?= WEB_ADMIN_URL ?>/logs/export" data-toggle="tooltip" title="In báo cáo"
                        class="ml-2 btn btn-hnn btn-hnn-warning"><span>In báo cáo</span></a>
                </div>
                {% endif %}
                #}
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
                        <form action="" id="searchLogs" class="searchForm">
                            <div class="row d-md-flex align-items-md-center">
                                <span class="col-auto mt-2">Tìm kiếm</span>
                                <div class="form-group label-floating col-md-3">
                                    <div class="input-group">
                                        <label class="control-label">{{form_search.getLabel('nameSearch')}}</label>
                                        {{ form_search.render('nameSearch',['value': request.get('nameSearch')]) }}
                                        <div class="invalid-feedback">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group label-floating col-md-3">
                                    <div class="input-group">
                                        <label class="control-label">{{form_search.getLabel('typeidSearch')}}</label>
                                        {{ form_search.render('typeidSearch',['value': request.get('typeidSearch')]) }}
                                        <div class="invalid-feedback">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group col-auto mt-s-0">
                                    <button title="TÌm kiếm" data-toggle="tooltip" class="btn btn-hnn btn-hnn-info" type="submit"><span>Tìm</span></button>
                                </div>
                                {{ form_search.render('paged',['value': request.get('paged')]) }}
                            </div>
                        </form>
                        <div class="table-responsive">
                            <table id="logs" class="table table-bordered table-hover rounded">
                                <thead>
                                    <tr class="bg-browm">
                                        <th class="align-middle text-center">#</th>
                                        <th class="align-middle text-center">Loại</th>
                                        <th class="align-middle text-center">Tiêu đề</th>
                                        <th class="align-middle text-center">Tài khoản</th>
                                        <th class="align-middle text-center">IP</th>
                                        <th class="align-middle text-center">Trình duyệt</th>
                                        <th class="align-middle text-center">Hệ điều hành</th>
                                        <th class="align-middle text-center">Thời gian</th>
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