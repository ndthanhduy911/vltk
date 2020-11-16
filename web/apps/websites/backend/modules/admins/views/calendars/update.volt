<main class="app-content">
    <div class="app-title mb-3">
        <div>
            <h1><i class="fa fa-th-list"></i>{{title}} lịch học</h1>
        </div>
        <ul class="app-breadcrumb breadcrumb side">
            <li class="breadcrumb-item"><a class="link" href="{{ config.application.backendUri }}"><i class="fa fa-home fa-lg"></i></a></li>
            <li class="breadcrumb-item"><a class="link" href="{{ config.application.backendUri }}/calendars">Môn học</a></li>
            <li class="breadcrumb-item">{{title}}</li>
        </ul>
    </div>

    <div class="body-message">
        <?php echo $this->flashSession->output(); ?>
    </div>

    <div class="row">
        <form class="col-md-12 row p-0 m-0" method="post" enctype="multipart/form-data" data-toggle="validator"
            role="form">

            <div class="col-md-8 p-0">
                <div class="tile p-3 mb-3">
                    <div class="row m-0">
                        <div class="col-md-12 p-0">
                            <div class="form-row">
                                <div class="col-md-6">
                                    <h6 class="text-primary font-weight-normal">Lớp</h6>
                                    <div class="form-group mt-1">
                                        <div class="input-group">
                                            {{form_calendar.render('classid')}}
                                            <div class="invalid-tooltip"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <h6 class="text-primary font-weight-normal">Môn học</h6>
                                    <div class="form-group mt-1">
                                        <div class="input-group">
                                            {{form_calendar.render('subjectid')}}
                                            <div class="invalid-tooltip"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="col-md-6">
                                    <h6 class="text-primary font-weight-normal">Năm học</h6>
                                    <div class="form-group mt-1">
                                        <div class="input-group">
                                            {{form_calendar.render('year')}}
                                            <div class="invalid-tooltip"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <h6 class="text-primary font-weight-normal">Học kỳ</h6>
                                    <div class="form-group mt-1">
                                        <div class="input-group">
                                            {{form_calendar.render('semester')}}
                                            <div class="invalid-tooltip"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="col-md-6">
                                    <h6 class="text-primary font-weight-normal">Cơ sở</h6>
                                    <div class="form-group mt-1">
                                        <div class="input-group">
                                            {{form_calendar.render('location')}}
                                            <div class="invalid-tooltip"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <h6 class="text-primary font-weight-normal">Phòng học</h6>
                                    <div class="form-group mt-1">
                                        <div class="input-group">
                                            {{form_calendar.render('room')}}
                                            <div class="invalid-tooltip"></div>
                                        </div>
                                    </div>
                                </div>

                            </div>

                            <div class="form-row">
                                <div class="col-md-6">
                                    <h6 class="text-primary font-weight-normal">Thứ trong tuần</h6>
                                    <div class="form-group mt-1">
                                        <div class="input-group">
                                            {{form_calendar.render('day')}}
                                            <div class="invalid-tooltip"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <h6 class="text-primary font-weight-normal">Ngày bắt đầu</h6>
                                    <div class="form-group mt-1">
                                        <div class="input-group">
                                            {{form_calendar.render('begindate')}}
                                            <div class="invalid-tooltip"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="col-md-6">
                                    <h6 class="text-primary font-weight-normal">Bắt đầu</h6>
                                    <div class="form-group mt-1">
                                        <div class="input-group">
                                            {{form_calendar.render('begin_time')}}
                                            <div class="invalid-tooltip"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <h6 class="text-primary font-weight-normal">Kết thúc</h6>
                                    <div class="form-group mt-1">
                                        <div class="input-group">
                                            {{form_calendar.render('end_time')}}
                                            <div class="invalid-tooltip"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-4 pr-0">
                <div class="tile p-3 mb-3">
                    <div class="row m-0">
                        <div class="col-md-12 p-0">
                            <div class="d-inline-block w-100">
                                <h6 class="text-primary font-weight-normal">Trạng thái</h6>
                                <div class="form-group mt-1">
                                    <div class="input-group">
                                        {{form_calendar.render('status')}}
                                        <div class="invalid-tooltip"></div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-12 p-0">
                            <button type="submit" class="btn btn-success float-right btn-sm">{{title}}</button>
                        </div>
                    </div>
                </div>
                <div class="bs-component bg-white rounded mb-3">
                    <ul class="nav nav-tabs">
                        {% for key, lang in languages %}
                        <li class="nav-item"><a style="font-size : 1rem" class="nav-link font-weight-bold {{ !key ? 'active' : '' }}" data-toggle="tab"
                                href="#lang{{lang.id}}">{{lang.name}}</a></li>
                        {% endfor  %}
                    </ul>
                    <div class="tab-content p-3">
                        {% for key, lang in languages %}
                        <div class="tab-pane fade {{ !key ? 'active show' : '' }}" id="lang{{lang.id}}">
                            <h6 class="text-primary font-weight-normal">Mô tả/ Chú thích</h6>
                            <div class="form-row">
                                <div class="form-group col-md-12">
                                    <div class="input-group">
                                        {{forms_lang[lang.id].render('excerpt', ['id' : 'excerpt'~lang.id, 'name' : 'excerpt['~lang.id~']'])}}
                                        <div class="invalid-tooltip"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        {% endfor  %}
                    </div>
                </div>
                
                <div class="tile p-3 mb-3">
                    <div class="row m-0">
                        <div class="col-md-12 p-0">
                            <img id="showImg" class="w-100 d-block" src="{{ calendar.featured_image ? calendar.featured_image : '' }}" alt="{{ calendar.featured_image ? calendar.featured_image : '' }}">
                            {{form_calendar.render('featured_image')}}
                            <a id="uploadImage" href="#" class="link">Đặt ảnh đại diện</a>
                            <a id="removeImage" href="#" class="link text-danger {{ calendar.featured_image ? '' : 'hidden' }}">Xóa</a>
                        </div>
                    </div>
                </div>

                <div class="tile p-3 mb-3">
                    <div class="row m-0">
                        <div class="col-md-12 p-0">
                            <img id="showBackgroundImg" class="w-100 d-block" src="{{ calendar.background_image ? calendar.background_image : '' }}"
                                alt="{{ calendar.background_image ? calendar.background_image : '' }}">
                            {{form_calendar.render('background_image')}}
                            <a id="uploadBackgroundImage" href="#" class="link">Đặt ảnh nền</a>
                            <a id="removeBackgroundImage" href="#" class="link text-danger {{ calendar.background_image ? '' : 'hidden' }}">Xóa</a>
                        </div>
                    </div>
                </div>
            </div>

            <input class="tokenCSRF" type="hidden" name="{{ security.getTokenKey() }}"
                value="{{ security.getToken() }}">
        </form>
    </div>
</main>