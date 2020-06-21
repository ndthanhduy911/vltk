<!-- header-container end -->
<!-- breadcrumb start -->
<!-- ================ -->
<div class="breadcrumb-container">
    <div class="container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><i class="fa fa-home pr-2"></i><a class="link-dark" href="<?= FRONTEND_URL ?>/{{ dept.id != 1? dept.slug : '' }}">Trang chủ</a></li>
            <li class="breadcrumb-item active"><?= isset($title) ? $title : 'Mặc định' ?></li>
        </ol>
    </div>
</div>
<!-- breadcrumb end -->