<form action="<?= WEB_ADMIN_URL.'/backup/update' ?>" id="frmBackup" class="customForm" method="post"
    enctype="multipart/form-data" data-toggle="validator" type="form" novalidate="true">
    <div class="content-header">
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-6 d-flex align-items-center">
                    <ol class="breadcrumb">
                        {% if dispatcher.getControllerName() != 'index' %}
                        <li class="breadcrumb-item"><a href="<?= WEB_ADMIN_URL ?>"><i class="fas fa-home"></i></a></li>
                        {% endif %}
                        <li class="breadcrumb-item active">{{ title }} - Sao lưu và khôi phục dữ liệu hệ thống</li>
                    </ol>
                </div>
                <div class="col-sm-6">
                    <div class="float-right">
                        <button type="submit" class="btn btn-hnn btn-hnn-success mr-2" title="Lưu thông tin"
                            data-toggle="tooltip"><span>Lưu thiết lập</span></button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="col-md-12">
        <div class="col-md-12" id="blockSession">
            <?php echo $this->flashSession->output(); ?>
        </div>
    </div>

    <section class="content col-md-12">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="card card-primary card-outline">
                        <div class="card-body">
                            <h5 class="text-primary mb-0">Thiết lập sao lưu dự phòng</h5>
                            <div class="row">
                                <div class="form-group col-md-12">
                                    <div class="custom-control custom-checkbox">
                                        <input class="custom-control-input" type="checkbox" name="is_enable_backup" id="is_enable_backup" value="1" {{ (!configData["enable_backup"] ? '' : 'checked') }}>
                                        <label style="line-height: 2;" for="is_enable_backup" class="custom-control-label font-weight-normal">Kích hoạt chức năng sao lưu</label>
                                    </div>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="row">
                                        <div class="form-group mt-auto mb-auto col-auto">
                                            <div class="custom-control custom-radio">
                                                <input class="custom-control-input" type="radio" id="type1" name="period" value="hour" {{ (configData['period'] == 'hour' ? 'checked' : '') }}>
                                                <label style="line-height: 2;" for="type1" class="custom-control-label">Định kỳ theo ngày (Giờ trong ngày)</label>
                                            </div>
                                        </div>
                                        <div class="form-group mt-auto mb-auto col-md-6 label-floating">
                                            <div class="input-group">
                                                <input type="text" name="period_value[hour]"
                                                    class="form-control form-control-sm timePicker" maxlength="100"
                                                    placeholder="Ví dụ: 00:00" value="{{ (configData['period'] == 'hour' ? configData['period_value'] : '') }}">
                                                <div class="invalid-feedback">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="row">
                                        <div class="form-group mt-auto mb-auto col-auto">
                                            <div class="custom-control custom-radio">
                                                <input class="custom-control-input" type="radio" id="type2" name="period" value="week" {{ (configData['period'] == 'week' ? 'checked' : '') }}>
                                                <label style="line-height: 2;" for="type2" class="custom-control-label">Định kỳ theo tuần (Thứ trong tuần)</label>
                                            </div>
                                        </div>
                                        <div class="form-group mt-auto mb-auto col-md-6 label-floating">
                                            <div class="input-group">
                                                <select name="period_value[week]"
                                                    class="form-control form-control-sm">
                                                    {% for index, item in helper.dayOfWeek() %}
                                                    <option value="{{index}}" 
                                                    {{ ((configData['period'] == 'week' ? configData['period_value'] : '') == index ? 'selected' : '') }}
                                                     >{{item}}</option>
                                                    {% endfor %}
                                                </select>
                                                <div class="invalid-feedback">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="row">
                                        <div class="form-group mt-auto mb-auto col-auto">
                                            <div class="custom-control custom-radio">
                                                <input class="custom-control-input" type="radio" id="type3"
                                                    name="period" value="day" {{ (configData['period'] == 'day' ? 'checked' : '') }}>
                                                <label style="line-height: 2;" for="type3" class="custom-control-label">Định kỳ theo tháng (Ngày của tháng)</label>
                                            </div>
                                        </div>
                                        <div class="form-group mt-auto mb-auto col-md-6 label-floating">
                                            <div class="input-group">
                                                <select name="period_value[day]"
                                                    class="form-control form-control-sm">
                                                    <?php for ($i=1; $i <= 28; $i++) {  ?>
                                                    <option value="{{i}}" 
                                                    {{ ((configData['period'] == 'day' ? configData['period_value'] : '') == i ? 'selected' : '') }}
                                                     >Ngày {{i}}</option>
                                                    <?php } ?>
                                                </select>
                                                <div class="invalid-feedback"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="form-group col-md-4 label-floating col-md-3">
                                    <div class="input-group">
                                        <label class="control-label">Giới hạn số lượng tập tin sao lưu</label>
                                        <input type="number" id="max_number_file_backup" name="max_number_file_backup" class="form-control form-control-sm" max="1000" placeholder="Ví dụ: 10" value="{{ configData['max_number_file_backup'] }}">
                                        <div class="invalid-feedback"></div>
                                    </div>
                                </div>
                            </div>
                            <input class="tokenCSRF" type='hidden' name="{{security.getTokenKey()}}" value="{{security.getToken()}}"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</form>

<section class="content col-md-12">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card card-primary card-outline">
                    <div class="card-body">
                        <form action="" id="searchAssetOrigin" class="searchForm">
                            <div class="row d-md-flex align-items-md-center">
                                <span class="col-auto mt-2">Tìm kiếm</span>
                                <div class="form-group label-floating flex-1 col-auto">
                                    <div class="input-group">
                                        <label class="control-label">{{formSearch.getLabel('nameSearch')}}</label>
                                        {{ formSearch.render('nameSearch',['value': request.get('nameSearch')]) }}
                                        <div class="invalid-feedback">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group label-floating flex-1 col-auto">
                                    <div class="input-group">
                                        <label
                                            class="control-label">{{formSearch.getLabel('createddateSearch')}}</label>
                                        {{ formSearch.render('createddateSearch',['value': request.get('createddateSearch')]) }}
                                        <div class="invalid-feedback">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group col-auto mt-s-0">
                                    <button title="TÌm kiếm" data-toggle="tooltip" class="btn btn-hnn btn-hnn-info"
                                        type="submit"><span>Tìm</span></button>
                                </div>
                                {{ formSearch.render('paged',['value': request.get('paged')]) }}
                            </div>
                        </form>
                        <h5 class="text-primary mb-0">Danh sách tập tin sao lưu</h5>
                        <div class="table-responsive">
                            <table id="backup" class="table table-bordered table-hover rounded">
                                <thead>
                                    <tr class="bg-browm">
                                        <th class="align-middle text-center" style="width: 30px;">STT</th>
                                        <th class="align-middle">Thời gian</th>
                                        <th class="align-middle">Tên tập tin</th>
                                        <th class="align-middle">Kích thước</th>
                                        <th class="align-middle text-center">Số lượt tải</th>
                                        <th class="align-middle text-center" style="width: 60px;">Tải về</th>
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