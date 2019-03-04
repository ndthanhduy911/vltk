<style>
    #avatar{
        display: none;
    }
    .avatar label {
        cursor: pointer;
    }
</style>
<!-- Bread crumb -->
<div class="row page-titles">
    <div class="col-md-8 align-self-center">
        <h3 class="text-hnn font-weight-bold">TRANG CÁ NHÂN</h3>
        <span>Thông tin cá nhân</span>
    </div>
    <div class="col-md-4 align-self-center">
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a href="{{ url('/adcp/dashboard') }}">BẢN ĐIỀU KHIỂN</a>
            </li>
            <li class="breadcrumb-item active">Trang cá nhân</li>
        </ol>
    </div>
</div>
<?php echo $this->flashSession->output() ?>
<!-- End Bread crumb -->
<div class="container-fluid">
    <div class="row">
        <!-- Column -->
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">
                    <div class="card-two">
                            <?php $userObj = $this->session->get('auth-identity') ; ?>
                        <header>
                            <div class="avatar">
                                <label for="avatar">
                                    <img src="/files/avatar/{{userObj['avatar']?userObj['avatar']:'hnn-avatar.png'}}" />
                                    <input data-id="{{userObj['id']}}" id="avatar" name="avatar" type="file">
                                </label>
                                
                            </div>  
                            <p>Đổi ảnh đại diện</p>  
                        </header>
                        
                        <h3>{{userObj['fullname']}}</h3>
                        <div class="desc">
                            {{userObj['email']}}
                        </div>
                        <div class="contacts">
                            <a href="">
                                <i class="fa fa-plus"></i>
                            </a>
                            <a href="">
                                <i class="fa fa-whatsapp"></i>
                            </a>
                            <a href="javascript:;" class="changePassword">
                                <i class="fa fa-key"></i>
                            </a>
                            <div class="clear"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Column -->
        <!-- Column -->
        <div class="col-lg-12">
            <div class="card">
                <!-- Nav tabs -->
                <ul class="col-md-12 nav nav-tabs profile-tab" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" data-toggle="tab" href="#profile" role="tab">Thông tin cá nhân</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#setting" role="tab">Thiết lập</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#report" role="tab">Báo cáo</a>
                    </li>
                </ul>
                <!-- Tab panes -->
                <div class="tab-content">
                    <div class="tab-pane active" id="profile" role="tabpanel">
                        <div class="card-body">
                            <form data-id="{{user.id}}" id="frmEditProfile" action="" method="post" data-toggle="validator" role="form">
                                <div class="modal-body">
                                    <div class="container">
                                        <div class="form-row">
                                            <div class="col-md-6 mb-3">
                                                {{ form.label('email') }}
                                                <div class="input-group">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text" id="inputGroupPrepend">
                                                            <i class="fa fa-edit"></i>
                                                        </span>
                                                    </div>
                                                    {{ form.render('email') }}
                                                    <div class="invalid-tooltip">

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6 mb-3">
                                                {{ form.label('fullname') }}
                                                <div class="input-group">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text" id="inputGroupPrepend">
                                                            <i class="fa fa-edit"></i>
                                                        </span>
                                                    </div>
                                                    {{ form.render('fullname') }}
                                                    <div class="invalid-tooltip">

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="col-md-6 mb-3">
                                                {{ form.label('address') }}
                                                <div class="input-group">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text" id="inputGroupPrepend">
                                                            <i class="fa fa-edit"></i>
                                                        </span>
                                                    </div>
                                                    {{ form.render('address') }}
                                                    <div class="invalid-tooltip">

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6 mb-3">
                                                {{ form.label('mobile') }}
                                                <div class="input-group">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text" id="inputGroupPrepend">
                                                            <i class="fa fa-edit"></i>
                                                        </span>
                                                    </div>
                                                    {{ form.render('mobile') }}
                                                    <div class="invalid-tooltip">

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="col-md-6 mb-3">
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
                                </div>
                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-danger">Cập nhật</button>
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                                    
                                </div>
                            </form>
                        </div>
                    </div>
                    <!-- <div class="tab-pane" id="setting" role="tabpanel">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-3 col-xs-6 b-r">
                                    <strong>Full Name</strong>
                                    <br>
                                    <p class="text-muted">John Deo</p>
                                </div>
                                <div class="col-md-3 col-xs-6 b-r">
                                    <strong>Mobile</strong>
                                    <br>
                                    <p class="text-muted">(123) 456 7890</p>
                                </div>
                                <div class="col-md-3 col-xs-6 b-r">
                                    <strong>Email</strong>
                                    <br>
                                    <p class="text-muted">Zebra Theme@gmail.com</p>
                                </div>
                                <div class="col-md-3 col-xs-6">
                                    <strong>Location</strong>
                                    <br>
                                    <p class="text-muted">London</p>
                                </div>
                            </div>
                            <hr>
                            <p class="m-t-30">Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut,
                                imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer
                                tincidunt.Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus.
                                Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim.</p>
                            <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been
                                the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley
                                of type and scrambled it to make a type specimen book. It has survived not only five centuries
                            </p>
                            <p>It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,
                                and more recently with desktop publishing software like Aldus PageMaker including versions
                                of Lorem Ipsum.
                            </p>
                            <h4 class="font-medium m-t-30">Skill Set</h4>
                            <hr>
                            <h5 class="m-t-30">Wordpress
                                <span class="pull-right">80%</span>
                            </h5>
                            <div class="progress">
                                <div class="progress-bar bg-success" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width:80%; height:6px;">
                                    <span class="sr-only">50% Complete</span>
                                </div>
                            </div>
                            <h5 class="m-t-30">HTML 5
                                <span class="pull-right">90%</span>
                            </h5>
                            <div class="progress">
                                <div class="progress-bar bg-info" role="progressbar" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100" style="width:90%; height:6px;">
                                    <span class="sr-only">50% Complete</span>
                                </div>
                            </div>
                            <h5 class="m-t-30">jQuery
                                <span class="pull-right">50%</span>
                            </h5>
                            <div class="progress">
                                <div class="progress-bar bg-danger" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width:50%; height:6px;">
                                    <span class="sr-only">50% Complete</span>
                                </div>
                            </div>
                            <h5 class="m-t-30">Photoshop
                                <span class="pull-right">70%</span>
                            </h5>
                            <div class="progress">
                                <div class="progress-bar bg-warning" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style="width:70%; height:6px;">
                                    <span class="sr-only">50% Complete</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane" id="report" role="tabpanel">
                        <div class="card-body">
                            <div class="profiletimeline">
                                <div class="sl-item">
                                    <div class="sl-left">
                                        <img src="images/users/avatar-1.jpg" alt="user" class="img-circle" /> </div>
                                    <div class="sl-right">
                                        <div>
                                            <a href="#" class="link">Michael Qin</a>
                                            <span class="sl-date">5 minutes ago</span>
                                            <p>assign a new task
                                                <a href="#"> Design weblayout</a>
                                            </p>
                                            <div class="row">
                                                <div class="col-lg-3 col-md-6 m-b-20">
                                                    <img src="images/big/img1.jpg" class="img-responsive radius" />
                                                </div>
                                                <div class="col-lg-3 col-md-6 m-b-20">
                                                    <img src="images/big/img2.jpg" class="img-responsive radius" />
                                                </div>
                                                <div class="col-lg-3 col-md-6 m-b-20">
                                                    <img src="images/big/img3.jpg" class="img-responsive radius" />
                                                </div>
                                                <div class="col-lg-3 col-md-6 m-b-20">
                                                    <img src="images/big/img4.jpg" class="img-responsive radius" />
                                                </div>
                                            </div>
                                            <div class="like-comm">
                                                <a href="javascript:void(0)" class="link m-r-10">2 comment</a>
                                                <a href="javascript:void(0)" class="link m-r-10">
                                                    <i class="fa fa-heart text-danger"></i> 5 Love</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <hr>
                                <div class="sl-item">
                                    <div class="sl-left">
                                        <img src="images/users/avatar-2.jpg" alt="user" class="img-circle" /> </div>
                                    <div class="sl-right">
                                        <div>
                                            <a href="#" class="link">Michael Qin</a>
                                            <span class="sl-date">5 minutes ago</span>
                                            <div class="m-t-20 row">
                                                <div class="col-md-3 col-xs-12">
                                                    <img src="images/big/img1.jpg" alt="user" class="img-responsive radius" />
                                                </div>
                                                <div class="col-md-9 col-xs-12">
                                                    <p> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec
                                                        odio. Praesent libero. Sed cursus ante dapibus diam. </p>
                                                    <a href="#" class="btn btn-success"> Design weblayout</a>
                                                </div>
                                            </div>
                                            <div class="like-comm m-t-20">
                                                <a href="javascript:void(0)" class="link m-r-10">2 comment</a>
                                                <a href="javascript:void(0)" class="link m-r-10">
                                                    <i class="fa fa-heart text-danger"></i> 5 Love</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <hr>
                                <div class="sl-item">
                                    <div class="sl-left">
                                        <img src="images/users/avatar-3.jpg" alt="user" class="img-circle" /> </div>
                                    <div class="sl-right">
                                        <div>
                                            <a href="#" class="link">Michael Qin</a>
                                            <span class="sl-date">5 minutes ago</span>
                                            <p class="m-t-10"> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent
                                                libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum
                                                imperdiet. Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue
                                                semper </p>
                                        </div>
                                        <div class="like-comm m-t-20">
                                            <a href="javascript:void(0)" class="link m-r-10">2 comment</a>
                                            <a href="javascript:void(0)" class="link m-r-10">
                                                <i class="fa fa-heart text-danger"></i> 5 Love</a>
                                        </div>
                                    </div>
                                </div>
                                <hr>
                                <div class="sl-item">
                                    <div class="sl-left">
                                        <img src="images/users/avatar-4.jpg" alt="user" class="img-circle" /> </div>
                                    <div class="sl-right">
                                        <div>
                                            <a href="#" class="link">Michael Qin</a>
                                            <span class="sl-date">5 minutes ago</span>
                                            <blockquote class="m-t-10">
                                                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt
                                            </blockquote>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div> -->
                </div>
            </div>
        </div>
        <!-- Column -->
    </div>
