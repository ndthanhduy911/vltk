{% if banners.count() %}
<!-- ================ -->
<div class="banner clearfix">
    <!-- slideshow start -->
    <!-- ================ -->
    <div class="slideshow">

        <!-- slider revolution start -->
        <!-- ================ -->
        <div class="slider-revolution-5-container">
            <div id="slider-banner-fullwidth" class="slider-banner-fullwidth rev_slider"
                data-version="5.0">
                <ul class="slides">
                    {% for key, banner in banners %}
                    <li data-transition="random" data-slotamount="default" data-masterspeed="default" data-title="{{ banner.name }}">
                        <img src="{{ helper.getLinkImage(banner.image,'/assets/frontend/images/banner1.png') }}" alt="{{ banner.name }}" data-bgposition="center center"
                            data-bgrepeat="no-repeat" data-bgfit="cover" class="rev-slidebg">

                        <!-- Transparent Background -->
                        <div class="tp-caption" data-x="center" data-y="center" data-start="0"
                            data-transform_idle="o:1;" data-transform_in="o:0;s:600;e:Power2.easeInOut;"
                            data-transform_out="o:0;s:600;" data-width="5000" data-height="5000" style="background-color: rgba(0, 0, 0, 0.1);">
                        </div>

                        <!-- LAYER NR. 1 -->
                        <div class="tp-caption sfb fadeout caption-box text-<?= $key % 2 == 0 ? 'left' : 'right' ?> rounded"
                            style="background-color: rgba(0, 0, 0, 0.8);" data-x="<?= $key % 2 == 0 ? 'left' : 'right' ?>" data-y="center"
                            data-start="600" data-whitespace="normal" data-transform_idle="o:1;"
                            data-transform_in="y:[100%];sX:1;sY:1;o:0;s:1150;e:Power4.easeInOut;"
                            data-transform_out="y:[100%];s:1000;e:Power2.easeInOut;"
                            data-mask_in="x:0px;y:[100%];s:inherit;e:inherit;"
                            data-mask_out="x:inherit;y:inherit;s:inherit;e:inherit;">
                            <h2 class="title slider-title">{{ banner.name }}</h2>
                            <div class="separator-2 clearfix"></div>
                            <p class="slider-content">{{ banner.description }}</p>
                            <div class="text-right"><a class="btn btn-small btn-default margin-clear" href="{{ banner.button_link }}">{{ banner.button_text }}</a></div>
                        </div>
                    </li>
                    {% endfor %}
                </ul>
                <div class="tp-bannertimer"></div>
            </div>
        </div>
        <!-- slider revolution end -->

    </div>
    <!-- slideshow end -->
</div>
{% endif %}

<div id="page-start"></div>
{% if cats.count() %}
<section id="section1" class="section clearfix pt-5 pb-0">
    <div class="container mt-4">
        <div class="row">
            {% for cat in cats %}
            <div class="col-lg-4">
                <h3><span class="text-default">{{cat.cat_name}}</span></h3>
                <div class="separator-2"></div>
                <div class="block">
                    <div class="home-post">
                        <?php 
                            $npPosts = $postModel::getNamepace();
                            $posts = $this->modelsManager->createBuilder()
                            ->columns(array(
                                $npPosts.'.id',
                                'PL.title',
                                $npPosts.'.slug',
                                $npPosts.'.cat_id',
                                'PL.content',
                                $npPosts.'.status',
                                'PL.excerpt',
                                $npPosts.'.calendar',
                                $npPosts.'.featured_image',
                            ))
                            ->from($npPosts)
                            ->where("$npPosts.deleted = 0 AND $npPosts.cat_id = $cat->id AND $npPosts.status = 1")
                            ->join('Models\PostsLang', 'PL.post_id = '.$npPosts.'.id AND PL.lang_id = '.$this->session->get('lang_id'),'PL')
                            ->orderBy("$npPosts.calendar DESC")
                            ->limit(5, 0)
                            ->getQuery()
                            ->execute();
                        ?>
                        {% for post in posts %}
                        <div class="media mb-3">
                            <div class="overlay-container rounded">
                                <img class="media-object" src="{{ helper.getLinkImage(post.featured_image) }}" alt="{{ post.title }}">
                                <a href="{{ postModel.getUrl(dept, post) }}" class="overlay-link small"><i class="fa fa-graduation-cap"></i></a>
                            </div>
                            <div class="media-body">
                                <h5 class="media-heading"><a href="{{ postModel.getUrl(dept, post) }}" title="{{ post.title }}">{{ helper.getExcerpt(post.title, 0, 70) }}</a></h5>
                                <div class="small"><i class="fa fa-calendar pr-10"></i>{{ helper.datetime_vn(post.calendar, 'd/m/Y') }}</div>
                            </div>
                        </div>
                        {% endfor %}
                    </div>
                    <footer class="clearfix">
                        <div class="link pull-right small"><i class="fa fa-link pr-1"></i><a href="{{ catModel.getUrl(dept, cat) }}">{{ ml._ml_system('more', 'Xem thêm') }}</a></div>
                    </footer>
                </div>
            </div>
            {% endfor %}
        </div>
    </div>
</section>
{% endif %}

