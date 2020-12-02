<form id="frmCategories" action="<?= WEB_ADMIN_URI ?>/categories/update<?= !empty($cat->id) ? '/'.$cat->id : '' ?>" method="post" enctype="multipart/form-data" data-toggle="validator" role="form">
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
                        <a id="btnBackPost" href="<?= WEB_ADMIN_URI.'/categories' ?>" class="btn btn-hnn btn-hnn-default" title="Trở về"><span><i class="fas fa-reply"></i></span></a>
                    </div>
                    {% if master.checkPermission('categories', 'update','1') %}
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


    <section class="content">
        <div class="container-fluid">
            <div class="col-md-12">
                <div class="row">
                    <div class="col-md-9">
                        <div class="card card-primary card-outline card-outline-tabs">
                            <div class="card-header p-0 border-bottom-0">
                                <ul class="nav nav-tabs w-100">
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
                                                    <label class="control-label">{{formsLang[lang.id].getLabel('name')}}</label>
                                                    {{formsLang[lang.id].render('name')}}
                                                    <div class="invalid-feedback"></div>
                                                </div>
                                            </div>
                                            <div class="form-group label-floating col-md-12">
                                                <div class="input-group">
                                                    <label class="control-label">{{formsLang[lang.id].getLabel('description')}}</label>
                                                    {{formsLang[lang.id].render('description')}}
                                                    <div class="invalid-feedback"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    {% endfor  %}
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card card-primary card-outline">
                            <div class="card-body">
                                <div class="row">
                                    <div class="form-group label-floating col-md-12">
                                        <div class="input-group">
                                            <label class="control-label">{{formCat.getLabel('status')}}</label>
                                            {{formCat.render('status')}}
                                            <div class="invalid-feedback"></div>
                                        </div>
                                    </div>
                                    <div class="form-group label-floating col-md-12">
                                        <div class="input-group">
                                            <label class="control-label">{{formCat.getLabel('slug')}}</label>
                                            {{formCat.render('slug')}}
                                            <div class="invalid-feedback"></div>
                                        </div>
                                    </div>
                                    <div class="form-group label-floating col-md-12">
                                        <div class="col-md-12 p-0">
                                            <img id="showImg" class="w-100 d-block" src="<?= !empty($cat->image) ? $cat->image : '' ?>"
                                            alt="<?= !empty($cat->image) ? $cat->image : '' ?>">
                                            {{formCat.render('image')}}
                                            <a id="uploadImage" href="#" class="link">Đặt ảnh đại diện</a>
                                            <a id="removeImage" href="#" class="link text-danger <?= !empty($cat->image) ? '' : 'hidden' ?>">Xóa</a>
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