</div>

<div id="modalChangePassword" class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="modalChangePasswordLabel"
     aria-hidden="true">
    <div class="modal-dialog" style="max-width: 1200px; width: 40%;">
        <div class="modal-content">
            <div class="modal-header" style="background:#EE161E">
                <h5 class="modal-title text-white" id="modalChangePasswordLabel">Thay đổi mật khẩu</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Đóng" style="font-size: 2rem; padding: 0; margin-right: 15px; margin-top: 0px;">
                    <span class="text-white" aria-hidden="true">&times;</span>
                </button>
            </div>
            <form id="frmChangePassword"action="/adcp/user/changepassword" data-id="{{user.id}}" method="post" data-toggle="validator" role="form">
                <div class="modal-body">
                    <div class="container">
                        <div class="form-row">
                            <div class="col-md-12 mb-3">
                                <label for="passwordOld">Mật khẩu hiện tại
                                    <strong class="text-danger">*</strong>
                                </label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="inputGroupPrepend">
                                            <i class="fa fa-edit"></i>
                                        </span>
                                    </div>
                                    <input type="password" id="passwordOld" name="passwordOld" class="form-control" placeholder="Nhập mật khẩu" required="1" maxlength="150" data-required-error="Vui lòng nhập mật khẩu của bạn." data-error="Chưa đúng định dạng.">
                                    <div class="invalid-tooltip">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-md-12 mb-3">
                                <label for="password">Mật khẩu
                                    <strong class="text-danger">*</strong>
                                </label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="inputGroupPrepend">
                                            <i class="fa fa-edit"></i>
                                        </span>
                                    </div>
                                    <input type="password" id="password" name="password" class="form-control" placeholder="Nhập mật khẩu" required="1" maxlength="150" data-required-error="Vui lòng nhập mật khẩu của bạn." data-error="Chưa đúng định dạng.">
                                    <div class="invalid-tooltip">

                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12 mb-3">
                                <label for="confrim_password">Xác nhận Mật khẩu <strong class="text-danger">*</strong></label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="inputGroupPrepend">
                                            <i class="fa fa-edit"></i>
                                        </span>
                                    </div>
                                    <input type="password" id="confrim_password" name="confrim_password" class="form-control" placeholder="Xác nhận mật khẩu" required="1" maxlength="150" data-match="#password" data-required-error="Vui lòng nhập nhập lại mật khẩu của bạn." data-error="Mật khẩu không trùng khớp.">
                                    <div class="invalid-tooltip">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-danger">Thay đổi</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                </div>
            </form>
        </div>
    </div>
</div>