<div class="content-header">
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-6 d-flex align-items-center">
                <ol class="breadcrumb">
                    {% if dispatcher.getControllerName() != 'index' %}
                    <li class="breadcrumb-item"><a href="<?= WEB_ADMIN_URL ?>"><i class="fas fa-home"></i></a></li>
                    {% endif %}
                    <li class="breadcrumb-item active">{{ title }}</li>
                </ol>
            </div>
            <div class="col-sm-6">
                <div class="float-right">
                    <a id="btnBackPost" href="<?= WEB_ADMIN_URI.'/posts' ?>" class="btn btn-hnn btn-hnn-default" title="Trở về"><span><i class="fas fa-reply"></i></span></a>
                </div>
                {% if master.checkPermission('posts', 'update','1') %}
                <div class="float-right">
                    <button type="submit" class="btn btn-hnn btn-hnn-success mr-2" title="Lưu thông tin"><span>Lưu</span></button>
                </div>
                {% endif %}
            </div>
        </div>
    </div>
</div>

<div class="col-md-12">
    <div class="col-md-12">
        {{flashSession.output()}}
    </div>
</div>

<form method="post" enctype="multipart/form-data" data-toggle="validator" role="form">
    <section class="content">
        <div class="container-fluid">
            <div class="col-md-12">
                <div class="row">
                    <div class="col-md-9">
                        <div class="card">
                            <div class="card-header p-2">
                                <ul class="nav nav-pills w-100">
                                    {% for key, lang in languages %}
                                    <li class="nav-item">
                                        <a class="nav-link {{ !key ? 'active' : '' }}" href="#lang{{lang.id}}" data-toggle="tab" data-tab="{{lang.id}}">
                                            {{lang.name}}
                                        </a>
                                    </li>
                                    {% endfor %}
                                </ul>
                            </div>
                            <div class="card-body">
                                <div class="tab-content">
                                    {% for key, lang in languages %}
                                    <div class="tab-pane fade {{ !key ? 'active show' : '' }}" id="lang{{lang.id}}">
                                        <div class="row">
                                            <div class="form-group label-floating col-md-12">
                                                <div class="input-group">
                                                    <label class="control-label">{{formsLang[lang.id].getLabel('title')}}</label>
                                                    {{formsLang[lang.id].render('title', ['id' : 'title'~lang.id,'name' : 'title['~lang.id~']'])}}
                                                    <div class="invalid-feedback"></div>
                                                </div>
                                            </div>
                                            <div class="form-group label-floating col-md-12">
                                                <div class="input-group">
                                                    <label class="control-label">{{formsLang[lang.id].getLabel('excerpt')}}</label>
                                                    {{formsLang[lang.id].render('excerpt', ['id' : 'excerpt'~lang.id,'name' : 'excerpt['~lang.id~']'])}}
                                                    <div class="invalid-feedback"></div>
                                                </div>
                                            </div>
                                        </div>

                                        <h6 class="text-primary font-weight-normal">Nội dung</h6>
                                        <div class="form-group mb-3">
                                            <div class="input-group">
                                                <textarea id="editor{{lang.id}}" name="content[{{lang.id}}]" class="rounded">
                                                    <?= isset($postContent[$lang->id]) ? $postContent[$lang->id]: '' ?>
                                                </textarea>
                                                <div class="invalid-tooltip"></div>
                                            </div>
                                        </div>
                                    </div>
                                    {% endfor  %}
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <div class="form-group label-floating col-md-12">
                                        <div class="input-group">
                                            <label class="control-label">{{formPost.getLabel('status')}}</label>
                                            {{formPost.render('status')}}
                                            <div class="invalid-feedback"></div>
                                        </div>
                                    </div>
                                    <div class="form-group label-floating col-md-12">
                                        <div class="input-group">
                                            <label class="control-label">{{formPost.getLabel('calendar')}}</label>
                                            {{formPost.render('calendar')}}
                                            <div class="invalid-feedback"></div>
                                        </div>
                                    </div>
                                    <div class="form-group label-floating col-md-12">
                                        <div class="input-group">
                                            <label class="control-label">{{formPost.getLabel('slug')}}</label>
                                            {{formPost.render('slug')}}
                                            <div class="invalid-feedback"></div>
                                        </div>
                                    </div>
                                    <div class="form-group label-floating col-md-12">
                                        <div class="input-group">
                                            <label class="control-label">{{formPost.getLabel('catid')}}</label>
                                            {{formPost.render('catid')}}
                                            <div class="invalid-feedback"></div>
                                        </div>
                                    </div>
                                    <div class="form-group label-floating col-md-12">
                                        <div class="col-md-12 p-0">
                                            <img id="showImg" class="w-100 d-block" src="<?= !empty($post->image) ? $post->image : '' ?>"
                                            alt="<?= !empty($post->image) ? $post->image : '' ?>">
                                            {{formPost.render('image')}}
                                            <a id="uploadImage" href="#" class="link">Đặt ảnh đại diện</a>
                                            <a id="removeImage" href="#" class="link text-danger <?= !empty($post->image) ? "" : "hidden" ?>">Xóa</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <input class="tokenCSRF" type="hidden" name="{{ security.getTokenKey() }}" value="{{ security.getToken() }}">
            </div>
        </div>
    </section>
</form>