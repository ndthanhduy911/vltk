<main class="app-content">
    <div class="app-title mb-3">
        <div>
            <h1><i class="fa fa-th-list"></i> {{subjects_lang[1].title ? 'Cập nhật môn học': 'Thêm môn học mới'}}</h1>
        </div>
        <ul class="app-breadcrumb breadcrumb side">
            <li class="breadcrumb-item"><a class="link" href="{{ config.application.backendUri }}"><i class="fa fa-home fa-lg"></i></a></li>
            <li class="breadcrumb-item"><a class="link" href="{{ config.application.backendUri }}/subjects">Môn học</a></li>
            <li class="breadcrumb-item">{{title}}</li>
        </ul>
    </div>

    <div class="body-message">
        <?php echo $this->flashSession->output(); ?>
    </div>

    <div class="row">
        <form class="col-md-12 row p-0 m-0" method="post" enctype="multipart/form-data" data-toggle="validator"
            role="form">
            <div class="col-md-9 p-0">
                <div class="bs-component bg-white rounded">
                    <ul class="nav nav-tabs">
                        {% for key, lang in languages %}
                        <li class="nav-item"><a style="font-size : 1rem" class="nav-link font-weight-bold {{ !key ? 'active' : '' }}" data-toggle="tab"
                                href="#lang{{lang.id}}">{{lang.name}}</a></li>
                        {% endfor  %}
                    </ul>
                    <div class="tab-content p-3">
                        {% for key, lang in languages %}
                        <div class="tab-pane fade {{ !key ? 'active show' : '' }}" id="lang{{lang.id}}">
                            <h6 class="text-primary font-weight-normal">Tiêu đề</h6>
                            <div class="form-row mb-3">
                                <div class="form-group col-md-12 m-0">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <div class="input-group-text fa fa-header"></div>
                                        </div>
                                        {{forms_lang[lang.id].render('title', ['id' : 'title'~lang.id,'name' : 'title['~lang.id~']'])}}
                                        <div class="invalid-tooltip"></div>
                                    </div>
                                </div>
                            </div>

                            <h6 class="text-primary font-weight-normal">Tóm tắt</h6>
                            <div class="form-row">
                                <div class="form-group col-md-12">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <div class="input-group-text fa fa-tags"></div>
                                        </div>
                                        {{forms_lang[lang.id].render('excerpt', ['id' : 'excerpt'~lang.id, 'name' : 'excerpt['~lang.id~']'])}}
                                        <div class="invalid-tooltip"></div>
                                    </div>
                                </div>
                            </div>

                            <h6 class="text-primary font-weight-normal">Nội dung</h6>
                            <div class="form-row">
                                <div class="form-group col-md-12">
                                    <div class="input-group">
                                        <textarea id="editor{{lang.id}}" name="content[{{lang.id}}]" class="rounded">
                                            {{subject_content[lang.id]}}
                                        </textarea>
                                        <div class="invalid-tooltip"></div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        {% endfor  %}
                    </div>
                </div>
            </div>

            <div class="col-md-3 pr-0">
                <div class="tile p-3 mb-3">
                    <div class="row m-0">
                        <div class="col-md-12 p-0">
                            <div class="d-inline-block w-100">
                                <h6 class="text-primary font-weight-normal">Trạng thái</h6>
                                <div class="form-group mt-1">
                                    <div class="input-group">
                                        {{form_subject.render('status')}}
                                        <div class="invalid-tooltip"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="d-inline-block w-100">
                                <h6 class="text-primary font-weight-normal">Slug</h6>
                                <div class="form-group mt-1">
                                    <div class="input-group">
                                        {{form_subject.render('slug')}}
                                        <div class="invalid-tooltip"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="d-inline-block w-100">
                                <h6 class="text-primary font-weight-normal">Mã môn học</h6>
                                <div class="form-group mt-1">
                                    <div class="input-group">
                                        {{form_subject.render('code')}}
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

                <div class="tile p-3 mb-3">
                    <div class="row m-0">
                        <div class="col-md-12 p-0">
                            <img id="showImg" class="w-100 d-block" src="{{ subject.image ? subject.image : '' }}" alt="{{ subject.image ? subject.image : '' }}">
                            {{form_subject.render('image')}}
                            <a id="uploadImage" href="#" class="link">Đặt ảnh đại diện</a>
                            <a id="removeImage" href="#" class="link text-danger {{ subject.image ? '' : 'hidden' }}">Xóa</a>
                        </div>
                    </div>
                </div>

                <div class="tile p-3 mb-3">
                    <div class="row m-0">
                        <div class="col-md-12 p-0">
                            <img id="showBackgroundImg" class="w-100 d-block" src="{{ subject.background_image ? subject.background_image : '' }}"
                                alt="{{ subject.background_image ? subject.background_image : '' }}">
                            {{form_subject.render('background_image')}}
                            <a id="uploadBackgroundImage" href="#" class="link">Đặt ảnh nền</a>
                            <a id="removeBackgroundImage" href="#" class="link text-danger {{ subject.background_image ? '' : 'hidden' }}">Xóa</a>
                        </div>
                    </div>
                </div>
            </div>
            <input class="tokenCSRF" type="hidden" name="{{ security.getTokenKey() }}"
                value="{{ security.getToken() }}">
        </form>
    </div>
</main>