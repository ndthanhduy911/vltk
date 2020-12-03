<div class="content-header">
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-6 d-flex align-items-center">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="<?= WEB_ADMIN_URL ?>"><i class="fas fa-home"></i></a></li>
                    <li class="breadcrumb-item active">{{ title }}</li>
                </ol>
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
            <div class="col-md-6">
                <div class="card card-primary card-outline">
                    <div class="card-header">
                        <h3 class="card-title">Menu Đầu trang</h3>
                        <div class="card-tools">
                            <a id="addHeadMenu" data-href="<?= WEB_ADMIN_URL ?>/meuns/add/{{headId}}" class="btn btn-sm btn-hnn btn-hnn-success"><span><i class="fas fa-plus"></i></span></a>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table id="headMenus" class="table table-bordered table-hover rounded" locationid="{{headId}}">
                                <thead>
                                    <tr>
                                        <th data-col="name" class="align-middle">Tiêu đề</th>
                                        <th data-col="status" class="align-middle text-center">Trạng thái</th>
                                        <th data-col="id" class="align-middle text-center">Thao tác</th>
                                    </tr>
                                </thead>
                                <tbody>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card card-primary card-outline">
                    <div class="card-header">
                        <h3 class="card-title">Menu Cuối trang</h3>
                        <div class="card-tools">
                            <a id="addFootMenu" data-href="<?= WEB_ADMIN_URL ?>/meuns/add/{{footId}}" class="btn btn-sm btn-hnn btn-hnn-success"><span><i class="fas fa-plus"></i></span></a>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table id="footMenus" class="table table-bordered table-hover rounded" locationid="{{footId}}">
                                <thead>
                                    <tr>
                                        <th data-col="no" class="align-middle text-center">Tiêu đề</th>
                                        <th data-col="no" class="align-middle text-center">Trạng thái</th>
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

<div class="modal fade" id="modalMenus">
    <div class="modal-dialog" style="max-width: 1350px; width: 98%;">
        <div class="modal-content">
            {{form('method':'post','id':'frmMenus','enctype':'multipart/form-data','data-toggle':'validator','role':'form', 'action':'', 'class':'customForm')}}
            <div class="modal-header">
                <h4 class="modal-title"></h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">

                <input class="tokenCSRF" type='hidden' name='<?php echo $this->security->getTokenKey() ?>'
                    value='<?php echo $this->security->getToken() ?>' />
            </div>
            <div class="modal-footer justify-content-between">
                <button type="button" class="btn btn-hnn btn-hnn-default"
                    data-dismiss="modal"><span>Đóng</span></button>
                <button type="submit" class="btn btn-hnn btn-hnn-info btnSummitMenus"><span>Thêm mới</span></button>
            </div>
            {{end_form()}}
        </div>
    </div>
</div>