<header class="app-header pr-3"><a class="app-header__logo" href="<?php echo BACKEND_URL; ?>">{{ dept.code }} </a>
    <!-- Sidebar toggle button--><a class="app-sidebar__toggle" href="#" data-toggle="sidebar" aria-label="Hide Sidebar"></a>
    <ul class="app-nav d-flex align-items-center">
        <!-- User Menu-->
        <li class="dropdown"><a class="app-nav__item p-0" href="#" data-toggle="dropdown" aria-label="">{{session.get('name')}} <img style="width: 30px;" class="ml-1 rounded-circle" src="{{session.get('avatar') ? session.get('avatar') : '/logo.png'}}" alt="{{session.get('name')}}"></a>
            <ul class="dropdown-menu settings-menu dropdown-menu-right">
                <!-- <li><a class="dropdown-item" href="<?php echo BACKEND_URL; ?>"><i class="fa fa-cog fa-lg"></i> Cài đặt</a></li> -->
                <li><a class="dropdown-item" href="<?php echo BACKEND_URL; ?>/profile"><i class="fa fa-user fa-lg"></i> Cá nhân</a></li>
                <li><a class="dropdown-item" href="<?php echo BACKEND_URL; ?>/account/logout"><i class="fa fa-sign-out fa-lg"></i> Đăng xuất</a></li>
            </ul>
        </li>

    </ul>
</header>