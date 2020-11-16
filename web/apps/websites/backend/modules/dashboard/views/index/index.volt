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
        </div>
    </div>
</div>

<div class="col-md-12">
    <div class="col-md-12">
        <?php echo $this->flashSession->output(); ?>
    </div>
</div>

<section class="content dashboard">
    <div class="container-fluid">
        <div class="col-md-12">
            <div class="tab-content">
                <div class="tab-pane active">
                    <div class="row">
                        <div class="col-lg-3 col-6 sortDbBoxTab1">
                            <!-- small box -->
                            <div class="small-box bg-info">
                                <div class="inner">
                                    <h3>{{countPost}}</h3>
                                    <p>Bài viết</p>
                                </div>
                                <div class="icon">
                                    <i class="fas fa-newspaper"></i>
                                </div>
                                <a href="#" class="small-box-footer ">Chi tiết <i
                                        class="fas fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                        <div class="col-lg-3 col-6 sortDbBoxTab1">
                            <!-- small box -->
                            <div class="small-box bg-success">
                                <div class="inner">
                                    <h3>{{countPage}}</h3>
                                    <p>Trang</p>
                                </div>
                                <div class="icon">
                                    <i class="fas fa-globe"></i>
                                </div>
                                <a href="#" class="small-box-footer">Chi tiết <i
                                        class="fas fa-arrow-circle-right"></i></a>
                            </div>
                        </div>

                        <div class="col-lg-3 col-6 sortDbBoxTab1">
                            <div class="small-box bg-purple">
                                <div class="inner">
                                    <h3>{{countStaff}}</h3>
                                    <p>Cán bộ</p>
                                </div>
                                <div class="icon">
                                    <i class="fa fa-users"></i>
                                </div>
                                <a href="#" class="small-box-footer">Chi tiết <i
                                        class="fas fa-arrow-circle-right"></i></a>
                            </div>
                        </div>

                        <div class="col-lg-3 col-6 sortDbBoxTab1">
                            <div class="small-box bg-warning">
                                <div class="inner">
                                    <h3>{{countPartner}}</h3>
                                    <p>Liên kết</p>
                                </div>
                                <div class="icon">
                                    <i class="fas fa-link"></i>
                                </div>
                                <a href="#" class="small-box-footer">Chi tiết <i
                                        class="fas fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <section class="col-lg-6 sortDbTab1">
                            <div class="card card-primary card-outline">
                                <div class="card-header">
                                    <h3 class="card-title">
                                        <i class="fas fa-newspaper mr-1"></i>
                                        Bài viết mới nhất
                                    </h3>
                                </div>
                                <div class="card-body p-2">
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead>
                                                <tr class="text-center">
                                                    <th>Ảnh đại diện</th>
                                                    <th>Tiêu đề</th>
                                                    <th>Thời gian</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                {% for post in newestPost %}
                                                <tr>
                                                    <td class="align-middle"><img src="{{ helper.getLinkImage(post.featured_image) }}" alt="{{ post.title }}" class="img-size-50"></td>
                                                    <td class="align-middle"><a target="_blank" href="<?= Posts::getUrl($dept, $post) ?>">{{ post.title }}</a></td>
                                                    <td class="align-middle"><span class="badge badge-info float-right">{{ helper.dateVn(post.calendar,'d/m/Y H:i') }}</span></td>
                                                </tr>
                                                {% endfor %}
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </section>
                        <section class="col-lg-6 sortDbTab1">
                            <div class="card card-primary card-outline">
                                <div class="card-header">
                                    <h3 class="card-title">
                                        <i class="fas fa-link mr-1"></i>
                                        Lượt truy cập
                                    </h3>
                                </div>
                                <div class="card-body p-2">
                                    <div class="info-box mb-3 bg-info">
                                        <span class="info-box-icon"><i class="fas fa-lock"></i></span>
                            
                                        <div class="info-box-content">
                                            <span class="info-box-text">Đăng nhập</span>
                                            <span class="info-box-number">{{countCWeb}}</span>
                                        </div>
                                    </div>
                                    <div class="info-box mb-0 bg-warning">
                                        <span class="info-box-icon"><i class="fas fa-newspaper"></i></span>
                            
                                        <div class="info-box-content">
                                            <span class="info-box-text">Xem bài viết</span>
                                            <span class="info-box-number">{{countCPost}}</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>