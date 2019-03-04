<div class="row page-titles">
    <div class="col-md-5 align-self-center">
        <h3 class="text-hnn font-weight-bold">PACKAGES</h3>
    </div>
    <div class="col-md-7 align-self-center">
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a href="{{ url('/adcp/dashboard') }}">DASHBOARD</a>
            </li>
            <li class="breadcrumb-item active">Add Packages</li>
        </ol>
    </div>
</div>
<?php echo $this->flashSession->output() ?>
<div class="container-fluid">
    <!-- Start Page Content -->
    <div class="container mt-4">
        <div class="col-12">
            <form action="" id="frmEditPackage" method="post" data-toggle="validator" role="form">

                <div class="container">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-row">
                                <div class="col-md-12 mb-3">
                                    {{ form.label('name') }}
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                <span class="input-group-text" id="inputGroupPrepend">
                                <i class="fa fa-edit"></i>
                                </span>
                                        </div>
                                        {{ form.render('name')}}
                                        <div class="invalid-tooltip">

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="col-md-12 mb-3">
                                    {{ form.label('status') }}
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                <span class="input-group-text" id="inputGroupPrepend">
                                <i class="fa fa-edit"></i>
                                </span>
                                        </div>
                                        {{ form.render('status') }}
                                        <div class="invalid-tooltip">

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-row">
                                <div class="col-md-12 mb-3">
                                    {{ form.label('note') }}
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                    <span class="input-group-text" id="inputGroupPrepend">
                                    <i class="fa fa-edit"></i>
                                    </span>
                                        </div>
                                        {{ form.render('note')}}
                                        <div class="invalid-tooltip">

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 offset-md-8" style="text-align: right;">
                    <button type="submit" class="btn btn-primary">Update</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                </div>
            </form>
        </div>
    </div>
</div>