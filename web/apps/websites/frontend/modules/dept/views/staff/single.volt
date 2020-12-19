{{ partial('breadcrumb') }}

<section class="main-container">
    <div class="container">
        <div class="row">
            <div class="main col-12">
                <h1 class="page-title">{{staff_lang.title}}</h1>
                <div class="separator-2"></div>
                <div class="row">
                    <div class="col-md-4">
                        <div class="image-box team-member shadow mb-20">
                            <div class="overlay-container overlay-visible">
                                <img width="100%" src="{{ helper.getLinkImage(staff.image, '/assets/frontend/images/teams.jpg') }}" alt="{{staff_lang.title}}">
                                <a href="{{ helper.getLinkImage(staff.image, '/assets/frontend/images/teams.jpg') }}" class="popup-img overlay-link" title="{{staff_lang.title}}"><i class="fa fa-plus"></i></a>
                                <div class="overlay-bottom">
                                <div class="text">
                                    {% if staff.dean %}
                                    <p class="margin-clear text-uppercase"><?= \Staffs::getDean($staff->dean) ?></p>
                                    {% endif %}
                                    <p class="margin-clear text-uppercase"><?= \Staffs::getPosition($staff->deptposition) ?></p>
                                </div>
                                </div>
                            </div>
                        </div>
                        <h3 class="title">{{ ml._ml_system('department', 'Đơn vị') }}</h3>
                        <a href="<?= WEB_URL ?>/{{ dept_info.slug }}" class="text-info">{{ dept_lang_info.name }}</a>

                        <h3 class="title mt-3">{{ ml._ml_system('contact', 'Liên hệ') }}</h3>
                        <ul class="list-icons">
                            <li><a href="mailto:{{ staff.email }}" class="text-info"><i class="fa fa-envelope-o pr-10"></i>{{ staff.email }}</a></li>
                        </ul>
                    </div>
                    <div class="col-md-8">
                        {{staff_lang.content}}
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>