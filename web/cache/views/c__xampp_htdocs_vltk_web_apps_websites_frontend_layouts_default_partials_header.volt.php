<?php 
    use Models\Link;
    use Models\MenuLocation;
    use Models\Social;
    use Models\Menus;


    $socials = Social::find(["status = 1 AND dept_id = $dept_id AND location = 1", "order" => "sort ASC"]);
    $links = Link::find(["status = 1 AND dept_id = $dept_id AND location = 1", "order" => "sort ASC"]);
    $menuParents = [];
    if($menuLocation = MenuLocation::findFirst(["status =  1 AND dept_id = $dept_id AND type = 1"])) {
        $menuParents = Menus::find(["status = 1 AND dept_id = $dept_id AND menu_location_id = {$menuLocation->id} AND parent_id is NULL",'order' => 'sort ASC']);
    }
?>
<div class="header-container">
    <?php if ($socials->count() || $links->count()) { ?>
    <div class="header-top colored">
        <div class="container">
            <div class="row">
                <div class="col-2 col-md-5">
                    <div class="header-top-first clearfix">
                        <ul class="social-links circle small clearfix hidden-sm-down">
                            <?php foreach ($socials as $social) { ?>
                            <li class="<?= $social->name ?>"><a href="<?= $social->link ?>"><i class="fa <?= $social->icon ?>"></i></a></li>
                            <?php } ?>
                        </ul>
                        <div class="social-links hidden-md-up circle small">
                            <div class="btn-group dropdown">
                                <button id="header-top-drop-1" type="button" class="btn dropdown-toggle dropdown-toggle--no-caret" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-share-alt"></i></button>
                                <ul class="dropdown-menu dropdown-animation" aria-labelledby="header-top-drop-1">
                                    <?php foreach ($socials as $social) { ?>
                                    <li class="<?= $social->name ?>"><a href="<?= $social->link ?>"><i class="fa <?= $social->icon ?>"></i></a></li>
                                    <?php } ?>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-10 col-md-7 pr-md-0">
                    <div id="header-top-second" class="clearfix text-right">
                        <nav>
                            <ul class="list-inline">
                                <?php foreach ($links as $link) { ?>
                                    <li class="list-inline-item">
                                        <?php if ($link->link) { ?>
                                        <a class="link-light mr-1 " href="<?= $link->link ?>">
                                        <?php } ?>

                                        <?php if ($link->icon) { ?>
                                        <i class="fa <?= $link->icon ?> pr-1"></i>
                                        <?php } ?>

                                        <?= Link::getName($link->id, $lang_id) ?>

                                        <?php if ($link->link) { ?>
                                        </a>
                                        <?php } ?>
                                    </li>
                                <?php } ?>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <?php } ?>
    <header class="header fixed fixed-desktop clearfix">
        <div class="container">
            <div class="d-flex">
                <div class="col-md-auto hidden-md-down pl-md-0">
                    <div class="header-first clearfix">
                        <div id="logo" class="logo">
                            <a href="<?php echo FRONTEND_URL ?>/">
                                <?php if ($dept->logo) { ?>
                                <img src="<?= $this->helper->getLinkImage($dept->logo) ?>" alt="<?= $dept_lang->name ?>">
                                <?php } else { ?>
                                <h3 class="title text-default mb-0"><?= $dept->code ?></h3>
                                <?php } ?>
                            </a>
                        </div>
                        <div class="site-slogan logo-font">
                            <?= $dept_lang->name ?>
                        </div>
                    </div>
                </div>
                <div class="ml-lg-auto col-xs-12 p-0">
                    <div class="header-second clearfix">
                        <div class="main-navigation main-navigation--mega-menu  animated">
                            <nav class="navbar navbar-expand-lg navbar-light p-0 d-flex">
                                <div class="navbar-brand clearfix hidden-lg-up">
                                    <div id="logo-mobile" class="logo">
                                        <a href="<?php echo FRONTEND_URL ?>/">
                                            <?php if ($dept->logo) { ?>
                                            <img id="logo-img-mobile" src="<?= FRONTEND_URL ?>{ helper.getLinkImage(dept.logo,'/assets/frontend/images/logo-khoa-single-1-96x96.png') }}" alt="<?= $dept_lang->name ?>">
                                            <?php } else { ?>
                                            <h3 class="title text-default mb-0"><?= $dept->code ?></h3>
                                            <?php } ?>
                                        </a>
                                        
                                    </div>
                                    <div class="site-slogan logo-font">
                                        <?= $dept_lang->name ?>
                                    </div>

                                </div>

                                <button class="ml-auto navbar-toggler" type="button" data-toggle="collapse"
                                    data-target="#navbar-collapse-1" aria-controls="navbar-collapse-1"
                                    aria-expanded="false" aria-label="Toggle navigation">
                                    <span class="navbar-toggler-icon"></span>
                                </button>

                                <div class="collapse navbar-collapse" id="navbar-collapse-1">
                                    <ul class="navbar-nav ml-xl-auto">
                                        <?php foreach ($menuParents as $menu) { ?>
                                        <?php $menuChild = Menus::find(['parent_id = :parent_id:','bind' => ['parent_id' => $menu->id]]); ?>
                                        <li class="nav-item dropdown">
                                            <a href="<?= Menus::getLink($menu) ?>" class="nav-link <?= $menuChild->count() ? 'dropdown-toggle' : '' ?>" <?= $menuChild->count() ? 'data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"' : '' ?>><?= Menus::getName($menu->id, $lang_id) ?></a>
                                            <?php if($menuChild->count()){ ?>
                                                <ul class="dropdown-menu">
                                                <?php foreach ($menuChild as $child) { ?>
                                                    <li><a href="<?= Menus::getLink($child) ?>" class=""><?= Menus::getName($child->id, $lang_id) ?></a></li>
                                                <?php } ?>
                                                </ul>
                                            <?php } ?>
                                        </li>
                                        <?php } ?>
                                    </ul>
                                </div>
                            </nav>
                        </div>
                    </div>
                </div>
                <div class="col-auto hidden-md-down p-0">
                    <div class="header-dropdown-buttons" id="lang_id" data-lang="<?= $lang_id ?>">
                        <a href="<?= FRONTEND_URL ?>/api/changelanguage/<?= ($lang_id == 1 ? 2 : 1) ?>" data-id="<?= ($lang_id == 1 ? 2 : 1) ?>" class="d-flex align-items-center">
                            <img src="<?= FRONTEND_URL ?><?= $language->path ?>/<?= $language->icon ?>" class="user-image" alt="<?= $language->name ?>" width="36px">
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </header>
</div>