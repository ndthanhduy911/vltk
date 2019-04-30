<!-- Sidebar menu-->
<div class="app-sidebar__overlay" data-toggle="sidebar"></div>
<aside class="app-sidebar">
    <div class="app-sidebar__user"><img class="app-sidebar__user-avatar"
            src="https://s3.amazonaws.com/uifaces/faces/twitter/jsa/48.jpg" alt="User Image">
        <div>
            <p class="app-sidebar__user-name"><?php echo $this->session->get('username') ?></p>
            <p class="app-sidebar__user-designation"><?php echo $this->session->get('name') ?></p>
        </div>
    </div>
    <ul class="app-menu">
        <li><a class="app-menu__item" href="#"><i class="app-menu__icon fa fa-dashboard"></i><span
                    class="app-menu__label">Bảng điều khiển</span></a></li>
        <li class="treeview {% if dispatcher.getControllerName() in ['posts','categories'] %} {{ 'is-expanded' }}
        {% endif %}"><a class="app-menu__item" href="#" data-toggle="treeview"><i
                    class="app-menu__icon fa fa-tags"></i><span class="app-menu__label">Bài viết</span><i
                    class="treeview-indicator fa fa-angle-right"></i></a>
            <ul class="treeview-menu">
                <li><a class="treeview-item {% if dispatcher.getControllerName()=='posts' AND (dispatcher.getActionName() in ['index','edit']) %} {{ 'actived' }} {% endif %}" href="{{ config.application.backendUri }}/posts"><i
                            class="icon fa fa-circle-o"></i>
                        Tất cả</a></li>
                <li><a class="treeview-item {% if dispatcher.getControllerName()=='posts' AND (dispatcher.getActionName() in ['add']) %} {{ 'actived' }} {% endif %}" href="{{ config.application.backendUri }}/posts/add"><i
                        class="icon fa fa-circle-o"></i>
                        Bài viết mới</a></li>
                <li><a class="treeview-item {% if dispatcher.getControllerName()=='categories' AND (dispatcher.getActionName() in ['index','add','edit']) %} {{ 'actived' }} {% endif %}" href="{{ config.application.backendUri }}/categories" target="_blank"
                        rel="noopener"><i class="icon fa fa-circle-o"></i> Danh mục</a></li>
                <li><a class="treeview-item" href="{{ config.application.backendUri }}/tag"><i
                            class="icon fa fa-circle-o"></i> Thẻ</a></li>
            </ul>
        </li>
        <li class="treeview {% if dispatcher.getControllerName() in ['pages'] %} {{ 'is-expanded' }}{% endif %}"><a class="app-menu__item" href="#" data-toggle="treeview"><i
                    class="app-menu__icon fa fa-file-text"></i><span class="app-menu__label">Trang</span><i
                    class="treeview-indicator fa fa-angle-right"></i></a>
            <ul class="treeview-menu">
                <li><a class="treeview-item {% if dispatcher.getControllerName()=='pages' AND (dispatcher.getActionName() in ['index','edit']) %} {{ 'actived' }} {% endif %}" href="{{ config.application.backendUri }}/pages"><i class="icon fa fa-circle-o"></i> Danh sách</a></li>
                <li><a class="treeview-item {% if dispatcher.getControllerName()=='pages' AND (dispatcher.getActionName() in ['add']) %} {{ 'actived' }} {% endif %}" href="{{ config.application.backendUri }}/pages/add"><i class="icon fa fa-circle-o"></i> Trang mới</a></li>
            </ul>
        </li>
        <li class="treeview"><a class="app-menu__item" href="#" data-toggle="treeview"><i
                    class="app-menu__icon fa fa-clone"></i><span class="app-menu__label">Giao diện</span><i
                    class="treeview-indicator fa fa-angle-right"></i></a>
            <ul class="treeview-menu">
                <li><a class="treeview-item" href="bootstrap-components.html"><i class="icon fa fa-circle-o"></i>Đầu
                        trang</a></li>
                <li><a class="treeview-item" href="https://fontawesome.com/v4.7.0/icons/" target="_blank"
                        rel="noopener"><i class="icon fa fa-circle-o"></i> Cuối trang</a></li>
            </ul>
        </li>
        <li><a class="app-menu__item" href="{{ config.application.backendUri }}/media"><i class="app-menu__icon fa fa-laptop"></i><span
                    class="app-menu__label">Thư
                    viện</span></a></li>
        <li class="treeview {% if dispatcher.getControllerName() in ['users','roles'] %} {{ 'is-expanded' }}
                {% endif %}">
            <a class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-users"></i><span
                    class="app-menu__label">Tài khoản</span><i class="treeview-indicator fa fa-angle-right"></i></a>
            <ul class="treeview-menu">
                <li><a class="treeview-item {% if dispatcher.getControllerName()=='users' AND (dispatcher.getActionName() in ['index','edit']) %} {{ 'actived' }} {% endif %}"
                        href="<?php echo BACKEND_URL.'/users' ?>"><i class="icon fa fa-circle-o"></i> Danh sách</a></li>
                <li><a class="treeview-item {% if dispatcher.getControllerName()=='users' AND (dispatcher.getActionName() in ['update']) %} {{ 'actived' }} {% endif %}"
                        href="<?php echo BACKEND_URL.'/users/update' ?>"><i class="icon fa fa-circle-o"></i> Thêm mới</a></li>
            </ul>
        </li>
        <li class="treeview"><a class="app-menu__item" href="#" data-toggle="treeview"><i
                    class="app-menu__icon fa fa-cogs"></i><span class="app-menu__label">Hệ thống</span><i
                    class="treeview-indicator fa fa-angle-right"></i></a>
            <ul class="treeview-menu">
                <li><a class="treeview-item" href="form-components.html"><i class="icon fa fa-circle-o"></i> Ngôn
                        ngữ</a></li>
                <li><a class="treeview-item" href="form-components.html"><i class="icon fa fa-circle-o"></i> Sao lưu dữ
                        liệu</a></li>
            </ul>
        </li>
    </ul>
</aside>