<main class="app-content">
    <div class="row user">
        <div class="col-md-12">
            <div class="profile">
                <div class="info"><img class="user-img" src="https://s3.amazonaws.com/uifaces/faces/twitter/jsa/128.jpg">
                    <h4><?php echo $this->session->get('username') ?></h4>
                    <h4><?php echo $this->session->get('name') ?></h4>
                </div>
                <div class="cover-image"></div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="tile p-0">
                <ul class="nav flex-column nav-tabs user-tabs">
                    <li class="nav-item"><a class="nav-link active" href="#user-timeline" data-toggle="tab">Cập nhật thông tin</a></li>
                    <li class="nav-item"><a class="nav-link" href="#user-settings" data-toggle="tab">Đổi mật khẩu</a></li>
                </ul>
            </div>
        </div>
        <div class="col-md-9">
            <div class="tab-content">
                <div class="tab-pane active" id="user-timeline">
                    <div class="timeline-post">
                        <?php echo $this->flashSession->output(); ?>
                        <h4 class="line-head">Cập nhật thông tin</h4>
                        <div class="post-content">
                            <form class="login-form" data-toggle="validator" role="form" method="POST">
                            {% for element in form %}
                            <div class="col-md-8 p-0">
                                <div class="form-group has-feedback">
                                    <label for="" class="control-label">{{element.getLabel()}}</label>
                                    <div class="input-group">
                                        <span class="input-group-addon">
                                            <i class="glyphicon glyphicon-edit"></i>
                                        </span> {{element.render()}} </div>
                                    <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                    <div class="help-block with-errors"></div>
                                </div>
                            </div>
                            {% endfor %}
                            <input class="tokenCSRF" type="hidden" name="{{ security.getTokenKey() }}" value="{{ security.getToken() }}">
                            <div class="col-md-12 p-0">
                                <button type="submit" class="btn btn-primary"><span>Cập nhật</span></button>
                            </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade" id="user-settings">
                    <div class="tile user-settings">
                        <h4 class="line-head mb-2">Đổi mật khẩu</h4>
                        <form action="<?php echo WEB_ADMIN_URL ?>/profile/changepw" class="login-form" data-toggle="validator" role="form" method="POST">
                        {% for element in formPW %}
                        <div class="row">
                            <div class="col-md-8">
                                <div class="form-group">
                                    <label for="" class="control-label">{{element.getLabel()}}</label>
                                    <div class="input-group">
                                        {{element.render()}}
                                        <div class="invalid-tooltip"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        {% endfor %}
                        <input class="tokenCSRF" type="hidden" name="{{ security.getTokenKey() }}" value="{{ security.getToken() }}">
                        <div class="col-md-12 p-0">
                            <button type="submit" class="btn btn-primary">Cập nhật</button>
                        </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>