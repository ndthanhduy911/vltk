<?php 
use Models\Menus;
$menuParents = Menus::find(["status = 1 AND dept_id = $dept_id AND menu_location_id = 2 AND parent_id is NULL",'order' => 'sort ASC','limit' => 3]);
?>

<footer id="footer" class="clearfix">
    <div class="footer">
        <div class="container">
            <div class="footer-inner">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="footer-content">
                            <div class="media-wrap">
                                <a href="<?php echo FRONTEND_URL ?>/">
                                    {% if dept.logo %}
                                    <img src="{{ helper.getLinkImage(dept.logo) }}" alt="{{ dept_lang.name }}">
                                    {% else %}
                                    <h3 class="title logo-font text-default text-center">{{dept_lang.name}}</h3>
                                    {% endif %}
                                </a>
                            </div>
                        </div>
                    </div>
                    {%for menu in menuParents%}
                    <div class="col-lg-3">
                        <div class="footer-content">
                            <h4 class="title text-default">{% if menu.icon %}<i class="fa {{ menu.icon }} pr-10"></i> {% endif %} <?= Menus::getName($menu->id, $lang_id) ?></h4>
                            <?php $menuChild = Menus::find(['parent_id = :parent_id:','bind' => ['parent_id' => $menu->id]]); ?>
                            {% if menuChild.count() %}
                            <nav class="mb-20">
                                <ul class="nav flex-column list-style-icons">
                                    {% for child in menuChild %}
                                    <li class="nav-item"><a class="nav-link" href="<?= Menus::getLink($child) ?>"><i class="fa fa-chevron-circle-right"></i><?= Menus::getName($child->id, $lang_id) ?></a></li>
                                    {% endfor %}
                                    <!-- <li class="nav-item"><a class="nav-link" href="components-buttons.html"><i
                                                class="fa fa-chevron-circle-right"></i>
                                            Fanpage</a></li>
                                    <li class="nav-item"><a class="nav-link" href="components-buttons.html"><i
                                                class="fa fa-chevron-circle-right"></i>
                                            Liên hệ</a></li> -->
                                </ul>
                            </nav>
                            {% endif %}
                        </div>
                    </div>
                    {%endfor%}
                    <!-- <div class="col-lg-3">
                        <div class="footer-content">
                            <h4 class="title text-default"><i class="fa fa-child pr-10"></i> {{ ml._ml_system('student',"Sinh viên") }}</h4>
                            <nav class="mb-20">
                                <ul class="nav flex-column list-style-icons">
                                    <li class="nav-item"><a class="nav-link" href="components-buttons.html"><i
                                                class="fa fa-chevron-circle-right"></i>
                                            Cựu sinh viên</a></li>
                                    <li class="nav-item"><a class="nav-link" href="components-tabs-and-pills.html"><i
                                                class="fa fa-chevron-circle-right"></i>
                                            Hình ảnh hoạt động</a></li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="footer-content">
                            <h4 class="title text-default"><i class="fa fa-institution pr-10"></i> {{ ml._ml_system('school',"Đại học") }}</h4>
                            <nav class="mb-20">
                                <ul class="nav flex-column list-style-icons">
                                    <li class="nav-item"><a class="nav-link" href="components-buttons.html"><i
                                                class="fa fa-chevron-circle-right"></i>
                                            trường đại học Khoa Học Tự Nhiên</a></li>
                                    <li class="nav-item"><a class="nav-link" href="components-social-icons.html"><i
                                                class="fa fa-chevron-circle-right"></i>
                                            Portal</a></li>

                                </ul>
                            </nav>

                        </div>
                    </div> -->
                </div>
            </div>
        </div>
    </div>
    <div class="subfooter default-bg">
        <div class="container">
            <div class="subfooter-inner">
                <div class="row">
                    <div class="col-12">
                        <p class="text-center"><span class="logo-font pr-10">VL-VLKT</span> Copyright © 2018 VL-VLKT.
                            All Rights Reserved</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>