<main class="app-content">
        <div class="app-title mb-3">
            <div>
                <h1><i class="fa fa-th-list"></i> {{title}} banner</h1>
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
                            <div class="tab-pane fade {{ !key ? 'active show' : '' }}" id="lang{{lang.id}}">
                                <h5 class="text-primary font-weight-normal">Tiêu đề</h5>
                                <div class="form-group mb-3">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <div class="input-group-text fa fa-header"></div>
                                        </div>
                                        {{forms_lang[lang.id].render('name', ['id' : 'name'~lang.id,'name' : 'name['~lang.id~']'])}}
                                        <div class="invalid-tooltip"></div>
                                    </div>
                                </div>
                                <h5 class="text-primary font-weight-normal">Tên nút</h5>
                                <div class="form-group mb-3">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <div class="input-group-text fa fa-header"></div>
                                        </div>
                                        {{forms_lang[lang.id].render('button_text', ['id' : 'button_text'~lang.id,'name' : 'button_text['~lang.id~']'])}}
                                        <div class="invalid-tooltip"></div>
                                    </div>
                                </div>
                                <h5 class="text-primary font-weight-normal">Nội dung</h5>
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <div class="input-group-text fa fa-tags"></div>
                                        </div>
                                        {{forms_lang[lang.id].render('description', ['id' : 'description'~lang.id, 'name' : 'description['~lang.id~']'])}}
                                        <div class="invalid-tooltip"></div>
                                    </div>
                                </div>
                            </div>
                            {% endfor  %}
                        </div>
                    </div>
                    
                    <div class="tile p-3 mt-3">  
                        <h5 class="text-primary font-weight-normal">Hình banner</h5> 
                        <div class="row m-0">
                            <div class="col-md-12 p-0">
                                <img id="showImg" src="<?php echo $banner->image ? $banner->image : '' ?>"
                                    alt="" width="100%">
                                {{form_banner.render('image')}}
                                <a id="uploadImage" href="#" class="link"><?php echo $banner->image ? 'Đổi hình' : 'Chọn hình' ?></a>
                            </div>
                        </div>
                    </div>
                </div>
    
                <div class="col-md-3 pr-0">
                    <div class="tile p-3 mb-3">
                        <div class="row m-0">
                            <div class="col-md-12 p-0">
                                <span class="text-primary">Trạng thái:</span>
                                <div class="form-group mt-1">
                                    <div class="input-group">
                                        {{form_banner.render('status')}}
                                        <div class="invalid-tooltip"></div>
                                    </div>
                                </div>
                                <div class="d-inline-block w-100 mb-2">
                                    <span class="text-primary">Link:</span>
                                    <div class="form-group mt-1">
                                        <div class="input-group">
                                            {{form_banner.render('button_link')}}
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
                </div>
                <input class="tokenCSRF" type="hidden" name="{{ security.getTokenKey() }}"
                    value="{{ security.getToken() }}">
            </form>
        </div>
    </main>