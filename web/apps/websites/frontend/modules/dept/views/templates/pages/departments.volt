<?php

    if((int)$dept->id === 1){
        $depts = $this->modelsManager->createBuilder()
        ->columns(array(
            'd.id',
            'd.slug',
            'd.image',
            'dl.title',
        ))
        ->from(['d'=>'Depts'])
        ->leftJoin('DeptsLang', 'dl.deptid = d.id','dl')
        ->where('dl.langid = :langid: AND d.status = 1 AND d.id != 1',['langid' => $langid])
        ->getQuery()
        ->execute();
    }else{
        $researches = $this->modelsManager->createBuilder()
        ->columns(array(
            'r.id',
            'r.slug',
            'r.image',
            'rl.title',
        ))
        ->from(['r'=>'Researches'])
        ->where("r.deptid = $dept->id AND r.status = 1 AND r.deleted = 0")
        ->leftJoin('ResearchesLang', "rl.researchid = r.id AND rl.langid = $langid",'rl')
        ->getQuery()
        ->execute();
    }

?>
<div class="banner dark-translucent-bg fixed-bg"style="background-image:url('{{helper.getLinkImage(page.background_image, '/assets/frontend/images/page-about-banner-1.jpg') }}'); background-position: 50% 27%;">
    {{ partial('breadcrumb') }}
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
                <?php if(!empty($depts)): ?>
                {% for dept_item in depts %}
                <div class="col-lg-6 col-md-6 isotope-item">
                    <div class="image-box shadow-2 bordered text-center mb-20">
                        <div class="overlay-container rounded overlay-visible">
                            <img src="{{ helper.getLinkImage(dept_item.image) }}"
                                alt="{{ dept_item.title }}">
                            <a href="{{ constant('WEB_URL')~'/'~dept_item.slug }}" class="overlay-link"><i
                                    class="fa fa-graduation-cap"></i></a>
                            <div class="overlay-bottom hidden-xs">
                                <div class="text">
                                    {{ dept_item.title }}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                {% endfor %}
                <?php endif ?>

                <?php if(!empty($researches)): ?>
                {% for research in researches %}
                <div class="col-lg-3 col-md-6 isotope-item">
                    <div class="image-box shadow-2 bordered text-center mb-20">
                        <div class="overlay-container rounded overlay-visible">
                            <img src="{{ helper.getLinkImage(research.image) }}"
                                alt="{{ dept_item.title }}">
                            <a href="<?php \Researches::getUrl($dept, $research) ?>" class="overlay-link"><i
                                    class="fa fa-graduation-cap"></i></a>
                            <div class="overlay-bottom hidden-xs">
                                <div class="text">
                                    {{ research.title }}
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