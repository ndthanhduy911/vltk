<?php 
    use Models\Link;
    use Models\MenuLocation;
    use Models\Social;
    use Models\Menus;


    $socials = Social::find(["status = 1 AND dept_id = $dept->id", "order" => "sort ASC"]);
    $links = Link::find(["status = 1 AND dept_id = $dept->id", "order" => "sort ASC"]);
    $menuParents = [];
    if($menuLocation = MenuLocation::findFirst(["status =  1 AND dept_id = $dept->id AND type = 1"])) {
        $menuParents = Menus::find(["status = 1 AND dept_id = $dept->id AND menu_location_id = {$menuLocation->id} AND parent_id is NULL",'order' => 'sort ASC']);
    }
?>
<div class="header-container">
    {% if socials.count() OR links.count() %}
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
                <div class="col-10 col-md-7 pr-md-0">
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
    {% endif %}
    <header class="header fixed fixed-desktop clearfix">
        <div class="container">
            <div class="d-flex">
                <div class="col-md-auto hidden-md-down pl-md-0">
                    <div class="header-first clearfix">
                        <div id="logo" class="logo" dept-id = "{{ dept.id }}">
                            <a href="<?php echo FRONTEND_URL ?>/{{ dept.id != 1 ? dept.slug : ''}}">
                                {% if dept.logo %}
                                <img src="{{ helper.getLinkImage(dept.logo) }}" alt="{{ dept_lang.name }}">
                                {% else %}
                                <h3 class="title text-default mb-0">{{ dept.code }}</h3>
                                {% endif %}
                            </a>
                        </div>
                        {% if !dept.logo %}
                        <div class="site-slogan logo-font">
                            {{dept_lang.name}}
                        </div>
                        {% endif %}
                    </div>
                </div>
                <div class="ml-lg-auto col-xs-12 p-0">
                    <div class="header-second clearfix">
                        <div class="main-navigation main-navigation--mega-menu  animated">
                            <nav class="navbar navbar-expand-lg navbar-light p-0 d-flex">
                                <div class="navbar-brand clearfix hidden-lg-up">
                                    <div id="logo-mobile" class="logo">
                                        <a href="<?php echo FRONTEND_URL ?>/">
                                            {% if dept.logo %}
                                            <img id="logo-img-mobile" src="{{ helper.getLinkImage(dept.logo) }}" alt="{{ dept_lang.name }}">
                                            {% else %}
                                            <h3 class="title text-default mb-0">{{ dept.code }}</h3>
                                            {% endif %}
                                        </a>
                                    </div>
                                    <div class="site-slogan logo-font">
                                        {{dept_lang.name}}
                                    </div>

                                </div>

                                <button class="ml-auto navbar-toggler" type="button" data-toggle="collapse"
                                    data-target="#navbar-collapse-1" aria-controls="navbar-collapse-1"
                                    aria-expanded="false" aria-label="Toggle navigation">
                                    <span class="navbar-toggler-icon"></span>
                                </button>

                                <div class="collapse navbar-collapse" id="navbar-collapse-1">
                                    <ul class="navbar-nav ml-xl-auto">
                                        {%for menu in menuParents%}
                                        <?php $menuChild = Menus::find(['parent_id = :parent_id:','bind' => ['parent_id' => $menu->id]]); ?>
                                        <li class="nav-item dropdown">
                                            <a target="{{ helper.getTarget(menu.target)}}" href="<?= Menus::getLink($menu, $dept->slug) ?>" class="nav-link <?= $menuChild->count() ? 'dropdown-toggle' : '' ?>" <?= $menuChild->count() ? 'data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"' : '' ?>><?= Menus::getName($menu->id, $lang_id) ?></a>
                                            <?php if($menuChild->count()){ ?>
                                                <ul class="dropdown-menu">
                                                {%for child in menuChild%}
                                                    <li><a target="{{ helper.getTarget(child.target)}}" href="<?= Menus::getLink($child, $dept->slug) ?>" class=""><?= Menus::getName($child->id, $lang_id) ?></a></li>
                                                {%endfor%}
                                                </ul>
                                            <?php } ?>
                                        </li>
                                        {%endfor%}
                                    </ul>
                                </div>
                            </nav>
                        </div>
                    </div>
                </div>
                <div class="col-auto hidden-md-down p-0">
                    <div class="header-dropdown-buttons" id="lang_id" data-lang="{{ lang_id }}">
                        <a href="<?= FRONTEND_URL ?>/api/changelanguage/{{ lang_id == 1 ? 2 : 1  }}" data-id="{{ lang_id == 1 ? 2 : 1  }}" class="d-flex align-items-center">
                            <img src="<?= FRONTEND_URL ?>{{language.path}}/{{language.icon}}" class="user-image" alt="{{ language.name }}" width="36px">
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </header>
</div>