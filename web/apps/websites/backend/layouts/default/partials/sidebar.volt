<aside class="main-sidebar elevation-4 sidebar-light-primary">
    <a href="<?= WEB_ADMIN_URL ?>" class="brand-link">
        <img src="<?= LOGO ?>" alt="<?= DEPT ?>" class="brand-image img-circle elevation-3">
        <span class="brand-text font-weight-bold text-uppercase text-primary">QUẢN TRỊ THÔNG TIN</span>
    </a>

    <div class="sidebar">
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                <li class="nav-item">
                    <a href="<?= WEB_ADMIN_URL ?>/dashboard"
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
                            <a href="<?= WEB_ADMIN_URL ?>/posts/update"
                                class="nav-link {% if dispatcher.getControllerName()=='posts' AND dispatcher.getActionName()=='update' %} {{ 'active' }} {% endif %}">
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
                    </ul>
                </li>
                <li class="nav-item">
                    <a href="<?= WEB_ADMIN_URL ?>/pages"
                        class="nav-link {% if dispatcher.getControllerName()=='pages' %} {{ 'active' }} {% endif %}">
                        <i class="nav-icon fas fa-globe"></i>
                        <p>Trang</p>
                    </a>
                </li>
                <li
                    class="nav-item has-treeview {% if dispatcher.getControllerName() in ['subjects','categories'] %} {{ 'menu-open' }} {% endif %}">
                    <a href="#"
                        class="nav-link {% if dispatcher.getControllerName() in ['subjects','categories'] %} {{ 'active' }} {% endif %}">
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
                    <a href="<?= WEB_ADMIN_URL ?>/banner"
                        class="nav-link {% if dispatcher.getControllerName()=='banner' %} {{ 'active' }} {% endif %}">
                        <i class="nav-icon fas fa-images"></i>
                        <p>Banners</p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="<?= WEB_ADMIN_URL ?>/staff"
                        class="nav-link {% if dispatcher.getControllerName()=='staff' %} {{ 'active' }} {% endif %}">
                        <i class="nav-icon fas fa-users"></i>
                        <p>Nhân viên</p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="<?= WEB_ADMIN_URL ?>/partner"
                        class="nav-link {% if dispatcher.getControllerName()=='partner' %} {{ 'active' }} {% endif %}">
                        <i class="nav-icon fas fa-handshake"></i>
                        <p>Liên kết</p>
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
                    class="nav-item has-treeview {% if dispatcher.getControllerName() in ['assettype','assetorigin','assetpurchase','depts','assetmadein','employee','supplier','assetunit','location'] %} {{ 'menu-open' }} {% endif %}">
                    <a href="#"
                        class="nav-link {% if dispatcher.getControllerName() in ['assettype','assetorigin','assetpurchase','depts','assetmadein','employee','supplier','assetunit','location'] %} {{ 'active' }} {% endif %}">
                        <i class="nav-icon fas fa-recycle"></i>
                        <p>
                            Danh mục
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview mt-1">
                        {% if master.checkPermission('depts', 'index') %}
                        <li class="nav-item">
                            <a href="<?= WEB_ADMIN_URL ?>/depts"
                                class="nav-link {% if dispatcher.getControllerName()=='depts' %} {{ 'active' }} {% endif %}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Đơn vị/bộ phận</p>
                            </a>
                        </li>
                        {% endif %}
                        {% if master.checkPermission('employee', 'index') %}
                        <li class="nav-item">
                            <a href="<?= WEB_ADMIN_URL ?>/employee"
                                class="nav-link {% if dispatcher.getControllerName()=='employee' %} {{ 'active' }} {% endif %}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Nhân viên</p>
                            </a>
                        </li>
                        {% endif %}
                        {% if master.checkPermission('assettype', 'index') %}
                        <li class="nav-item">
                            <a href="<?= WEB_ADMIN_URL ?>/assettype"
                                class="nav-link {% if dispatcher.getControllerName()=='assettype' %} {{ 'active' }} {% endif %}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Loại tài sản</p>
                            </a>
                        </li>
                        {% endif %}
                        {% if master.checkPermission('assetorigin', 'index') %}
                        <li class="nav-item">
                            <a href="<?= WEB_ADMIN_URL ?>/assetorigin"
                                class="nav-link {% if dispatcher.getControllerName()=='assetorigin' %} {{ 'active' }} {% endif %}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Nguồn gốc hình thành</p>
                            </a>
                        </li>
                        {% endif %}
                        {% if master.checkPermission('assetpurchase', 'index') %}
                        <li class="nav-item">
                            <a href="<?= WEB_ADMIN_URL ?>/assetpurchase"
                                class="nav-link {% if dispatcher.getControllerName()=='assetpurchase' %} {{ 'active' }} {% endif %}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Hình thức mua sắm</p>
                            </a>
                        </li>
                        {% endif %}
                        {% if master.checkPermission('assetunit', 'index') %}
                        <li class="nav-item">
                            <a href="<?= WEB_ADMIN_URL ?>/assetunit"
                                class="nav-link {% if dispatcher.getControllerName()=='assetunit' %} {{ 'active' }} {% endif %}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Đơn vị tính</p>
                            </a>
                        </li>
                        {% endif %}
                        {% if master.checkPermission('supplier', 'index') %}
                        <li class="nav-item">
                            <a href="<?= WEB_ADMIN_URL ?>/supplier"
                                class="nav-link {% if dispatcher.getControllerName()=='supplier' %} {{ 'active' }} {% endif %}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Nhà cung cấp</p>
                            </a>
                        </li>
                        {% endif %}
                        {% if master.checkPermission('assetmadein', 'index') %}
                        <li class="nav-item">
                            <a href="<?= WEB_ADMIN_URL ?>/assetmadein"
                                class="nav-link {% if dispatcher.getControllerName()=='assetmadein' %} {{ 'active' }} {% endif %}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Nước sản xuất</p>
                            </a>
                        </li>
                        {% endif %}
                        {#
                        {% if master.checkPermission('location', 'index') %}
                        <li class="nav-item">
                            <a href="<?= WEB_ADMIN_URL ?>/location"
                                class="nav-link {% if dispatcher.getControllerName()=='location' %} {{ 'active' }} {% endif %}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Địa điểm</p>
                            </a>
                        </li>
                        {% endif %}
                        #}
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