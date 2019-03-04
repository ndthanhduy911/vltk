<div class="row page-titles">
    <div class="col-md-5 align-self-center">
        <h3 class="text-hnn font-weight-bold">NGÔN NGỮ</h3>
    </div>
    <div class="col-md-7 align-self-center">
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a href="{{ url('/adcp/dashboard') }}">BẢNG ĐIỀU KHIỂN</a>
            </li>
            <li class="breadcrumb-item active">Ngôn ngữ</li>
        </ol>
    </div>
</div>
<?php echo $this->flashSession->output() ?>
<!-- End Bread crumb -->
<div class="container-fluid">
    <!-- Start Page Content -->
    <div class="row">
        <div class="col-12">
            <div class="card" style="font-size: 0.8rem">
                <div class="card-body">
                    <div class="table-responsive">
                        <table id="language" class="table table-bordered table-hover">
                            <thead class="text-center" style="line-height: 2.5">
                                <tr style="background: #EE161E">
                                    <th class="align-middle text-white">STT</th>
                                    <th class="align-middle text-white">ID</th>
                                    <th class="align-middle text-white">Controller</th>
                                    <th class="align-middle text-white">Tiếng Việt</th>
                                    <th class="align-middle text-white">Tiếng Anh</th>
                                    <th class="align-middle text-white text-center" style="min-width: 100px;">Thao tác</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php $stt = 1; ?>
                                <?php foreach ($languages_frontend as $key => $controller) { ?>
                                    <?php foreach ($controller as $lang) { ?>
                                        <tr class="text-center">
                                            <td><?= $stt++ ?></td>
                                            <td class="align-middle"><span class="lang-id">{{lang['id']}}</span></td>
                                            <td class="align-middle"><span class="lang-cl">{{key}}</span></td>
                                            <td class="align-middle"><span class="lang-vi">{{lang['vi']}}</span></td>
                                            <td class="align-middle"><span class="lang-en">{{lang['en']}}</span></td>
                                            <td class="align-middle text-center">
                                                <a class="editLanguage btn btn-primary btn-sm m-2-4" href="javascript:;" data-href="/adcp/language/edit">
                                                    <i class="fa fa-edit"></i>
                                                </a>
                                                <a class="btn btn-danger btn-sm m-2-4" data-id={{lang['id']}} href="/adcp/department/delete" obj="Nội dung">
                                                    <i class="fa fa-remove"></i>
                                                </a>
                                            </td>
                                        </tr>
                                    <?php } ?>
                                <?php } ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End PAge Content -->
</div>

<div id="modalEditLanguage" class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="modalEditLanguageLabel"
    aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header" style="background: #EE161E">
                <h5 class="modal-title text-white" id="modalEditLanguageLabel">Cập nhật</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Đóng" style="font-size: 2rem; padding: 0; margin-right: 15px; margin-top: 0px;">
                    <span class="text-white" aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="" id="frmEditLanguage" method="post" data-toggle="validator" role="form">
                <div class="modal-body">
                    <div class="container">
                        <div class="form-row">
                            <div class="col-md-12 mb-3 group-val">
                                {{ form.label('lang_vi') }}
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" style="background: #EE161E">
                                            <i class="fa fa-edit text-white"></i>
                                        </span>
                                    </div>
                                    {{ form.render('lang_vi') }}
                                    <div class="invalid-tooltip">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12 mb-3 group-val">
                                {{ form.label('lang_en') }}
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" style="background: #EE161E">
                                            <i class="fa fa-edit text-white"></i>
                                        </span>
                                    </div>
                                    {{ form.render('lang_en') }}
                                    <div class="invalid-tooltip">
                                    </div>
                                </div>
                            </div>
                        </div>
                        {{ form.render('lang_id') }}
                        {{ form.render('lang_cl') }}
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-danger">Cập nhật</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                </div>
            </form>
        </div>
    </div>
</div>