<?php 
use Models\Menus;
$menuParents = Menus::find(["status = 1 AND dept_id = $dept_id AND menu_location_id = 1 AND parent_id is NULL",'order' => 'sort ASC']);
?>
<div class="header-container">
    <header class="header dark fixed fixed-desktop clearfix">
        <div class="container">
            <div class="row">
                <div class="col-md-auto hidden-md-down pl-3">
                    <div class="header-first clearfix">

                        <!-- logo -->
                        <div id="logo" class="logo">
                            <a href="<?php echo FRONTEND_URL.'/dept/'.$dept->slug ?>">
                                <h3 class="title text-default mb-0">LOGO</h3>
                            </a>
                        </div>

                        <!-- name-and-slogan -->
                        <div class="site-slogan logo-font">
                            {{dept_lang.name}}
                        </div>

                    </div>
                    <!-- header-first end -->

                </div>
                <div class="col-lg-8 ml-lg-auto">

                    <!-- header-second start -->
                    <!-- ================ -->
                    <div class="header-second clearfix">
                        <div class="main-navigation main-navigation--mega-menu  animated">
                            <nav class="navbar navbar-expand-lg navbar-light p-0">
                                <div class="navbar-brand clearfix hidden-lg-up">

                                    <div id="logo-mobile" class="logo">
                                        <h3 class="title text-default mb-0">{{dept.code}}</h3>
                                    </div>

                                    <!-- name-and-slogan -->
                                    <div class="site-slogan logo-font">
                                        {{dept_lang.name}}
                                    </div>

                                </div>

                                <button class="navbar-toggler" type="button" data-toggle="collapse"
                                    data-target="#navbar-collapse-1" aria-controls="navbar-collapse-1"
                                    aria-expanded="false" aria-label="Toggle navigation">
                                    <span class="navbar-toggler-icon"></span>
                                </button>

                                <div class="collapse navbar-collapse" id="navbar-collapse-1">
                                    <!-- main-menu -->
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
                                        </li>
                                        {%endfor%}
                                    </ul>
                                    <!-- main-menu end -->
                                </div>
                            </nav>
                        </div>
                        <!-- main-navigation end -->
                    </div>
                    <!-- header-second end -->

                </div>
                <div class="col-auto hidden-md-down p-0">
                    <div class="header-dropdown-buttons" id="lang_id" data-lang="{{lang_id}}">
                        <a href="<?= FRONTEND_URL ?>/faculty-api/changelanguage/{{ lang_id == 1 ? 2 : 1  }}" data-id="{{ language.id }}">
                            <img src="<?= FRONTEND_URL ?>{{language.path}}/{{language.icon}}" class="user-image" alt="{{ language.name }}" width="36px">
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- header end -->
</div>
<!-- header-container end -->