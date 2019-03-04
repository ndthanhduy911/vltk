<link rel="stylesheet" type="text/css" href="/assets/backend/css/lib/owl.carousel.min.css" />
<link rel="stylesheet" type="text/css" href="/assets/backend/css/lib/owl.theme.default.min.css" />

<!-- Bread crumb -->
<div class="row page-titles">
    <div class="col-md-9 align-self-center">
        <h3 class="text-hnn font-weight-bold">BẢNG ĐIỀU KHIỂN</h3>
        <span>Hiển thị các nội dung tổng quan của website như: số lượng yêu cầu hỗ trợ, số lượng yêu cầu đã hoàn thành, biểu đồ
            tổng quan về các yêu cầu...</span>
    </div>
    <div class="col-md-3 align-self-center">
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a href="javascript:void(0)">Trang chủ</a>
            </li>
            <li class="breadcrumb-item active">Bảng điều khiển</li>
        </ol>
    </div>
</div>
<!-- End Bread crumb -->
<!-- Container fluid  -->
<div class="container-fluid">
    <!-- Start Page Content -->
    <div class="row">
        <div class="col-md-3">
            <a href="<?php if($this->rolemaster::isPermission($this->session->get('permission'),'department','index')){ echo '/adcp/department'; } else{ echo '#'; } ?>">
                <div class="card p-10 ">
                    <div class="media">
                        <div class="media-left meida media-middle">
                            <span>
                                <i class="fa fa-archive f-s-40 color-warning"></i>
                            </span>
                        </div>
                        <div class="media-body media-text-right">
                            <h2>{{count_department}}</h2>
                            <p class="m-b-0">Số đơn vị</p>
                        </div>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-md-3">
            <a href="<?php if($this->rolemaster::isPermission($this->session->get('permission'),'client','index')){ echo '/adcp/client'; } else{ echo '#'; } ?>">
                <div class="card p-10 ">
                    <div class="media">
                        <div class="media-left meida media-middle">
                            <span>
                                <i class="fa fa-user f-s-40 color-danger"></i>
                            </span>
                        </div>
                        <div class="media-body media-text-right">
                            <h2>{{ count_client }}</h2>
                            <p class="m-b-0">Số người yêu cầu</p>
                        </div>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-md-3">
            <a href="<?php if($this->rolemaster::isPermission($this->session->get('permission'),'support','index')){ echo '/adcp/support'; } else{ echo '#'; } ?>">
                <div class="card p-10 ">
                    <div class="media">
                        <div class="media-left meida media-middle">
                            <span>
                                <i class="fa fa-handshake-o f-s-40 color-primary"></i>
                            </span>
                        </div>
                        <div class="media-body media-text-right">
                            <h2>{{count_support}}</h2>
                            <p class="m-b-0">Yêu cầu hỗ trợ</p>
                        </div>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-md-3">
            <a href="<?php if($this->rolemaster::isPermission($this->session->get('permission'),'support','index')){ echo '/adcp/support'; } else{ echo '#'; } ?>">
                <div class="card p-10 ">
                    <div class="media">
                        <div class="media-left meida media-middle">
                            <span>
                                <i class="fa fa-hand-o-right f-s-40 color-primary"></i>
                            </span>
                        </div>
                        <div class="media-body media-text-right">
                            <h2>{{count_support_doing}}</h2>
                            <p class="m-b-0">Yêu cầu đang thực hiện</p>
                        </div>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-md-3">
            <div class="card p-10 ">
                <div class="media">
                    <div class="media-left meida media-middle">
                        <span>
                            <i class="fa fa-thumbs-o-up f-s-40 color-success"></i>
                        </span>
                    </div>
                    <div class="media-body media-text-right">
                        <h2>{{ count_support_done }}</h2>
                        <p class="m-b-0">Yêu cầu đã hoàn thành</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <a href="<?php if($this->rolemaster::isPermission($this->session->get('permission'),'support','index')){ echo '/adcp/support'; } else{ echo '#'; } ?>">
                <div class="card p-10 ">
                    <div class="media">
                        <div class="media-left meida media-middle">
                            <span>
                                <i class="fa fa-thumbs-o-down f-s-40 color-primary"></i>
                            </span>
                        </div>
                        <div class="media-body media-text-right">
                            <h2>{{count_support_notdoing}}</h2>
                            <p class="m-b-0">Yêu cầu chưa hoàn thành </p>
                        </div>
                    </div>
                </div>
            </a>
        </div>
    </div>

    <div class="row bg-white m-l-0 m-r-0 box-shadow m-t-15">
        <!-- column -->
        <div class="col-lg-8 chart_box">
            <div class="card">
                <div class="card-body lineChart">
                    <canvas id="lineChart"></canvas>
                </div>
                <div class="row">
                    <div class="col-md-6 mb-3 group-val">
                        <label for="status">Thống kê theo
                            <strong class="text-danger">*</strong>
                        </label>
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text" style="background: #EE161E">
                                    <i class="fa fa-edit text-white"></i>
                                </span>
                            </div>
                            <select id="select_chart" class="form-control" required="1">
                                <option value="">Chọn...</option>
                                <option value="1">Theo Ngày</option>
                                <option value="2">Theo Tháng</option>
                                <option value="3">Theo Năm</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="row hidden select_chart" id="select_chart1">
                    <div class="col-md-6 mb-3 group-val">
                        <label for="begin_date">Ngày bắt đầu
                            <strong class="text-danger">*</strong>
                        </label>
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text" style="background: #EE161E">
                                    <i class="fa fa-edit text-white"></i>
                                </span>
                            </div>
                            <input type="text" id="begin_date" class="form-control datepicker" placeholder="Ngày bắt đầu">
                        </div>
                    </div>
                    <div class="col-md-6 mb-3 group-val">
                        <label for="end_date">Ngày kết thúc
                            <strong class="text-danger">*</strong>
                        </label>
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text" style="background: #EE161E">
                                    <i class="fa fa-edit text-white"></i>
                                </span>
                            </div>
                            <input type="text" id="end_date" class="form-control datepicker" placeholder="Ngày kết thúc">
                        </div>
                    </div>
                </div>
                <div class="row hidden select_chart" id="select_chart2">
                    <div class="col-md-6 mb-3 group-val">
                        <label for="begin_month">Tháng bắt đầu
                            <strong class="text-danger">*</strong>
                        </label>
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text" style="background: #EE161E">
                                    <i class="fa fa-edit text-white"></i>
                                </span>
                            </div>
                            <input type="text" id="begin_month" class="form-control datepicker" placeholder="Tháng bắt đầu">
                        </div>
                    </div>
                    <div class="col-md-6 mb-3 group-val">
                        <label for="end_month">Tháng kết thúc
                            <strong class="text-danger">*</strong>
                        </label>
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text" style="background: #EE161E">
                                    <i class="fa fa-edit text-white"></i>
                                </span>
                            </div>
                            <input type="text" id="end_month" class="form-control datepicker" placeholder="Tháng kết thúc">
                        </div>
                    </div>
                </div>
                <div class="row hidden select_chart" id="select_chart3">
                    <div class="col-md-6 mb-3 group-val">
                        <label for="begin_year">Năm bắt đầu
                            <strong class="text-danger">*</strong>
                        </label>
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text" style="background: #EE161E">
                                    <i class="fa fa-edit text-white"></i>
                                </span>
                            </div>
                            <input type="text" id="begin_year" class="form-control datepicker" placeholder="Năm bắt đầu">
                        </div>
                    </div>
                    <div class="col-md-6 mb-3 group-val">
                        <label for="end_year">Năm kết thúc
                            <strong class="text-danger">*</strong>
                        </label>
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text" style="background: #EE161E">
                                    <i class="fa fa-edit text-white"></i>
                                </span>
                            </div>
                            <input type="text" id="end_year" class="form-control datepicker" placeholder="Năm kết thúc">
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <!-- column -->

        <!-- column -->
        <div class="col-lg-4">
            <div class="card">
                <div class="card-body pieChart">
                    <canvas id="pieChart"></canvas>
                </div>
                <div class="invalid-tooltip text-center" id="empty-chart" style="top: 30%; width:86%;">Không có dữ liệu</div>
                <div class="form-row m-t-32">
                    <div class="col-md-12 mb-3 group-val">
                        <label for="status">Thống kê theo
                            <strong class="text-danger">*</strong>
                        </label>
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text" style="background: #EE161E">
                                    <i class="fa fa-edit text-white"></i>
                                </span>
                            </div>
                            <select id="select2_chart" class="form-control" required="1">
                                <option value="">Chọn...</option>
                                <option value="1">Theo Ngày</option>
                                <option value="2">Theo Tháng</option>
                                <option value="3">Theo Năm</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="form-row hidden select2_chart" id="select2_chart1">
                    <div class="col-md-12 mb-3 group-val">
                        <label for="begin2_date">Ngày bắt đầu
                            <strong class="text-danger">*</strong>
                        </label>
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text" style="background: #EE161E">
                                    <i class="fa fa-edit text-white"></i>
                                </span>
                            </div>
                            <input type="text" id="begin2_date" class="form-control datepicker" placeholder="(dd-mm-yyyy)">
                        </div>
                    </div>
                    <div class="col-md-12 mb-3 group-val">
                        <label for="end2_date">Ngày kết thúc
                            <strong class="text-danger">*</strong>
                        </label>
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text" style="background: #EE161E">
                                    <i class="fa fa-edit text-white"></i>
                                </span>
                            </div>
                            <input type="text" id="end2_date" class="form-control datepicker" placeholder="(dd-mm-yyyy)">
                        </div>
                    </div>
                </div>
                <div class="form-row hidden select2_chart" id="select2_chart2">
                    <div class="col-md-12 mb-3 group-val">
                        <label for="begin2_month">Tháng bắt đầu
                            <strong class="text-danger">*</strong>
                        </label>
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text" style="background: #EE161E">
                                    <i class="fa fa-edit text-white"></i>
                                </span>
                            </div>
                            <input type="text" id="begin2_month" class="form-control datepicker" placeholder="(mm-yyyy)">
                        </div>
                    </div>
                    <div class="col-md-12 mb-3 group-val">
                        <label for="end2_month">Tháng kết thúc
                            <strong class="text-danger">*</strong>
                        </label>
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text" style="background: #EE161E">
                                    <i class="fa fa-edit text-white"></i>
                                </span>
                            </div>
                            <input type="text" id="end2_month" class="form-control datepicker" placeholder="(mm-yyyy)">
                        </div>
                    </div>
                </div>
                <div class="form-row hidden select2_chart" id="select2_chart3">
                    <div class="col-md-12 mb-3 group-val">
                        <label for="begin2_year">Năm bắt đầu
                            <strong class="text-danger">*</strong>
                        </label>
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text" style="background: #EE161E">
                                    <i class="fa fa-edit text-white"></i>
                                </span>
                            </div>
                            <input type="text" id="begin2_year" class="form-control datepicker" placeholder="(yyyy)">
                        </div>
                    </div>
                    <div class="col-md-12 mb-3 group-val">
                        <label for="end2_year">Năm kết thúc
                            <strong class="text-danger">*</strong>
                        </label>
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text" style="background: #EE161E">
                                    <i class="fa fa-edit text-white"></i>
                                </span>
                            </div>
                            <input type="text" id="end2_year" class="form-control datepicker" placeholder="(yyyy)">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- column -->
    </div>
    <!-- <div class="row">
        <div class="col-lg-3">
            <div class="card bg-dark">
                <div class="testimonial-widget-one p-17">
                    <div class="testimonial-widget-one owl-carousel owl-theme">
                        <div class="item">
                            <div class="testimonial-content">
                                <img class="testimonial-author-img" src="/assets/backend/images/avatar/9.png" alt="" />
                                <div class="testimonial-author">Steve Jobs</div>
                                <div class="testimonial-author-position">CEO of Apple Inc.</div>

                                <div class="testimonial-text">
                                    <i class="fa fa-quote-left"></i> Nếu bạn sống mỗi ngày như thể đó là ngày cuối cùng của bạn, một ngày nào đó, bạn sẽ đúng.
                                    <i class="fa fa-quote-right"></i>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="testimonial-content">
                                <img class="testimonial-author-img" src="/assets/backend/images/avatar/9.png" alt="" />
                                <div class="testimonial-author">Steve Jobs</div>
                                <div class="testimonial-author-position">CEO of Apple Inc.</div>

                                <div class="testimonial-text">
                                    <i class="fa fa-quote-left"></i> Vấn đề không phải là tiền bạc. Vấn đề nằm ở bài học làm người, cách bạn làm nhà lãnh đạo và những gì mà bạn thu nhận được.
                                    <i class="fa fa-quote-right"></i>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="testimonial-content">
                                <img class="testimonial-author-img" src="/assets/backend/images/avatar/9.png" alt="" />
                                <div class="testimonial-author">Steve Jobs</div>
                                <div class="testimonial-author-position">CEO of Apple Inc.</div>

                                <div class="testimonial-text">
                                    <i class="fa fa-quote-left"></i> Những điều tuyệt vời trong kinh doanh không bao giờ được thực hiện bởi một người, chúng đến từ cả một tập thể.
                                    <i class="fa fa-quote-right"></i>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="testimonial-content">
                                <img class="testimonial-author-img" src="/assets/backend/images/avatar/9.png" alt="" />
                                <div class="testimonial-author">Steve Jobs</div>
                                <div class="testimonial-author-position">CEO of Apple Inc.</div>

                                <div class="testimonial-text">
                                    <i class="fa fa-quote-left"></i> Anh không thể chỉ hỏi khách hàng xem họ muốn gì và rồi cố đem nó cho họ. Tới lúc anh hoàn thiện nó, họ đã muốn thứ mới mẻ khác rồi.
                                    <i class="fa fa-quote-right"></i>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="testimonial-content">
                                <img class="testimonial-author-img" src="/assets/backend/images/avatar/9.png" alt="" />
                                <div class="testimonial-author">Steve Jobs</div>
                                <div class="testimonial-author-position">CEO of Apple Inc.</div>

                                <div class="testimonial-text">
                                    <i class="fa fa-quote-left"></i> Đôi lúc bạn phạm sai lầm khi đang đổi mới. Tốt nhất là hãy nhanh chóng chấp nhận nó và tiếp tục cải thiện các đổi mới khác của mình.
                                    <i class="fa fa-quote-right"></i>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="testimonial-content">
                                <img class="testimonial-author-img" src="/assets/backend/images/avatar/9.png" alt="" />
                                <div class="testimonial-author">Steve Jobs</div>
                                <div class="testimonial-author-position">CEO of Apple Inc.</div>

                                <div class="testimonial-text">
                                    <i class="fa fa-quote-left"></i> Thời gian của bàn là có hạn vì vậy, đừng lãng phí nó vào việc sống cuộc sống của người khác.
                                    <i class="fa fa-quote-right"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> -->
    <!-- End PAge Content -->
</div>
<!-- End Container fluid  -->