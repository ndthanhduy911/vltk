<?php
    $gmajors = $this->modelsManager->createBuilder()
    ->columns(array(
        'r.id',
        'r.slug',
        'r.image',
        'rl.title',
    ))
    ->from(['r'=>'Gmajors'])
    ->where("r.deptid = {$dept->id} AND r.status = 1 AND r.deleted = 0")
    ->leftJoin('GmajorsLang', "rl.gmajorid = r.id AND rl.langid = {$langid}",'rl')
    ->getQuery()
    ->execute();
?>
{{ partial('breadcrumb') }}
<div class="banner dark-translucent-bg fixed-bg"style="background-image:url('{{helper.getLinkImage(page.bgimage, '/assets/frontend/images/banner-page.jpg') }}'); background-position: 50% 27%;">
    <div class="container">
        <div class="row justify-content-lg-center">
            <div class="col-lg-8 text-center pv-20">
                <h2 class="title"><span class="text-white text-uppercase">{{ pageslang.title }}</span></h2>
                {% if pageslang.excerpt %}
                <div class="separator mt-10">
                </div>
                <p class="text-center">{{ pageslang.excerpt }}</p>
                {% endif %}
            </div>
        </div>
    </div>
</div>

<section class="main-container pt-5">
    <div class="container">
        <div class="row">
            <div class="main col-md-9 row">
                <?php if(!empty($gmajors)): ?>
                {% for gmajor in gmajors %}
                <div class="col-lg-3 col-md-6 isotope-item">
                    <div class="image-box shadow-2 bordered text-center mb-20">
                        <div class="overlay-container rounded overlay-visible">
                            <img src="{{ helper.getLinkImage(gmajor.image) }}"
                                alt="{{ dept_item.title }}">
                            <a href="<?= \Gmajors::getUrl($dept, $gmajor) ?>" class="overlay-link"><i
                                    class="fa fa-graduation-cap"></i></a>
                            <div class="overlay-bottom hidden-xs">
                                <div class="text">
                                    {{ gmajor.title }}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                {% endfor %}
                <?php endif ?>
            </div>

            <div class="col-md-3">
                {{ partial('sidebar') }}
            </div>
        </div>
    </div>
</section>