{% if researches.count() %}
<section class="pt-5 pb-5 section dark-translucent-bg fixed-bg" style="background-position: 50% 42%; background-image: url({{ helper.getLinkImage(home['specialized_bg'], './assets/frontend/images/education-4.jpg') }})">
    {% if home['specialized_title'] %}
    <div class="container mt-4">
        <div class="row justify-content-lg-center">
            <div class="col-lg-8 text-center">
                <h2 class="page-title text-center"><strong>{{ home['specialized_title'] }}</strong></h2>
                <div class="separator"></div>
            </div>
        </div>
    </div>
    {% endif %}
    <div class="row mb-4 mr-0 ml-0">
        <div class="col-md-12 pv-20">
            <div class="slick-carousel carousel">
                {% for research in researches %}
                <div class="col-lg-3 col-md-6">
                    <div class="image-box shadow-2 bordered text-center mb-20">
                        <div class="overlay-container rounded overlay-visible">
                            <img class="grow" src="{{ helper.getLinkImage(research.featured_image) }}" alt="{{ research.research_name }}">
                            <a href="{{ researchModel.getUrl(dept,research) }}" class="overlay-link"><i class="fa fa-graduation-cap"></i></a>
                            <div class="overlay-bottom hidden-xs">
                                <div class="text">
                                    {{ research.research_name }}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                {% endfor %}
            </div>
        </div>
    </div>
</section>
{% endif %}

{% if staffs.count() %}
<section class="clearfix pt-5 pb-5">
    <div class="container">
        {% if home['staff_title'] %}
        <div class="row justify-content-lg-center pv-20">
            <div class="col-lg-8">
                <h2 class="page-title text-center"><strong>{{ home['staff_title'] }}</strong></h2>
                <div class="separator"></div>
                <p class="lead text-center">{{ home['staff_des'] }}</p>
            </div>
        </div>
        {% endif %}
        <div class="row pv-20 d-md-flex justify-content-center">
            {% for staff in staffs %}
            <div class="col-md-4">
                <div class="image-box team-member shadow-2 mb-20">
                    <div class="overlay-container rounded overlay-visible">
                        <img width="100%" src="{{ helper.getLinkImage(staff.featured_image,'/assets/frontend/images/education-4.jpg') }}" alt="{{staff.title}}">
                        <a href="{{ constant('FRONTEND_URL')~'/staff/'~staff.slug }}" class="overlay-link" title="{{staff.title}}"><i class="fa fa-graduation-cap"></i></a>
                        <div class="overlay-bottom">
                            <div class="text p-0">
                                <h4 class="title text-white text-uppercase">{{staff.title}}</h4>
                                <div class="separator light"></div>
                                <p class="small margin-clear"><em>{{helper.getDean(staff.dean)}}</em></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            {% endfor %}
        </div>
        <div class="col-lg-12 text-center">
            <?php $staff_link = $dept->slug != '/' ? FRONTEND_URL.$dept->slug.'/staff' : FRONTEND_URL.'/staff'; ?>
            <a href="{{ staff_link }}" class="btn btn-default btn-lg btn-animated radius-50">{{ ml._ml_system('more', 'Xem thêm') }} <i class="fa fa-arrow-right"></i></a>
        </div>
    </div>
</section>
{% endif %}


{% if partners %}
<section class="pt-5 pb-5 section dark-translucent-bg fixed-bg" style="background-position: 50% 42%; background-image: url({{ helper.getLinkImage(home['partner_bg'], './assets/frontend/images/education-4.jpg') }})">
    {% if home['partner_title'] %}
    <div class="container pv-20">
        <div class="row justify-content-lg-center">
            <div class="col-lg-8">
                <h2 class="text-center"> <strong>{{ home['partner_title'] }}</strong></h2>
                <div class="separator"></div>
                <p class="large text-center">{{ home['partner_des'] }}</p>
            </div>
        </div>
    </div>
    {% endif %}
    <div class="col-md-12 pv-20">
        <div class="slick-carousel carousel-5">
            {% for partner in partners %}
            <div class="col-lg-3 col-md-6">
                <div class="ph-20 feature-box text-center object-non-visible" data-animation-effect="fadeInDownSmall"
                    data-effect-delay="100">
                    <span class="icon large circle"><img class="rounded-circle" alt="{{partner.title}}" src="{{ helper.getLinkImage(partner.featured_image,'/assets/frontend/images/beauty-1.jpg') }}"></span>
                    <h3>{{partner.title}}</h3>
                </div>
            </div>
            {% endfor %}
        </div>
    </div>
</section>
{% endif %}

<section id="section-5" class="section pt-0 pb-5 stats padding-bottom-clear hovered">
    <div class="container">
        <div class="row justify-content-lg-center">
            <div class="col-lg-8 text-center pv-20">
                {% if home['contact_title'] %}
                <h2 class="text-center">{{ home['contact_title'] }}</h2>
                <div class="separator"></div>
                <p class="large text-center">{{ home['contact_des'] }}</p>
                {% endif %}

                <ul class="list-inline mb-20 text-center">
                    <li class="list-inline-item"><i class="text-default fa fa-map-marker pr-1"></i>{{ dept_lang.address }}</li>
                    <li class="list-inline-item"><a href="tel: {{ dept.phone }}" class="link-dark"><i class="text-default fa fa-phone pl-10 pr-1"></i>{{ dept.phone }}</a></li>
                    <li class="list-inline-item"><a href="mailto: {{ dept.email }}" class="link-dark"><i class="text-default fa fa-envelope-o pl-10 pr-1"></i>{{ dept.email }}</a></li>
                </ul>
                <div class="separator"></div>
                <ul class="social-links circle animated-effect-1 margin-clear text-center space-bottom">
                    {%for social in socials%}
                    <li class="{{ social.name }}"><a href="{{ social.link }}"><i class="fa {{ social.icon }}"></i></a></li>
                    {%endfor%}
                </ul>
            </div>
        </div>
    </div>
</section>