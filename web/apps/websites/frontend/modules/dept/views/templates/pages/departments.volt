<?php
    use Models\Departments;
    use Models\Researches;

    if((int)$dept->id === 1){
        $npDept = Departments::getNamepace();
        $depts = $this->modelsManager->createBuilder()
        ->columns(array(
            $npDept.'.id',
            $npDept.'.slug',
            $npDept.'.image',
            'DL.name dept_name',
        ))
        ->from($npDept)
        ->leftJoin('Models\DepartmentsLang', 'DL.dept_id = '.$npDept.'.id','DL')
        ->where('DL.lang_id = :lang_id: AND status = 1 AND '.$npDept.'.id != 1',['lang_id' => $lang_id])
        ->getQuery()
        ->execute();
    }else{
        $npResearch = Researches::getNamepace();
        $researches = $this->modelsManager->createBuilder()
        ->columns(array(
            $npResearch.'.id',
            $npResearch.'.slug',
            $npResearch.'.featured_image',
            'SL.title research_name',
        ))
        ->from($npResearch)
        ->where("$npResearch.dept_id = $dept->id AND $npResearch.status = 1 AND $npResearch.deleted = 0")
        ->leftJoin('Models\ResearchesLang', "SL.research_id = $npResearch.id AND SL.lang_id = $lang_id",'SL')
        ->getQuery()
        ->execute();
    }

?>
<div class="banner dark-translucent-bg fixed-bg"style="background-image:url('{{helper.getLinkImage(page.background_image, '/assets/frontend/images/page-about-banner-1.jpg') }}'); background-position: 50% 27%;">
    {{ partial('breadcrumb') }}
    <div class="container">
        <div class="row justify-content-lg-center">
            <div class="col-lg-8 text-center pv-20">
                <h2 class="title object-non-visible" data-animation-effect="fadeIn" data-effect-delay="100"><span class="text-white text-uppercase">{{ page_lang.title }}</span></h2>
                {% if page_lang.excerpt %}
                <div class="separator object-non-visible mt-10" data-animation-effect="fadeIn" data-effect-delay="100">
                </div>
                <p class="text-center object-non-visible" data-animation-effect="fadeIn" data-effect-delay="100">{{ page_lang.excerpt }}</p>
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
                                alt="{{ dept_item.dept_name }}">
                            <a href="{{ constant('FRONTEND_URL')~'/'~dept_item.slug }}" class="overlay-link"><i
                                    class="fa fa-graduation-cap"></i></a>
                            <div class="overlay-bottom hidden-xs">
                                <div class="text">
                                    {{ dept_item.dept_name }}
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
                            <img src="{{ helper.getLinkImage(research.featured_image) }}"
                                alt="{{ dept_item.dept_name }}">
                            <a href="<?php Researches::getUrl($dept, $research) ?>" class="overlay-link"><i
                                    class="fa fa-graduation-cap"></i></a>
                            <div class="overlay-bottom hidden-xs">
                                <div class="text">
                                    {{ research.research_name }}
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