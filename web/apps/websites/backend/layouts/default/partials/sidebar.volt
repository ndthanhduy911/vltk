<!-- Sidebar menu-->
<div class="app-sidebar__overlay" data-toggle="sidebar"></div>
<aside class="app-sidebar">
        <div class="app-sidebar__user"><img class="app-sidebar__user-avatar" src="https://s3.amazonaws.com/uifaces/faces/twitter/jsa/48.jpg" alt="User Image">
                <div><p class="app-sidebar__user-name"><?php echo $this->session->get('username') ?></p><p class="app-sidebar__user-designation"><?php echo $this->session->get('name') ?></p></div>
        </div>
        <ul class="app-menu">
                <li><a class="app-menu__item" href="#"><i class="app-menu__icon fa fa-dashboard"></i><span class="app-menu__label">Bảng điều khiển</span></a></li>
                <li class="treeview {% if dispatcher.getControllerName() in ['posts','categories'] %} {{ 'is-expanded' }}{% endif %}">
                        <a class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-tags"></i><span class="app-menu__label">Bài viết</span><i class="treeview-indicator fa fa-angle-right"></i></a>
                        <ul class="treeview-menu">
                                <li><a class="treeview-item {% if dispatcher.getControllerName()=='posts' AND (dispatcher.getActionName() in ['index','edit']) %} {{ 'actived' }} {% endif %}" href="{{ config.application.backendUri }}/posts"><i class="icon fa fa-circle-o"></i>Tất cả</a></li>
                                <li><a class="treeview-item {% if dispatcher.getControllerName()=='posts' AND (dispatcher.getActionName() in ['update']) %} {{ 'actived' }} {% endif %}" href="{{ config.application.backendUri }}/posts/update"><i class="icon fa fa-circle-o"></i>Bài viết mới</a></li>
                                <li><a class="treeview-item {% if dispatcher.getControllerName()=='categories' %} {{ 'actived' }} {% endif %}" href="{{ config.application.backendUri }}/categories"><i class="icon fa fa-circle-o"></i> Danh mục</a></li>
                                <!-- <li><a class="treeview-item" href="{{ config.application.backendUri }}/tag"><i class="icon fa fa-circle-o"></i> Thẻ</a></li> -->
                        </ul>
                </li>
                <li><a class="app-menu__item {% if dispatcher.getControllerName()=='pages' %} {{ 'active' }} {% endif %}" href="{{ config.application.backendUri }}/pages"><i class="app-menu__icon fa fa-file-text"></i><span class="app-menu__label">Trang</span></a></li>
                <li><a class="app-menu__item {% if dispatcher.getControllerName()=='banner' %} {{ 'active' }} {% endif %}" href="{{ config.application.backendUri }}/banner"><i class="app-menu__icon fa fa-image"></i><span class="app-menu__label">Banners</span></a></li>
                <li><a class="app-menu__item {% if dispatcher.getControllerName()=='staff' %} {{ 'active' }} {% endif %}" href="{{ config.application.backendUri }}/staff"><i class="app-menu__icon fa fa-users"></i><span class="app-menu__label">Nhân sự</span></a></li>
                <li><a class="app-menu__item {% if dispatcher.getControllerName()=='partner' %} {{ 'active' }} {% endif %}" href="{{ config.application.backendUri }}/partner"><i class="app-menu__icon fa fa-link"></i><span class="app-menu__label">Đối tác</span></a></li>
                <li><a class="app-menu__item {% if dispatcher.getControllerName()=='home' %} {{ 'active' }} {% endif %}" href="{{ config.application.backendUri }}/home"><i class="app-menu__icon fa fa-home"></i><span class="app-menu__label">Trang chủ</span></a></li>
                <li class="treeview {% if dispatcher.getControllerName() in ['menus'] %} {{ 'is-expanded' }}{% endif %}">
                        <a class="app-menu__item" href="#" data-toggle="treeview">
                                <i class="app-menu__icon fa fa-link"></i><span class="app-menu__label">Menu</span><i class="treeview-indicator fa fa-angle-right"></i>
                        </a>
                        <ul class="treeview-menu">
                                <li><a class="treeview-item {% if dispatcher.getControllerName()=='menus' AND (dispatcher.getActionName() in ['index']) %} {{ 'actived' }} {% endif %}" href="{{ config.application.backendUri }}/menu"><i class="icon fa fa-circle-o"></i>Danh sách menu</a></li>
                                <li><a class="treeview-item {% if dispatcher.getControllerName()=='menus' AND (dispatcher.getActionName() in ['location']) %} {{ 'actived' }} {% endif %}" href="{{ config.application.backendUri }}/menu/location"><i class="icon fa fa-circle-o"></i>Vị trí menu</a></li>
                        </ul>
                </li>
                <!-- <li><a class="app-menu__item" href="{{ config.application.backendUri }}/media"><i class="app-menu__icon fa fa-laptop"></i><span class="app-menu__label">Thư viện</span></a></li> -->
                <li class="treeview {% if dispatcher.getControllerName() in ['users','roles'] %} {{ 'is-expanded' }}{% endif %}">
                <a class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-users"></i><span class="app-menu__label">Tài khoản</span><i class="treeview-indicator fa fa-angle-right"></i></a>
                <ul class="treeview-menu">
                        <li><a class="treeview-item {% if dispatcher.getControllerName()=='users' AND (dispatcher.getActionName() in ['index','edit']) %} {{ 'actived' }} {% endif %}" href="<?php echo BACKEND_URL.'/users' ?>"><i class="icon fa fa-circle-o"></i> Danh sách</a></li>
                        <li><a class="treeview-item {% if dispatcher.getControllerName()=='users' AND (dispatcher.getActionName() in ['update']) %} {{ 'actived' }} {% endif %}" href="<?php echo BACKEND_URL.'/users/update' ?>"><i class="icon fa fa-circle-o"></i> Thêm mới</a></li>
                </ul>
                </li>
                <li class="treeview"><a class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-cogs"></i><span class="app-menu__label">Hệ thống</span><i class="treeview-indicator fa fa-angle-right"></i></a>
                        <ul class="treeview-menu">
                                <li><a class="treeview-item" href="form-components.html"><i class="icon fa fa-circle-o"></i> Ngôn ngữ</a></li>
                                <li><a class="treeview-item" href="form-components.html"><i class="icon fa fa-circle-o"></i> Sao lưu dữ liệu</a></li>
                        </ul>
                </li>
        </ul>
</aside>