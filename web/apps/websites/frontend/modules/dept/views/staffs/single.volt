{{ partial('breadcrumb') }}

<section class="main-container">
    <div class="container">
        <div class="row">
            <div class="main col-12">
                <h1 class="page-title">{{itemslang.title}}</h1>
                <div class="separator-2"></div>
                <div class="row">
                    <div class="col-md-4">
                        <div class="image-box team-member shadow mb-20">
                            <div class="overlay-container overlay-visible">
                                <img width="100%" src="{{ helper.getLinkImage(items.image, '/img/default3.jpg') }}" alt="{{itemslang.title}}">
                                <div class="overlay-bottom">
                                <div class="text">
                                    {% if items.regency %}
                                    <p class="margin-clear text-uppercase"><?= \Staffs::getDean($items->regency) ?></p>
                                    {% endif %}
                                    <p class="margin-clear text-uppercase"><?= \Staffs::getPosition($items->deptposition) ?></p>
                                </div>
                                </div>
                            </div>
                        </div>
                        <h3 class="title">{{ ml._ml('department', 'Bộ môn') }}</h3>
                        <?php $depts = \Depts::findFirstId($items->deptid); ?>
                        <a href="<?= WEB_URL ?><?= $depts->id != 1 ? "/{$depts->slug}" : "" ?>" class="text-info"><?= \Depts::getTitleById($items->deptid) ?></a>

                        <h3 class="title mt-3">{{ ml._ml('contact', 'Liên hệ') }}</h3>
                        <ul class="list-icons">
                            <li><a href="mailto:{{ items.email }}" class="text-info"><i class="fa fa-envelope-o pr-10"></i>{{ items.email }}</a></li>
                        </ul>
                    </div>
                    <div class="col-md-8">
                        {{itemslang.content}}
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>