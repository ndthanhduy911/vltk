<?php 
use Models\Menus;
use Models\MenuLocation;
$menuParents = [];
if($menuLocation = MenuLocation::findFirst(["status =  1 AND dept_id = $dept_id AND type = 2"])) {
    $menuParents = Menus::find(["status = 1 AND dept_id = $dept_id AND menu_location_id = {$menuLocation->id} AND parent_id is NULL",'order' => 'sort ASC','limit' => 3]);
}
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
                                    <?php if ($dept->logo) { ?>
                                    <img src="<?= $this->helper->getLinkImage($dept->logo) ?>" alt="<?= $dept_lang->name ?>">
                                    <?php } else { ?>
                                    <h3 class="title logo-font text-default text-center"><?= $dept_lang->name ?></h3>
                                    <?php } ?>
                                </a>
                            </div>
                        </div>
                    </div>
                    <?php foreach ($menuParents as $menu) { ?>
                    <div class="col-lg-3">
                        <div class="footer-content">
                            <h4 class="title text-default"><?php if ($menu->icon) { ?><i class="fa <?= $menu->icon ?> pr-10"></i> <?php } ?> <?= Menus::getName($menu->id, $lang_id) ?></h4>
                            <?php $menuChild = Menus::find(['parent_id = :parent_id:','bind' => ['parent_id' => $menu->id]]); ?>
                            <?php if ($menuChild->count()) { ?>
                            <nav class="mb-20">
                                <ul class="nav flex-column list-style-icons">
                                    <?php foreach ($menuChild as $child) { ?>
                                    <li class="nav-item"><a class="nav-link" href="<?= Menus::getLink($child) ?>"><i class="fa fa-chevron-circle-right"></i><?= Menus::getName($child->id, $lang_id) ?></a></li>
                                    <?php } ?>
                                </ul>
                            </nav>
                            <?php } ?>
                        </div>
                    </div>
                    <?php } ?>
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