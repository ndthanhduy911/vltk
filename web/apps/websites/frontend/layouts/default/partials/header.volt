<?php 
    use Models\Link;
    use Models\Social;
    use Models\Menus;

    $socials = Social::find(['status = 1 AND dept_id = 1 AND location = 1', "order" => "sort ASC"]);
    $links = Link::find(['status = 1 AND dept_id = 1 AND location = 1', "order" => "sort ASC"]);
    $menuParents = Menus::find(['status = 1 AND dept_id = 1 AND menu_location_id = 1 AND parent_id is NULL']);
?>
<div class="header-container">
    <div class="header-top colored">
        <div class="container">
            <div class="row">
                <div class="col-2 col-md-5">
                    <div class="header-top-first clearfix">
                        <ul class="social-links circle small clearfix hidden-sm-down">
                            {%for social in socials%}
                            <li class="{{ social.name }}"><a href="{{ social.link }}"><i class="fa {{ social.icon }}"></i></a></li>
                            {%endfor%}
                        </ul>
                        <div class="social-links hidden-md-up circle small">
                            <div class="btn-group dropdown">
                                <button id="header-top-drop-1" type="button" class="btn dropdown-toggle dropdown-toggle--no-caret" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-share-alt"></i></button>
                                <ul class="dropdown-menu dropdown-animation" aria-labelledby="header-top-drop-1">
                                    {%for social in socials%}
                                    <li class="{{ social.name }}"><a href="{{ social.link }}"><i class="fa {{ social.icon }}"></i></a></li>
                                    {%endfor%}
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-10 col-md-7">
                    <div id="header-top-second" class="clearfix text-right">
                        <nav>
                            <ul class="list-inline">
                                {%for link in links%}
                                    <li class="list-inline-item">
                                        {% if link.link %}
                                        <a class="link-light mr-1 " href="{{ link.link }}">
                                        {% endif %}

                                        {% if link.icon %}
                                        <i class="fa {{ link.icon }} pr-1"></i>
                                        {% endif %}

                                        <?= Link::getName($link->id, $lang_id) ?>

                                        {% if link.link %}
                                        </a>
                                        {% endif %}
                                    </li>
                                {%endfor%}
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <header class="header fixed fixed-desktop clearfix">
        <div class="container">
            <div class="row">
                <div class="col-md-auto hidden-md-down pl-3">
                    <div class="header-first clearfix">
                        <div id="logo" class="logo">
                            <a href="<?php echo FRONTEND_URL ?>/">
                                <h3 class="title text-default mb-0">VL-VLKT</h3>
                            </a>
                        </div>
                        <div class="site-slogan logo-font">
                            Khoa Vật Lý - Vật Lý Kỹ Thuật
                        </div>
                    </div>
                </div>
                <div class="col-lg-8 ml-lg-auto">
                    <div class="header-second clearfix">
                        <div class="main-navigation main-navigation--mega-menu  animated">
                            <nav class="navbar navbar-expand-lg navbar-light p-0">
                                <div class="navbar-brand clearfix hidden-lg-up">
                                    <div id="logo-mobile" class="logo">
                                        <!-- <a href="<?php echo FRONTEND_URL ?>/"><img id="logo-img-mobile"
                                                src="<?php echo FRONTEND_URL ?>/assets/frontend/images/logo-khoa-single-1-96x96.png"
                                                alt="VL-VLKT"></a> -->
                                        <h3 class="title text-default mb-0">VL-VLKT</h3>
                                    </div>
                                    <div class="site-slogan logo-font">
                                        Khoa Vật Lý - Vật Lý Kỹ Thuật
                                    </div>

                                </div>

                                <button class="navbar-toggler" type="button" data-toggle="collapse"
                                    data-target="#navbar-collapse-1" aria-controls="navbar-collapse-1"
                                    aria-expanded="false" aria-label="Toggle navigation">
                                    <span class="navbar-toggler-icon"></span>
                                </button>

                                <div class="collapse navbar-collapse" id="navbar-collapse-1">
                                    <ul class="navbar-nav ml-xl-auto">
                                        {%for menu in menuParents%}
                                        <?php $menuChild = Menus::find(['parent_id = :parent_id:','bind' => ['parent_id' => $menu->id]]); ?>
                                        <li class="nav-item dropdown">
                                            <a href="<?= Menus::getLink($menu) ?>" class="nav-link <?= $menuChild->count() ? 'dropdown-toggle' : '' ?>" <?= $menuChild->count() ? 'data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"' : '' ?>><?= Menus::getName($menu->id, $lang_id) ?></a>
                                            <?php if($menuChild->count()){ ?>
                                                <ul class="dropdown-menu">
                                                {%for child in menuChild%}
                                                    <li><a href="<?= Menus::getLink($child) ?>"><?= Menus::getName($child->id, $lang_id) ?></a></li>
                                                {%endfor%}
                                                </ul>
                                            <?php } ?>
                                            {%endfor%}
                                        </li>
                                    </ul>
                                </div>
                            </nav>
                        </div>
                    </div>
                </div>
                <div class="col-auto hidden-md-down p-0">
                    <div class="header-dropdown-buttons" id="lang_id" data-lang="<?= $lang_id ?>">
                        <a href="#" data-id="1">
                            <img src="<?php echo FRONTEND_URL ?>/language_file/vie/vietnam.png" class="user-image" alt="VIET NAM" width="36px">
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </header>
</div>