<form id="frmHomes" action="<?= WEB_ADMIN_URI ?>/homes/update<?= !empty($homes->id) ? '/'.$homes->id : '' ?>" method="post" enctype="multipart/form-data" data-toggle="validator" role="form">
    <div class="content-header">
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-6 d-flex align-items-center">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="<?= WEB_ADMIN_URL ?>"><i class="fas fa-home"></i></a></li>
                        <li class="breadcrumb-item active">{{ title }}</li>
                    </ol>
                </div>
                <div class="col-sm-6">
                    {% if master.checkPermission('homes', 'update','1') %}
                    <div class="float-right">
                        <button type="submit" class="btn btn-hnn btn-hnn-success" title="Lưu thông tin"><span>Lưu</span></button>
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
                    <div class="col-md-6">
                        <div class="card card-primary card-outline">
                            <div class="card-header">
                                <h3 class="card-title text-primary"><i class="fas fa-newspaper mr-1"></i>Tin tức</h3>
                            </div>
                            <div class="card-body">
                                <div class="form-group label-floating w-100">
                                    <div class="input-group">
                                        <label class="control-label">{{formHomes.getLabel('catlist')}}</label>
                                        {{formHomes.render('catlist')}}
                                        <div class="invalid-feedback"></div>
                                    </div>
                                </div>
                                <div class="form-group label-floating w-100">
                                    <div class="input-group">
                                        <label class="control-label">{{formHomes.getLabel('postnumber')}}</label>
                                        {{formHomes.render('postnumber')}}
                                        <div class="invalid-feedback"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card card-primary card-outline">
                            <div class="card-header">
                                <h3 class="card-title text-primary"><i class="fas fa-graduation-cap mr-1"></i>Lãnh đạo</h3>
                            </div>
                            <div class="card-body bg-eee">
                                <div class="card card-primary card-outline card-outline-tabs mb-0">
                                    <div class="card-header p-0 border-bottom-0">
                                        <ul class="nav nav-tabs w-100">
                                            {% for key, lang in languages %}
                                            <li class="nav-item">
                                                <a class="nav-link {{ !key ? 'active' : '' }}" href="#blang{{lang.id}}" data-toggle="tab" data-tab="{{lang.id}}">
                                                    {{lang.name}}
                                                </a>
                                            </li>
                                            {% endfor %}
                                        </ul>
                                    </div>
                                    <div class="card-body">
                                        <div class="tab-content">
                                            {% for key, lang in languages %}
                                            <div class="tab-pane fade {{ !key ? 'active show' : '' }}" id="blang{{lang.id}}">
                                                <div class="form-group label-floating w-100">
                                                    <div class="input-group">
                                                        <label class="control-label">{{formsLang[lang.id].getLabel('stafftitle')}}</label>
                                                        {{formsLang[lang.id].render('stafftitle')}}
                                                        <div class="invalid-feedback"></div>
                                                    </div>
                                                </div>
                                                <div class="form-group label-floating w-100">
                                                    <div class="input-group">
                                                        <label class="control-label">{{formsLang[lang.id].getLabel('staffdes')}}</label>
                                                        {{formsLang[lang.id].render('staffdes')}}
                                                        <div class="invalid-feedback"></div>
                                                    </div>
                                                </div>
                                            </div>
                                            {% endfor  %}
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card card-primary card-outline">
                            <div class="card-header">
                                <h3 class="card-title text-primary"><i class="fas fa-book mr-1"></i>Liên hệ</h3>
                            </div>
                            <div class="card-body bg-eee">
                                <div class="card card-primary card-outline card-outline-tabs mb-0">
                                    <div class="card-header p-0 border-bottom-0">
                                        <ul class="nav nav-tabs w-100">
                                            {% for key, lang in languages %}
                                            <li class="nav-item">
                                                <a class="nav-link {{ !key ? 'active' : '' }}" href="#dlang{{lang.id}}" data-toggle="tab" data-tab="{{lang.id}}">
                                                    {{lang.name}}
                                                </a>
                                            </li>
                                            {% endfor %}
                                        </ul>
                                    </div>
                                    <div class="card-body">
                                        <div class="tab-content">
                                            {% for key, lang in languages %}
                                            <div class="tab-pane fade {{ !key ? 'active show' : '' }}" id="dlang{{lang.id}}">
                                                <div class="form-group label-floating w-100">
                                                    <div class="input-group">
                                                        <label class="control-label">{{formsLang[lang.id].getLabel('contacttitle')}}</label>
                                                        {{formsLang[lang.id].render('contacttitle')}}
                                                        <div class="invalid-feedback"></div>
                                                    </div>
                                                </div>
                                                <div class="form-group label-floating w-100">
                                                    <div class="input-group">
                                                        <label class="control-label">{{formsLang[lang.id].getLabel('contactdes')}}</label>
                                                        {{formsLang[lang.id].render('contactdes')}}
                                                        <div class="invalid-feedback"></div>
                                                    </div>
                                                </div>
                                            </div>
                                            {% endfor  %}
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card card-primary card-outline">
                            <div class="card-header">
                                <h3 class="card-title text-primary"><i class="fas fa-building mr-1"></i>Danh sách Bộ môn</h3>
                            </div>
                            <div class="card-body bg-eee">
                                <div class="card card-primary card-outline card-outline-tabs">
                                    <div class="card-header p-0 border-bottom-0">
                                        <ul class="nav nav-tabs w-100">
                                            {% for key, lang in languages %}
                                            <li class="nav-item">
                                                <a class="nav-link {{ !key ? 'active' : '' }}" href="#alang{{lang.id}}" data-toggle="tab" data-tab="{{lang.id}}">
                                                    {{lang.name}}
                                                </a>
                                            </li>
                                            {% endfor %}
                                        </ul>
                                    </div>
                                    <div class="card-body">
                                        <div class="tab-content">
                                            {% for key, lang in languages %}
                                            <div class="tab-pane fade {{ !key ? 'active show' : '' }}" id="alang{{lang.id}}">
                                                <div class="form-group label-floating w-100 pb-0">
                                                    <div class="input-group">
                                                        <label class="control-label">{{formsLang[lang.id].getLabel('szedtitle')}}</label>
                                                        {{formsLang[lang.id].render('szedtitle')}}
                                                        <div class="invalid-feedback"></div>
                                                    </div>
                                                </div>
                                            </div>
                                            {% endfor  %}
                                        </div>
                                    </div>
                                </div>
                                <div class="card mb-0">
                                    <div class="card-header">
                                        <h3 class="card-title text-primary">Ảnh nền</h3>
                                    </div>
                                    <div class="card-body">
                                        <img id="showImg" class="w-100 d-block object-fit-fill" style="height: 150px;" src="<?= !empty($homes->szedbg) ? $homes->szedbg : '' ?>"
                                        alt="<?= !empty($homes->szedbg) ? $homes->szedbg : '' ?>">
                                    </div>
                                    <div class="card-footer">
                                        {{formHomes.render('szedbg')}}
                                        <a id="uploadImage" href="#" class="link">Tải ảnh</a>
                                        <a id="removeImage" href="#" class="ml-auto link text-danger <?= !empty($homes->szedbg) ? '' : 'hidden' ?>">Xóa</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card card-primary card-outline">
                            <div class="card-header">
                                <h3 class="card-title text-primary"><i class="fas fa-handshake mr-1"></i>Liên kết/ đối tác</h3>
                            </div>
                            <div class="card-body bg-eee">
                                <div class="card card-primary card-outline card-outline-tabs">
                                    <div class="card-header p-0 border-bottom-0">
                                        <ul class="nav nav-tabs w-100">
                                            {% for key, lang in languages %}
                                            <li class="nav-item">
                                                <a class="nav-link {{ !key ? 'active' : '' }}" href="#clang{{lang.id}}" data-toggle="tab" data-tab="{{lang.id}}">
                                                    {{lang.name}}
                                                </a>
                                            </li>
                                            {% endfor %}
                                        </ul>
                                    </div>
                                    <div class="card-body">
                                        <div class="tab-content">
                                            {% for key, lang in languages %}
                                            <div class="tab-pane fade {{ !key ? 'active show' : '' }}" id="clang{{lang.id}}">
                                                <div class="form-group label-floating w-100">
                                                    <div class="input-group">
                                                        <label class="control-label">{{formsLang[lang.id].getLabel('partnertitle')}}</label>
                                                        {{formsLang[lang.id].render('partnertitle')}}
                                                        <div class="invalid-feedback"></div>
                                                    </div>
                                                </div>
                                                <div class="form-group label-floating w-100">
                                                    <div class="input-group">
                                                        <label class="control-label">{{formsLang[lang.id].getLabel('partnerdes')}}</label>
                                                        {{formsLang[lang.id].render('partnerdes')}}
                                                        <div class="invalid-feedback"></div>
                                                    </div>
                                                </div>
                                            </div>
                                            {% endfor  %}
                                        </div>
                                    </div>
                                </div>
                                <div class="card mb-0">
                                    <div class="card-header">
                                        <h3 class="card-title text-primary">Ảnh nền</h3>
                                    </div>
                                    <div class="card-body">
                                        <img id="showPgImg" style="height: 150px;" class="w-100 d-block object-fit-fill" src="<?= !empty($homes->partnerbg) ? $homes->partnerbg : '' ?>"
                                        alt="<?= !empty($homes->partnerbg) ? $homes->partnerbg : '' ?>">
                                    </div>
                                    <div class="card-footer">
                                        {{formHomes.render('partnerbg')}}
                                        <a id="uploadPgImage" href="#" class="link">Tải ảnh</a>
                                        <a id="removePgImage" href="#" class="ml-auto link text-danger <?= !empty($homes->partnerbg) ? '' : 'hidden' ?> float-right">Xóa</a>
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