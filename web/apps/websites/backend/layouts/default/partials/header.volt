<nav class="main-header navbar navbar-expand navbar-white text-sm">
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link" data-widget="pushmenu" href="#"><i class="fas fa-bars"></i></a>
        </li>
        {#
        <li class="nav-item d-none d-sm-inline-block">
            <a href="<?= WEB_ADMIN_URL ?>/help/about" class="nav-link {% if dispatcher.getControllerName()=='help' AND dispatcher.getActionName()=='about'  %} {{ 'active' }} {% endif %}">Giới thiệu</a>
        </li>
        <li class="nav-item d-none d-sm-inline-block">
            <a href="<?= WEB_ADMIN_URL ?>/help/contact" class="nav-link {% if dispatcher.getControllerName()=='help' AND dispatcher.getActionName()=='contact'  %} {{ 'active' }} {% endif %}">Liên hệ</a>
        </li>
        #}
    </ul>

    <ul class="navbar-nav ml-auto">
        <li class="nav-item dropdown">
            <a class="nav-link pt-0 pb-0" data-toggle="dropdown" href="#">
                <?php $avatar = $this->session->get('avatar'); ?>
                <img class="border rounded-circle mr-2 header-avatar" width="30px" height="30px"
                    src="<?= $avatar ? '/uploads/avatar/'.$avatar : '/img/avatar.png' ?>"
                    alt="{{ session.get('fullname') }}" /><span>Xin chào, {{ session.get('fullname') }}</span>
                <i class="fas fa-caret-down"></i>
            </a>
            <div class="dropdown-menu dropdown-menu-right">
                <a href="<?= WEB_ADMIN_URL ?>/user/profile" class="dropdown-item">
                    <i class="fas fa-user mr-2"></i> Thông tin cá nhân
                </a>
                <div class="dropdown-divider"></div>
                <a href="#" class="dropdown-item">
                    <i class="fa fa-bell mr-2"></i> Thông báo từ hệ thống
                </a>
                <div class="dropdown-divider"></div>
                <a href="<?= WEB_URL ?>/account/logout" class="dropdown-item">
                    <i class="fa fa-power-off mr-2"></i> Đăng xuất
                </a>
            </div>
        </li>
    </ul>
</nav>