<?php
    $majors = $this->modelsManager->createBuilder()
    ->columns(array(
        'r.id',
        'r.slug',
        'r.image',
        'rl.title',
    ))
    ->from(['r'=>'Majors'])
    ->where("r.deptid = {$dept->id} AND r.status = 1 AND r.deleted = 0")
    ->leftJoin('MajorsLang', "rl.majorid = r.id AND rl.langid = {$langid}",'rl')
    ->getQuery()
    ->execute();
?>
{{ partial('breadcrumb') }}
<div class="banner dark-translucent-bg fixed-bg"style="background-image:url('{{helper.getLinkImage(items.bgimage, '/img/banner-page.jpg') }}'); background-position: 50% 27%;">
    <div class="container">
        <div class="row justify-content-lg-center">
            <div class="col-lg-8 text-center pv-20">
                <h2 class="title"><span class="text-white text-uppercase">{{ itemslang.title }}</span></h2>
                {% if itemslang.excerpt %}
                <div class="separator mt-10">
                </div>
                <p class="text-center">{{ itemslang.excerpt }}</p>
                {% endif %}
            </div>
        </div>
    </div>
</div>

<section class="main-container pt-5">
    <div class="container">
        <div class="row">
            <div class="main col-md-9">
                <div class="row">
                    <?php if(!empty($majors)): ?>
                    {% for major in majors %}
                    <div class="col-md-6 isotope-item">
                        <div class="image-box shadow-2 bordered text-center mb-20">
                            <div class="overlay-container rounded overlay-visible">
                                <img src="{{helper.getLinkImage(major.image, '/img/default2.jpg') }}" alt="{{ dept_item.title }}" class="grow">
                                <div class="overlay-bottom hidden-xs">
                                    <div class="text">
                                        <a href="<?= \Majors::getUrl($dept, $major) ?>" >{{ major.title }}</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    {% endfor %}
                    <?php endif ?>
                </div>
            </div>
            <div class="col-md-3">
                {{ partial('sidebar') }}
            </div>
        </div>
    </div>
</section>