<main class="app-content">
        <div class="app-title mb-3">
            <div>
                <h1><i class="fa fa-th-list"></i> {{staffs_lang[1].title ? 'Cập nhật nhân sự': 'Thêm nhân sự mới'}}</h1>
            </div>
            <ul class="app-breadcrumb breadcrumb side">
                <li class="breadcrumb-item"><a class="link" href="{{ config.application.backendUri }}"><i class="fa fa-home fa-lg"></i></a></li>
                <li class="breadcrumb-item"><a class="link" href="{{ config.application.backendUri }}/staff">Nhận sự</a></li>
                <li class="breadcrumb-item">{{title}}</li>
            </ul>
        </div>
    
        <div class="body-message">
            <?php echo $this->flashSession->output(); ?>
        </div>
    
        <div class="row">
            <form class="col-md-12 row p-0 m-0" method="POST" enctype="multipart/form-data" data-toggle="validator"
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
                            <div class="tab-pane fade {{ !key ? 'active show' : '' }}"id="lang{{lang.id}}">
                                <h5 class="text-primary font-weight-normal">Tiêu đề</h5>
                                <div class="mb-3">
                                    <div class="form-row">
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
                                </div>
                 
                                <h5 class="text-primary font-weight-normal">Giới thiệu</h5>
                                <div class="tile p-0">
                                    <div class="row m-0">
                                        <div class="col-md-12 p-0">
                                            <div class="form-group mb-0">
                                                <div class="input-group">
                                                    <textarea id="editor{{lang.id}}" name="content[{{lang.id}}]" class="rounded">
                                                        {{staff_content[lang.id]}}
                                                    </textarea>
                                                    <div class="invalid-tooltip"></div>
                                                </div>
                                            </div>
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
                                <h5 class="text-primary font-weight-normal">Trạng thái</h5>
                                <div class="form-group mt-1">
                                    <div class="input-group">
                                        {{form_staff.render('status')}}
                                        <div class="invalid-tooltip"></div>
                                    </div>
                                </div>

                                <h5 class="text-primary font-weight-normal">Slug</h5>
                                <div class="form-group mt-1">
                                    <div class="input-group">
                                        {{form_staff.render('slug')}}
                                        <div class="invalid-tooltip"></div>
                                    </div>
                                </div>

                                <h5 class="text-primary font-weight-normal">Sắp xếp</h5>
                                <div class="form-group mt-1">
                                    <div class="input-group">
                                        {{form_staff.render('sort')}}
                                        <div class="invalid-tooltip"></div>
                                    </div>
                                </div>

                            </div>
    
                            <div class="col-md-12 p-0">
                                <button type="submit" class="btn btn-success float-right btn-sm">{{title}}</button>
                            </div>
                        </div>
                    </div>
    
                    <div class="tile p-3 mb-3">
                        <h5 class="text-primary font-weight-normal">Bộ môn</h5>
                        <div class="row m-0">
                            <div class="form-group mt-1 w-100">
                                <div class="input-group">
                                    {{form_staff.render('dept_id')}}
                                    <div class="invalid-tooltip"></div>
                                </div>
                            </div>
                        </div>
                        {% if dept_id == 1 %}
                        <h5 class="text-primary font-weight-normal">Chức vụ Khoa</h5>
                        <div class="row m-0">
                            <div class="form-group mt-1 w-100">
                                <div class="input-group">
                                    {{form_staff.render('dean')}}
                                    <div class="invalid-tooltip"></div>
                                </div>
                            </div>
                        </div>
                        {% endif %}
                        <h5 class="text-primary font-weight-normal">Chức vụ Bộ Môn</h5>
                        <div class="row m-0">
                            <div class="form-group mt-1 w-100">
                                <div class="input-group">
                                    {{form_staff.render('dept_position')}}
                                    <div class="invalid-tooltip"></div>
                                </div>
                            </div>
                        </div>
                        <h5 class="text-primary font-weight-normal">E-mail</h5>
                        <div class="row m-0">
                            <div class="form-group mt-1 w-100">
                                <div class="input-group">
                                    {{form_staff.render('email')}}
                                    <div class="invalid-tooltip"></div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="tile p-3 mb-3">
                        <div class="row m-0">
                            <div class="col-md-12 p-0">
                                <img id="showImg" src="<?php echo $staff->featured_image ? $staff->featured_image : '' ?>"
                                    alt="" width="100%">
                                {{form_staff.render('featured_image')}}
                                <a id="uploadImage" href="#" class="link">Đặt ảnh đại diện</a>
                            </div>
                        </div>
                    </div>
                </div>
                <input class="tokenCSRF" type="hidden" name="{{ security.getTokenKey() }}"
                    value="{{ security.getToken() }}">
            </form>
        </div>
    </main>