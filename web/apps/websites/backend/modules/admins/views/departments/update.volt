<main class="app-content">
        <div class="app-title mb-3">
            <div>
                <h1><i class="fa fa-th-list"></i> {{title}}</h1>
            </div>
            <ul class="app-breadcrumb breadcrumb side">
                <li class="breadcrumb-item"><a class="link" href="{{ config.application.backendUri }}"><i class="fa fa-home fa-lg"></i></a></li>
                <li class="breadcrumb-item"><a class="link" href="{{ config.application.backendUri }}/posts">Banner</a></li>
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
                            <div class="tab-pane fade {{ !key ? 'active show' : '' }}"
                                id="lang{{lang.id}}">
                                <h5 class="text-primary font-weight-normal">Tên bộ môn</h5>
      
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <div class="input-group-text fa fa-header"></div>
                                        </div>
                                        {{forms_lang[lang.id].render('name', ['id' : 'name'~lang.id,'name' : 'name['~lang.id~']'])}}
                                        <div class="invalid-tooltip"></div>
                                    </div>
                                </div>
    
                                <h5 class="text-primary font-weight-normal">Giới thiệu</h5>
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <div class="input-group-text fa fa-tags"></div>
                                        </div>
                                        {{forms_lang[lang.id].render('description', ['id' : 'description'~lang.id, 'name' : 'description['~lang.id~']'])}}
                                        <div class="invalid-tooltip"></div>
                                    </div>
                                </div>

                                <h5 class="text-primary font-weight-normal">Địa chỉ</h5>
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <div class="input-group-text fa fa-building-o"></div>
                                        </div>
                                        {{forms_lang[lang.id].render('address', ['id' : 'address'~lang.id, 'name' : 'address['~lang.id~']'])}}
                                        <div class="invalid-tooltip"></div>
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
                                    <span class="text-primary">Viết tắt:</span>
                                    <div class="form-group mt-1">
                                        <div class="input-group">
                                            {{form_department.render('code')}}
                                            <div class="invalid-tooltip"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="d-inline-block w-100">
                                    <span class="text-primary">Số điện thoại:</span>
                                    <div class="form-group mt-1">
                                        <div class="input-group">
                                            {{form_department.render('phone')}}
                                            <div class="invalid-tooltip"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="d-inline-block w-100">
                                    <span class="text-primary">E-mail:</span>
                                    <div class="form-group mt-1">
                                        <div class="input-group">
                                            {{form_department.render('email')}}
                                            <div class="invalid-tooltip"></div>
                                        </div>
                                    </div>
                                </div>
                                {% if session.get('dept_id') != 1 %}
                                <div class="animated-checkbox mb-3">
                                    <label class="m-0">
                                        <input name="post_connect" type="checkbox" value="1" {{department.post_connect ? 'checked' : '' }}><span class="label-text">Liên kết bài viết với Khoa</span>
                                    </label>
                                </div>
                                {% endif %}
                            </div>
    
                            <div class="col-md-12 p-0">
                                <button type="submit" class="btn btn-success float-right btn-sm">Cập nhật</button>
                            </div>
                        </div>
                    </div>


                    <div class="tile p-3 mb-3">
                        <div class="row m-0">
                            <div class="col-md-12 p-0">
                                <img id="showLogo" src="<?php echo $department->logo ? $department->logo : '' ?>" alt="" width="100%">
                                    {{form_department.render('logo')}}
                                <a id="uploadLogo" href="#" class="link">Đặt ảnh logo</a>
                            </div>
                        </div>
                    </div>

                    <div class="tile p-3 mb-3">
                        <div class="row m-0">
                            <div class="col-md-12 p-0">
                                <img id="showImg" src="<?php echo $department->image ? $department->image : '' ?>" alt="" width="100%">
                                {{form_department.render('image')}}
                                <a id="uploadImage" href="#" class="link">Đặt ảnh đại diện</a>
                            </div>
                        </div>
                    </div>

                    <div class="tile p-3 mb-3">
                        <div class="row m-0">
                            <div class="col-md-12 p-0">
                                <img id="showIcon" src="<?php echo $department->icon ? $department->icon : '' ?>" alt="" width="100%">
                                    {{form_department.render('logo')}}
                                <a id="uploadIcon" href="#" class="link">Đặt ảnh favicon</a>
                            </div>
                        </div>
                    </div>
                </div>
                <input class="tokenCSRF" type="hidden" name="{{ security.getTokenKey() }}"
                    value="{{ security.getToken() }}">
            </form>
        </div>
    </main>