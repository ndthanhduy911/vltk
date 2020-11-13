<main class="app-content">
    <div class="app-title mb-3">
        <div>
            <h1><i class="fa fa-th-list"></i> {{title}} biểu tượng</h1>
        </div>
        <ul class="app-breadcrumb breadcrumb side">
            <li class="breadcrumb-item"><a class="link" href="{{ config.application.backendUri }}"><i class="fa fa-home fa-lg"></i></a></li>
            <li class="breadcrumb-item"><a class="link" href="{{ config.application.backendUri }}/setting/socials">Biểu tượng</a></li>
            <li class="breadcrumb-item">{{title}}</li>
        </ul>
    </div>

    <div class="body-message">
        <?php echo $this->flashSession->output(); ?>
    </div>

    <div class="row">
        <form class="w-100" method="post" enctype="multipart/form-data" data-toggle="validator" role="form">

            <div class="bg-white rounded p-3 col-md-12">
                <div class="row">
                    <div class="form-group mt-1 col-md-6">
                        <span class="text-primary">Tiêu đề</span>
                        <div class="input-group">
                            {{form_social.render('name')}}
                            <div class="invalid-tooltip"></div>
                        </div>
                    </div>

                    <div class="form-group mt-1 col-md-6">
                        <span class="text-primary">Biểu tượng:</span>
                        <div class="input-group">
                            {{form_social.render('icon')}}
                            <div class="invalid-tooltip"></div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group mt-1 col-md-6">
                        <span class="text-primary">Trạng thái:</span>
                        <div class="input-group">
                            {{form_social.render('status')}}
                            <div class="invalid-tooltip"></div>
                        </div>
                    </div>

                    <div class="form-group mt-1 col-md-6">
                        <span class="text-primary">Sắp xếp:</span>
                        <div class="input-group">
                            {{form_social.render('sort')}}
                            <div class="invalid-tooltip"></div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-12">
                        <span class="text-primary">Link:</span>
                        <div class="input-group">
                            {{form_social.render('link')}}
                            <div class="invalid-tooltip"></div>
                        </div>
                    </div>
                </div>
                
                <div class="row">
                    <div class="form-group col-md-12">
                        <button type="submit" class="btn btn-success btn-sm">{{title}}</button>
                    </div>
                </div>
            </div>


            <input class="tokenCSRF" type="hidden" name="{{ security.getTokenKey() }}"
                value="{{ security.getToken() }}">
        </form>
    </div>
</main>