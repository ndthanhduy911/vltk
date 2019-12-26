<main class="app-content">
    <div class="app-title mb-3">
        <div>
            <h1><i class="fa fa-dashboard"></i> Bảng điều khiển</h1>
            <p>Cập nhật tình hình hiện tại của trang web</p>
        </div>
        <ul class="app-breadcrumb breadcrumb">
            <li class="breadcrumb-item"><a class="link" href="{{ config.application.backenduri }}"><i
                        class="fa fa-home fa-lg"></i></a></li>
            <li class="breadcrumb-item">Bảng điều khiển</li>
        </ul>
    </div>
    <div class="body-message">
        <?php echo $this->flashSession->output(); ?>
    </div>

    <div class="row">
        <div class="col-md-12 p-0">
            <div class="tile mb-3">
                <div class="tile-body">
                    <div class="row">
                        <div class="col-lg-3 col-6">
                            <!-- small box -->
                            <div class="small-box bg-info">
                                <div class="inner">
                                    <h3>{{ count_post }}</h3>
                                    <p>Bài viết</p>
                                </div>
                                <div class="icon">
                                    <i class="fa fa-newspaper-o"></i>
                                </div>
                                <a href="{{ config.application.backendUri }}/posts" class="small-box-footer">Chi tiết <i
                                        class="fa fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                        <!-- ./col -->
                        <div class="col-lg-3 col-6">
                            <!-- small box -->
                            <div class="small-box bg-success">
                                <div class="inner">
                                    <h3>{{ count_page }}</h3>
                                    <p>Trang</p>
                                </div>
                                <div class="icon">
                                    <i class="fa fa-file"></i>
                                </div>
                                <a href="{{ config.application.backendUri }}/pages" class="small-box-footer">Chi tiết <i
                                        class="fa fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                        <!-- ./col -->
                        <div class="col-lg-3 col-6">
                            <!-- small box -->
                            <div class="small-box bg-warning">
                                <div class="inner">
                                    <h3>{{ count_staff }}</h3>
                                    <p>Cán bộ</p>
                                </div>
                                <div class="icon">
                                    <i class="fa fa-users"></i>
                                </div>
                                <a href="{{ config.application.backendUri }}/staff" class="small-box-footer">Chi tiết <i
                                        class="fa fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                        <!-- ./col -->
                        <div class="col-lg-3 col-6">
                            <!-- small box -->
                            <div class="small-box bg-primary">
                                <div class="inner">
                                    <h3>{{ count_partner }}</h3>
                                    <p>Liên kết</p>
                                </div>
                                <div class="icon">
                                    <i class="fa fa-link"></i>
                                </div>
                                <a href="{{ config.application.backendUri }}/partner" class="small-box-footer">Chi tiết <i
                                        class="fa fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                        <!-- ./col -->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6 pl-md-0">
            <div class="tile mb-3">
                <div class="card-title bg-white border-bottom">
                    <h3 class="tile-title mb-3">Bài viết mới nhất</h3>
                </div>
                <div class="tile-body p-0">
                    <ul class="products-list product-list-in-card">
                        {% for post in newest_post %}
                        <li class="item">
                            <div class="product-img">
                                <img src="{{ helper.getLinkImage(post.featured_image) }}" alt="{{ post.title }}" class="img-size-50">
                            </div>
                            <div class="product-info">
                                <a target="__blank" href="{{ postModel.getUrl(dept, post) }}" class="product-title">{{ helper.getExcerpt(post.title, 0, 50) }}<span class="badge badge-info float-right">{{ helper.datetime_vn(post.calendar,'d/m/Y') }}</span></a>
                                <span class="product-description">
                                    {{ helper.getExcerpt(post.excerpt, 0, 50) }}
                                </span>
                            </div>
                        </li>
                        {% endfor %}
                    </ul>
                </div>

                <div class="title-footer text-center">
                    <a href="{{ config.application.backendUri }}/posts" class="uppercase">Xem tất cả</a>
                </div>
            </div>
        </div>
        <div class="col-md-6 pr-md-0">
            <div class="tile mb-3">
                <div class="card-title bg-white border-bottom">
                    <h3 class="tile-title mb-3">Lượt truy cập</h3>
                </div>
                <div class="tile-body p-0">
                    <div class="info-box mb-3 bg-gradient-warning">
                        <span class="info-box-icon"><i class="fa fa-home"></i></span>

                        <div class="info-box-content">
                            <span class="info-box-text">Truy cập web</span>
                            <span class="info-box-number">5,200</span>
                        </div>
                    </div>
                    <div class="info-box mb-3 bg-gradient-success">
                        <span class="info-box-icon"><i class="fa fa-newspaper-o"></i></span>

                        <div class="info-box-content">
                            <span class="info-box-text">Xem bài viết</span>
                            <span class="info-box-number">92,050</span>
                        </div>
                    </div>
                    <div class="info-box mb-3 bg-gradient-danger">
                        <span class="info-box-icon"><i class="fa fa-calendar"></i></span>

                        <div class="info-box-content">
                            <span class="info-box-text">Xem lịch học</span>
                            <span class="info-box-number">114,381</span>
                        </div>
                    </div>
                    <div class="info-box mb-3 bg-gradient-info">
                        <span class="info-box-icon"><i class="fa fa-tags"></i></span>

                        <div class="info-box-content">
                            <span class="info-box-text">Truy cập khác</span>
                            <span class="info-box-number">163,921</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>