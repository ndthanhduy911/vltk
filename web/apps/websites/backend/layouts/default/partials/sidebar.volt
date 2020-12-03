<aside class="main-sidebar elevation-4 sidebar-light-primary">
    <a href="<?= WEB_ADMIN_URL ?>" class="brand-link">
        <img src="<?= LOGO ?>" alt="<?= DEPT ?>" class="brand-image img-circle elevation-3">
        <span class="brand-text font-weight-bold text-uppercase text-primary">QUẢN TRỊ THÔNG TIN</span>
    </a>

    <div class="sidebar">
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                <li class="nav-item">
                    <a href="<?= WEB_ADMIN_URL ?>"
                        class="nav-link {% if dispatcher.getControllerName()=='index' AND dispatcher.getActionName() == 'index' %} {{ 'active' }} {% endif %}">
                        <i class="nav-icon fas fa-tachometer-alt"></i>
                        <p>Bảng điều khiển</p>
                    </a>
                </li>
                <li
                    class="nav-item has-treeview {% if dispatcher.getControllerName() in ['posts','categories'] %} {{ 'menu-open' }} {% endif %}">
                    <a href="#"
                        class="nav-link {% if dispatcher.getControllerName() in ['posts','categories'] %} {{ 'active' }} {% endif %}">
                        <i class="nav-icon fas fa-newspaper"></i>
                        <p>Bài viết<i class="right fas fa-angle-left"></i></p>
                    </a>
                    <ul class="nav nav-treeview mt-1">
                        {% if master.checkPermission('posts', 'index') %}
                        <li class="nav-item">
                            <a href="<?= WEB_ADMIN_URL ?>/posts"
                                class="nav-link {% if dispatcher.getControllerName()=='posts' AND dispatcher.getActionName()=='index' %} {{ 'active' }} {% endif %}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Tất cả</p>
                            </a>
                        </li>
                        {% endif %}
                        {% if master.checkPermission('posts', 'update') %}
                        <li class="nav-item">
                            <a href="<?= WEB_ADMIN_URL ?>/posts/view"
                                class="nav-link {% if dispatcher.getControllerName()=='posts' AND dispatcher.getActionName()=='view' %} {{ 'active' }} {% endif %}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Bài viết mới</p>
                            </a>
                        </li>
                        {% endif %}
                        {% if master.checkPermission('categories', 'index') %}
                        <li class="nav-item">
                            <a href="<?= WEB_ADMIN_URL ?>/categories"
                                class="nav-link {% if dispatcher.getControllerName()=='categories' %} {{ 'active' }} {% endif %}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Chuyên mục</p>
                            </a>
                        </li>
                        {% endif %}
                        {% if master.checkPermission('posts', 'trashs') %}
                        <li class="nav-item">
                            <a href="<?= WEB_ADMIN_URL ?>/posts/trashs"
                                class="nav-link {% if dispatcher.getControllerName()=='posts' AND dispatcher.getActionName()=='trashs' %} {{ 'active' }} {% endif %}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Thùng rác</p>
                            </a>
                        </li>
                        {% endif %}
                    </ul>
                </li>
                <li class="nav-item">
                    <a href="<?= WEB_ADMIN_URL ?>/pages"
                        class="nav-link {% if dispatcher.getControllerName()=='pages' %} {{ 'active' }} {% endif %}">
                        <i class="nav-icon fas fa-globe"></i>
                        <p>Trang thông tin</p>
                    </a>
                </li>
                <li
                    class="nav-item has-treeview {% if dispatcher.getControllerName() in ['subjects','researches'] %} {{ 'menu-open' }} {% endif %}">
                    <a href="#"
                        class="nav-link {% if dispatcher.getControllerName() in ['subjects','researches'] %} {{ 'active' }} {% endif %}">
                        <i class="nav-icon fas fa-list"></i>
                        <p>
                            Đào tạo
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview mt-1">
                        {% if master.checkPermission('subjects', 'index') %}
                        <li class="nav-item">
                            <a href="<?= WEB_ADMIN_URL ?>/subjects"
                                class="nav-link {% if dispatcher.getControllerName()=='subjects' %} {{ 'active' }} {% endif %}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Môn học</p>
                            </a>
                        </li>
                        {% endif %}
                        {% if master.checkPermission('researches', 'index') %}
                        <li class="nav-item">
                            <a href="<?= WEB_ADMIN_URL ?>/researches"
                                class="nav-link {% if dispatcher.getControllerName()=='researches' %} {{ 'active' }} {% endif %}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Hướng nghiên cứu</p>
                            </a>
                        </li>
                        {% endif %}
                    </ul>
                </li>
                <li class="nav-item">
                    <a href="<?= WEB_ADMIN_URL ?>/slideshows"
                        class="nav-link {% if dispatcher.getControllerName()=='slideshows' %} {{ 'active' }} {% endif %}">
                        <i class="nav-icon fas fa-images"></i>
                        <p>Banners</p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="<?= WEB_ADMIN_URL ?>/staff"
                        class="nav-link {% if dispatcher.getControllerName()=='staff' %} {{ 'active' }} {% endif %}">
                        <i class="nav-icon fas fa-users"></i>
                        <p>Tổ chức Cán bộ</p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="<?= WEB_ADMIN_URL ?>/partner"
                        class="nav-link {% if dispatcher.getControllerName()=='partner' %} {{ 'active' }} {% endif %}">
                        <i class="nav-icon fas fa-handshake"></i>
                        <p>Liên kết/ đối tác</p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="<?= WEB_ADMIN_URL ?>/home"
                        class="nav-link {% if dispatcher.getControllerName()=='home' %} {{ 'active' }} {% endif %}">
                        <i class="nav-icon fas fa-home"></i>
                        <p>Trang chủ</p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="<?= WEB_ADMIN_URL ?>/home"
                        class="nav-link {% if dispatcher.getControllerName()=='home' %} {{ 'active' }} {% endif %}">
                        <i class="nav-icon fas fa-list-alt"></i>
                        <p>Menus</p>
                    </a>
                </li>
                <li
                    class="nav-item has-treeview {% if dispatcher.getControllerName() in ['setting'] %} {{ 'menu-open' }} {% endif %}">
                    <a href="#"
                        class="nav-link {% if dispatcher.getControllerName() in ['setting'] %} {{ 'active' }} {% endif %}">
                        <i class="nav-icon fas fa-cog"></i>
                        <p>
                            Thiết lập chung
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview mt-1">
                        {% if master.checkPermission('setting', 'depts') %}
                        <li class="nav-item">
                            <a href="<?= WEB_ADMIN_URL ?>/setting/depts"
                                class="nav-link {% if dispatcher.getControllerName()=='setting' AND dispatcher.getActionName()=='depts' %} {{ 'active' }} {% endif %}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Thông tin chung</p>
                            </a>
                        </li>
                        {% endif %}
                        {% if master.checkPermission('setting', 'socials') %}
                        <li class="nav-item">
                            <a href="<?= WEB_ADMIN_URL ?>/setting/socials"
                                class="nav-link {% if dispatcher.getControllerName()=='setting' AND dispatcher.getActionName()=='socials' %} {{ 'active' }} {% endif %}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Biểu tượng</p>
                            </a>
                        </li>
                        {% endif %}
                        {% if master.checkPermission('setting', 'links') %}
                        <li class="nav-item">
                            <a href="<?= WEB_ADMIN_URL ?>/setting/links"
                                class="nav-link {% if dispatcher.getControllerName()=='setting' AND dispatcher.getActionName()=='links' %} {{ 'active' }} {% endif %}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Links</p>
                            </a>
                        </li>
                        {% endif %}
                    </ul>
                </li>
                <li
                    class="nav-item has-treeview {% if dispatcher.getControllerName() in ['user','role', 'setting'] %} {{ 'menu-open' }} {% endif %}">
                    <a href="#"
                        class="nav-link {% if dispatcher.getControllerName() in ['user','role', 'setting'] %} {{ 'active' }} {% endif %}">
                        <i class="nav-icon fas fa-cogs"></i>
                        <p>
                            Quản trị hệ thống
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview mt-1">
                        {% if master.checkPermission('user','index') %}
                        <li class="nav-item">
                            <a href="<?= WEB_ADMIN_URL ?>/user"
                                class="nav-link {% if dispatcher.getControllerName()=='user' %} {{ 'active' }} {% endif %} single">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Tài khoản người dùng</p>
                            </a>
                        </li>
                        {% endif %}
                        {% if master.checkPermission('role','index') %}
                        <li class="nav-item">
                            <a href="<?= WEB_ADMIN_URL ?>/role"
                                class="nav-link {% if dispatcher.getControllerName()=='role' %} {{ 'active' }} {% endif %}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Nhóm người dùng</p>
                            </a>
                        </li>
                        {% endif %}
                    </ul>
                </li>
                <li
                    class="nav-item has-treeview {% if dispatcher.getControllerName() in ['logs'] %} {{ 'menu-open' }} {% endif %}">
                    <a href="#"
                        class="nav-link {% if dispatcher.getControllerName() in ['logs'] %} {{ 'active' }} {% endif %}">
                        <i class="nav-icon fas fa-history"></i>
                        <p>
                            Nhật ký hệ thống
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview mt-1">
                        {% if master.checkPermission('logs', 'index') %}
                        <li class="nav-item">
                            <a href="<?= WEB_ADMIN_URL ?>/logs?typeidSearch=4"
                                class="nav-link {% if dispatcher.getControllerName()=='logs' AND request.get('typeidSearch') == 4 %} {{ 'active' }} {% endif %} single">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Nhật ký đăng nhập</p>
                            </a>
                        </li>
                        {% endif %}
                        {% if master.checkPermission('logs', 'index') %}
                        <li class="nav-item">
                            <a href="<?= WEB_ADMIN_URL ?>/logs?typeidSearch=1"
                                class="nav-link {% if dispatcher.getControllerName()=='logs' AND (request.get('typeidSearch') == '' OR request.get('typeidSearch') == 1) %} {{ 'active' }} {% endif %}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Nhật ký thêm mới</p>
                            </a>
                        </li>
                        {% endif %}
                        {% if master.checkPermission('logs', 'index') %}
                        <li class="nav-item">
                            <a href="<?= WEB_ADMIN_URL ?>/logs?typeidSearch=2"
                                class="nav-link {% if dispatcher.getControllerName()=='logs' AND request.get('typeidSearch') == 2 %} {{ 'active' }} {% endif %}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Nhật ký chỉnh sửa</p>
                            </a>
                        </li>
                        {% endif %}
                        {% if master.checkPermission('logs', 'index')%}
                        <li class="nav-item">
                            <a href="<?= WEB_ADMIN_URL ?>/logs?typeidSearch=3"
                                class="nav-link {% if dispatcher.getControllerName()=='logs' AND request.get('typeidSearch') == 3 %} {{ 'active' }} {% endif %}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Nhật ký xóa</p>
                            </a>
                        </li>
                        {% endif %}
                    </ul>
                </li>
                <li class="nav-item has-treeview {% if dispatcher.getControllerName() in ['trashs'] %} {{ 'menu-open' }} {% endif %}">
                    <a href="#"
                        class="nav-link {% if dispatcher.getControllerName() in ['trashs'] %} {{ 'active' }} {% endif %}">
                        <i class="nav-icon fas fa-trash-restore"></i>
                        <p> Thùng rác<i class="right fas fa-angle-left"></i></p>
                    </a>
                    <ul class="nav nav-treeview mt-1">
                        {% if master.checkPermission('posts', 'delete') %}
                        <li class="nav-item">
                            <a href="<?= WEB_ADMIN_URL ?>/trashs?type=posts"
                                class="nav-link {% if dispatcher.getControllerName()=='trashs' AND request.get('type') == 'posts' %} {{ 'active' }} {% endif %}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Bài viết</p>
                            </a>
                        </li>
                        {% endif %}
                        {% if master.checkPermission('pages', 'delete') %}
                        <li class="nav-item">
                            <a href="<?= WEB_ADMIN_URL ?>/trashs?type=pages"
                                class="nav-link {% if dispatcher.getControllerName()=='trashs' AND request.get('type') == 'pages' %} {{ 'active' }} {% endif %}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Trang thông tin</p>
                            </a>
                        </li>
                        {% endif %}
                        {% if master.checkPermission('subjects', 'delete') %}
                        <li class="nav-item">
                            <a href="<?= WEB_ADMIN_URL ?>/trashs?type=subjects"
                                class="nav-link {% if dispatcher.getControllerName()=='trashs' AND request.get('type') == 'subjects' %} {{ 'active' }} {% endif %}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Môn học</p>
                            </a>
                        </li>
                        {% endif %}
                        {% if master.checkPermission('researches', 'delete') %}
                        <li class="nav-item">
                            <a href="<?= WEB_ADMIN_URL ?>/trashs?type=researches"
                                class="nav-link {% if dispatcher.getControllerName()=='trashs' AND request.get('type') == 'researches' %} {{ 'active' }} {% endif %}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Hướng nghiên cứu</p>
                            </a>
                        </li>
                        {% endif %}
                        {% if master.checkPermission('slideshows', 'delete') %}
                        <li class="nav-item">
                            <a href="<?= WEB_ADMIN_URL ?>/trashs?type=slideshows"
                                class="nav-link {% if dispatcher.getControllerName()=='trashs' AND request.get('type') == 'slideshows' %} {{ 'active' }} {% endif %}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Banners</p>
                            </a>
                        </li>
                        {% endif %}
                        {% if master.checkPermission('staffs', 'delete') %}
                        <li class="nav-item">
                            <a href="<?= WEB_ADMIN_URL ?>/trashs?type=staffs"
                                class="nav-link {% if dispatcher.getControllerName()=='trashs' AND request.get('type') == 'staffs' %} {{ 'active' }} {% endif %}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Tổ chức Cán bộ</p>
                            </a>
                        </li>
                        {% endif %}
                        {% if master.checkPermission('partners', 'delete') %}
                        <li class="nav-item">
                            <a href="<?= WEB_ADMIN_URL ?>/trashs?type=partners"
                                class="nav-link {% if dispatcher.getControllerName()=='trashs' AND request.get('type') == 'partners' %} {{ 'active' }} {% endif %}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Liên kết/ đối tác</p>
                            </a>
                        </li>
                        {% endif %}
                    </ul>
                </li>
                <li class="nav-item">
                    <a id="btnLogOut" href="#" data-href="<?= WEB_URL ?>/account/logout" class="nav-link">
                        <i class="nav-icon fas fa-power-off"></i>
                        <p>Đăng xuất</p>
                    </a>
                </li>
            </ul>
        </nav>
    </div>
</aside>