<div class="content-header">
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-6 d-flex align-items-center">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="<?= WEB_ADMIN_URL ?>"><i class="fas fa-home"></i></a></li>
                    <li class="breadcrumb-item active">{{ title }}</li>
                </ol>
            </div>
        </div>
    </div>
</div>

<div class="col-md-12">
    <div class="col-md-12">
        <?php echo $this->flashSession->output(); ?>
    </div>
</div>

<section class="content col-md-12">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <div class="card card-primary card-outline card-outline-tabs">
                    <div class="card-header p-0 border-bottom-0">
                        <ul class="nav nav-tabs w-100" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="features-tab" data-toggle="pill" href="#features"
                                    role="tab" aria-controls="features" aria-selected="true">Tính năng</a>
                            </li>
                        </ul>
                    </div>
                    <div class="card-body">
                        <div class="tab-content">
                            <div class="tab-pane fade show active" id="features" role="tabpanel"
                                aria-labelledby="features-tab">
                                <div class="col-md-4">
                                    <h5 class="font-weight-bold mb-3">Tính năng hiển thị</h5>
                                    {% for feature in features %}
                                    <div class="form-group mt-0">
                                        <div class="custom-control custom-checkbox">
                                            <?php
                                                $feature_key = array_search($feature->id, array_column($featuresList, 'features_id'));
                                                $checked = $feature_key !== false ? ($featuresList[$feature_key]['view'] == 1 ? 'checked' : '' ) : 'checked';
                                            ?>
                                            <input {{ checked }} class="custom-control-input features" type="checkbox" id="features{{ feature.id }}" name="features[]" value="{{ feature.id }}">
                                            <label for="features{{ feature.id }}" class="custom-control-label font-weight-normal">{{ feature.name }}</label>
                                        </div>
                                    </div>
                                    {% endfor %}
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.card -->
                </div>
            </div>
        </div>
    </div>
</section>