<div class="container-fluid">
    <div class="row">
        <div class="col-lg-3 col-md-6 col-sm-6">
            <div class="card card-stats">
                <div class="card-header" data-background-color="blue">
                    <i class="material-icons">feedback</i>
                </div>
                <div class="card-content">
                    <p class="category"><?= $this->ml::_ml('Những yêu cầu hỗ trợ','frontend','dashboard_count_support','dashboard') ?></p>
                    <h3 class="card-title">{{count_support}}</h3>
                </div>
                <div class="card-footer">
                    <div class="stats">
                        <i class="material-icons text-danger">add_box</i>
                        <a class="backTable" href="/support/list/"><?= $this->ml::_ml('Chi tiết','frontend','dashboard_detail','dashboard')?></a>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6 col-sm-6">
            <div class="card card-stats">
                <div class="card-header" data-background-color="green">
                    <i class="material-icons">done_all</i>
                </div>
                <div class="card-content">
                    <p class="category"><?= $this->ml::_ml('Yêu cầu đã hoàn thành','frontend','support_done','dashboard')?></p>
                    <h3 class="card-title">{{count_support_done}}</h3>
                </div>
                <div class="card-footer">
                    <div class="stats">
                        <i class="material-icons text-danger">add_box</i>
                        <a class="backTable" href="/support/list/"><?= $this->ml::_ml('Chi tiết','frontend','dashboard_detail','dashboard')?></a>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6 col-sm-6">
            <div class="card card-stats">
                <div class="card-header" data-background-color="orange">
                    <i class="material-icons">warning</i>
                </div>
                <div class="card-content">
                    <p class="category"><?= $this->ml::_ml('Yêu cầu chưa hoàn thành','frontend','dashboard_support_notdoing','dashboard')?></p>
                    <h3 class="card-title">{{count_support_notdoing}}</h3>
                </div>
                <div class="card-footer">
                    <div class="stats">
                        <i class="material-icons text-danger">add_box</i>
                        <a class="backTable" href="/support/list/"><?= $this->ml::_ml('Chi tiết','frontend','dashboard_detail','dashboard')?></a>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6 col-sm-6">
            <div class="card card-stats">
                <div class="card-header" data-background-color="blue">
                    <i class="material-icons">chat</i>
                </div>
                <div class="card-content">
                    <p class="category"><?= $this->ml::_ml('Các bình luận mới','frontend','dashboard_new_comment','dashboard')?></p>
                    <h3 class="card-title">{{count_comment_new}}</h3>
                </div>
                <div class="card-footer">
                    <div class="stats">
                        <i class="material-icons text-danger">add_box</i>
                        <a href="#" id="btn-messageShow"><?= $this->ml::_ml('Chi tiết','frontend','dashboard_detail','dashboard')?></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <h3 class="m-b-0"><?= $this->ml::_ml('BIỂU ĐỒ THỐNG KÊ','frontend','dashboard_chart','dashboard')?></h3>
    <div class="row">
        <div class="col-md-12">
            <div class="card p-t-10 p-r-10 p-l-10 p-b-16">
                <div class="support-chart">
                    <canvas id="support-chart"></canvas>
                </div>
                <div class="m-t-15">
                    <div class="w-50">
                        <div class="col-lg-5 col-md-6 col-sm-3">
                            <select class="selectpicker" data-style="btn btn-primary btn-round" name="select_chart" id="select_chart"
                                title="<?= $this->ml::_ml('Tùy chọn','frontend','dashboard_chart_select','dashboard')?>" data-size="7">
                                <option value=""><?= $this->ml::_ml('Tùy chọn','frontend','dashboard_chart_select','dashboard')?></option>
                                <option value="1"><?= $this->ml::_ml('Ngày','frontend','dashboard_chart_date','dashboard')?></option>
                                <option value="2"><?= $this->ml::_ml('Tháng','frontend','dashboard_chart_month','dashboard')?></option>
                                <option value="3"><?= $this->ml::_ml('Năm','frontend','dashboard_chart_year','dashboard')?></option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="row col-md-12 pb-3 hidden select_chart" id="select_chart1">
                    <div class="col-md-6">
                        <label><?= $this->ml::_ml('Ngày bắt đầu','frontend','dashboard_chart_date_begin','dashboard')?></label>
                        <div class="input-group">
                            <span class="input-group-addon">
                                <i class="fa fa-calendar"></i>
                            </span>
                            <input type="text" id="begin_date" value="" class="form-control datepicker" placeholder="<?= $this->ml::_ml('Ngày bắt đầu','frontend','dashboard_chart_date_begin','dashboard')?>">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <label><?= $this->ml::_ml('Ngày kết thúc','frontend','dashboard_chart_date_end','dashboard')?></label>
                        <div class="input-group">
                            <span class="input-group-addon">
                                <i class="fa fa-calendar"></i>
                            </span>
                            <input type="text" id="end_date" value="" class="form-control datepicker" placeholder="<?= $this->ml::_ml('Ngày kết thúc','frontend','dashboard_chart_date_end','dashboard')?>">
                        </div>
                    </div>
                </div>
                <div class="row col-md-12 pb-3 hidden select_chart" id="select_chart2">
                    <div class="col-md-6">
                        <label><?= $this->ml::_ml('Tháng bắt đầu','frontend','dashboard_chart_month_begin','dashboard')?></label>
                        <div class="input-group">
                            <span class="input-group-addon">
                                <i class="fa fa-calendar"></i>
                            </span>
                            <input type="text" id="begin_month" value="" class="form-control datepicker" placeholder="<?= $this->ml::_ml('Tháng bắt đầu','frontend','dashboard_chart_month_begin','dashboard')?>">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <label><?= $this->ml::_ml('Tháng kết thúc','frontend','dashboard_chart_month_end','dashboard')?></label>
                        <div class="input-group">
                            <span class="input-group-addon">
                                <i class="fa fa-calendar"></i>
                            </span>
                            <input type="text" id="end_month" value="" class="form-control datepicker" placeholder="<?= $this->ml::_ml('Tháng kết thúc','frontend','dashboard_chart_month_end','dashboard')?>">
                        </div>
                    </div>
                </div>
                <div class="row col-md-12 pb-3 hidden select_chart" id="select_chart3">
                    <div class="col-md-6">
                        <label><?= $this->ml::_ml('Năm bắt đầu','frontend','dashboard_chart_year_begin','dashboard')?></label>
                        <div class="input-group">
                            <span class="input-group-addon">
                                <i class="fa fa-calendar"></i>
                            </span>
                            <input type="text" id="begin_year" value="" class="form-control datepicker" placeholder="<?= $this->ml::_ml('Năm bắt đầu','frontend','dashboard_chart_year_begin','dashboard')?>">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <label><?= $this->ml::_ml('Năm kết thúc','frontend','dashboard_chart_year_end','dashboard')?></label>
                        <div class="input-group">
                            <span class="input-group-addon">
                                <i class="fa fa-calendar"></i>
                            </span>
                            <input type="text" id="end_year" value="" class="form-control datepicker" placeholder="<?= $this->ml::_ml('Năm kết thúc','frontend','dashboard_chart_year_end','dashboard')?>">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="messageModal" tabindex="-1" role="dialog" aria-labelledby="messageModalLabel" aria-hidden="true"
    novalidate>
    <div class="modal-dialog modal-md m-t-50">
        <div class="modal-content w-100 pull-left p-b-50">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="material-icons">clear</i></button>
                <h5 class="modal-title text-uppercase" id="messageModalLabel"><?= $this->ml::_ml('BÌNH LUẬN MỚI NHẤT','frontend','dashboard_modal_commet_new','dashboard')?></h5>
            </div>
            <div class="modal-body">
                <div class="w-100">
                    <?php if(!$count_comment_new){ ?>
                    <div class="col-md-12 p-0">
                        <p class="float-left text-danger"><?= $this->ml::_ml('Không có bình luận mới nào !','frontend','dashboard_modal_comment','dashboard')?></p>
                    </div>
                    <?php }else{ ?>
                    <?php foreach($new_comment as $key => $comment){ ?>
                    <?php if($key !== 0) { ?>
                    <div class="col-md-12 float-left p-0">
                        <hr>
                    </div>
                    <?php } ?>
                    <div class="col-md-12 p-0 float-left">
                        <p class="float-left">{{comment.name}} <?= $this->ml::_ml('lúc','frontend','dashboard_at','dashboard')?><span class="text-primary">
                                <?= date_format(date_create($comment->created_at),"H:i d/m/Y") ?></span></p><a class="float-right detail-link"
                            href="/support/detail/{{comment.support_id}}"><?= $this->ml::_ml('Chi tiết','frontend','dashboard_detail','dashboard')?></a>
                    </div>
                    <div class="col-md-12 p-0 float-left">
                        <i class="fa fa-check-circle"></i> <span style="text-indent: 15px"><?= $this->ml::_ml('Nội dung: !','frontend','dashboard_modal_content','dashboard')?><strong>{{comment.content}}</strong></span>
                    </div>
                    <?php } ?>
                    <?php } ?>
                </div>
            </div>
        </div>
    </div>
</div>