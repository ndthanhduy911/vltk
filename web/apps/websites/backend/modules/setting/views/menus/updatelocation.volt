<main class="app-content">
        <div class="app-title mb-3">
            <div>
                <h1><i class="fa fa-th-list"></i> Menu</h1>
                <p><?php echo $title.' vị trí menu' ?></p>
            </div>
            <ul class="app-breadcrumb breadcrumb side">
                <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
                <li class="breadcrumb-item">Menu</li>
                <li class="breadcrumb-item">{{title}}</li>
            </ul>
        </div>
    
        <div class="body-message">
            <?php echo $this->flashSession->output(); ?>
        </div>
    
        <div class="row">
            <div class="col-md-12 p-0">
                <div class="tile">
                    <div class="tile-body">
                        <form id="frmMenuLocation" method="post" enctype="multipart/form-data" data-toggle="validator" role="form">
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label class="control-label">Tên vị trí</label>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <div class="input-group-text fa fa-address-card"></div>
                                        </div>
                                        {{form.render('name')}}
                                        <div class="invalid-tooltip"></div>
                                    </div>
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="control-label">Trạng thái</label>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <div class="input-group-text fa fa-toggle-on"></div>
                                        </div>
                                        {{form.render('status')}}
                                        <div class="invalid-tooltip"></div>
                                    </div>
                                </div>

                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-12">
                                    <label class="control-label">Mô tả</label>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <div class="input-group-text fa fa-info"></div>
                                        </div>
                                        {{form.render('description')}}
                                        <div class="invalid-tooltip"></div>
                                    </div>
                                </div>
                            </div>

                            <input type="hidden" name="<?php echo $this->security->getTokenKey() ?>"
                                value="<?php echo $this->security->getToken() ?>" />
                            <div class="col-md-12 text-center">
                                <button type="submit"
                                    class="btn btn-success">{{title}}</button>
                                <a href="<?php echo BACKEND_URL.'/menu/location' ?>" class="btn btn-secondary">Quay lại</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </main>