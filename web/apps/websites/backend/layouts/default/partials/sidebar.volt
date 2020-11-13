<aside class="main-sidebar elevation-4 sidebar-light-primary">
    <a href="<?= WEB_ADMIN_URL ?>" class="brand-link">
        <img src="<?= LOGO ?>" alt="<?= DEPT ?>" class="brand-image img-circle elevation-3">
        <span class="brand-text font-weight-bold text-uppercase text-primary"><?= WEB_NAME ?></span>
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
                    class="nav-item has-treeview {% if dispatcher.getControllerName() in ['checkout','checkin','asset', 'pcplan', 'furnish', 'reduction', 'transfer', 'revoke','inventory','repair','failing', 'estimate','history'] %} {{ 'menu-open' }} {% endif %}">
                    <a href="#"
                        class="nav-link {% if dispatcher.getControllerName() in ['checkout','checkin','asset', 'pcplan', 'furnish', 'reduction', 'transfer', 'revoke','inventory','repair','failing', 'estimate','history'] %} {{ 'active' }} {% endif %}">
                        <i class="nav-icon fas fa-server"></i>
                        <p>
                            Tài sản
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview mt-1">
                        {% if master.checkPermission('checkin', 'index') %}
                        <li class="nav-item">
                            <a href="<?= WEB_ADMIN_URL ?>/checkin"
                                class="nav-link {% if dispatcher.getControllerName()=='checkin' AND dispatcher.getActionName() !='checkinasset' %} {{ 'active' }} {% endif %}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Phiếu nhập</p>
                            </a>
                        </li>
                        {% endif %}
                        {% if master.checkPermission('checkout', 'index') %}
                        <li class="nav-item">
                            <a href="<?= WEB_ADMIN_URL ?>/checkout"
                                class="nav-link {% if dispatcher.getControllerName()=='checkout' %} {{ 'active' }} {% endif %}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Phiếu xuất</p>
                            </a>
                        </li>
                        {% endif %}
                        {% if master.checkPermission(['checkout','checkin'], 'index') %}
                        <li class="nav-item">
                            <a href="<?= WEB_ADMIN_URL ?>/checkin/checkinasset"
                                class="nav-link {% if dispatcher.getControllerName()=='checkin' AND dispatcher.getActionName()=='checkinasset' %} {{ 'active' }} {% endif %}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Tài sản nhập/xuất</p>
                            </a>
                        </li>
                        {% endif %}
                        <hr class="mt-1 mb-1">
                        {% if master.checkPermission('asset', 'index') %}
                        <li class="nav-item">
                            <a href="<?= WEB_ADMIN_URL ?>/asset"
                                class="nav-link {% if dispatcher.getControllerName()=='asset' %} {{ 'active' }} {% endif %}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Tài sản sử dụng</p>
                            </a>
                        </li>
                        {% endif %}
                        {% if master.checkPermission('inventory', 'index') %}
                        <li class="nav-item">
                            <a href="<?= WEB_ADMIN_URL ?>/inventory"
                                class="nav-link {% if dispatcher.getControllerName()=='inventory' %} {{ 'active' }} {% endif %}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Kiểm kê Tài sản</p>
                            </a>
                        </li>
                        {% endif %}
                        {% if master.checkPermission('estimate', 'index') %}
                        <li class="nav-item">
                            <a href="<?= WEB_ADMIN_URL ?>/estimate"
                                class="nav-link {% if dispatcher.getControllerName()=='estimate' %} {{ 'active' }} {% endif %}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Đánh giá lại Tài sản</p>
                            </a>
                        </li>
                        {% endif %}
                        {% if master.checkPermission('transfer', 'index') %}
                        <li class="nav-item">
                            <a href="<?= WEB_ADMIN_URL ?>/transfer"
                                class="nav-link {% if dispatcher.getControllerName()=='transfer' %} {{ 'active' }} {% endif %}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Điều chuyển Tài sản</p>
                            </a>
                        </li>
                        {% endif %}
                        {% if master.checkPermission('revoke', 'index') %}
                        <li class="nav-item">
                            <a href="<?= WEB_ADMIN_URL ?>/revoke"
                                class="nav-link {% if dispatcher.getControllerName()=='revoke' %} {{ 'active' }} {% endif %}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Thu hồi Tài sản</p>
                            </a>
                        </li>
                        {% endif %}
                        {% if master.checkPermission('failing', 'index') %}
                        <li class="nav-item">
                            <a href="<?= WEB_ADMIN_URL ?>/failing"
                                class="nav-link {% if dispatcher.getControllerName()=='failing' %} {{ 'active' }} {% endif %}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Báo hỏng Tài sản</p>
                            </a>
                        </li>
                        {% endif %}
                        {% if master.checkPermission('repair', 'index') %}
                        <li class="nav-item">
                            <a href="<?= WEB_ADMIN_URL ?>/repair"
                                class="nav-link {% if dispatcher.getControllerName()=='repair' %} {{ 'active' }} {% endif %}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Nâng cấp/Sửa chữa</p>
                            </a>
                        </li>
                        {% endif %}
                        <hr class="mt-1 mb-1">
                        {% if master.checkPermission('reduction', 'index') %}
                        <li class="nav-item">
                            <a href="<?= WEB_ADMIN_URL ?>/reduction"
                                class="nav-link {% if dispatcher.getControllerName()=='reduction' AND (dispatcher.getActionName() in ['view','update','index']) %} {{ 'active' }} {% endif %}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Ghi giảm Tài sản</p>
                            </a>
                        </li>
                        {% endif %}
                        {% if master.checkPermission('reduction', 'index') %}
                        <li class="nav-item">
                            <a href="<?= WEB_ADMIN_URL ?>/reduction/list"
                                class="nav-link {% if dispatcher.getControllerName()=='reduction' AND dispatcher.getActionName()=='list' %} {{ 'active' }} {% endif %}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Tài sản ghi giảm</p>
                            </a>
                        </li>
                        {% endif %}
                        <hr class="mt-1 mb-1">
                        {% if master.checkPermission('pcplan', 'index') %}
                        <li class="nav-item">
                            <a href="<?= WEB_ADMIN_URL ?>/pcplan"
                                class="nav-link {% if dispatcher.getControllerName()=='pcplan' %} {{ 'active' }} {% endif %}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Kế hoạch mua sắm</p>
                            </a>
                        </li>
                        {% endif %}
                        {% if master.checkPermission('furnish', 'index') %}
                        <li class="nav-item">
                            <a href="<?= WEB_ADMIN_URL ?>/furnish"
                                class="nav-link {% if dispatcher.getControllerName()=='furnish' %} {{ 'active' }} {% endif %}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Đề nghị trang cấp</p>
                            </a>
                        </li>
                        {% endif %}
                        <hr class="mt-1 mb-1">
                        {% if master.checkPermission('history', 'index') %}
                        <li class="nav-item">
                            <a href="<?= WEB_ADMIN_URL ?>/history"
                                class="nav-link {% if dispatcher.getControllerName()=='history' %} {{ 'active' }} {% endif %}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Lịch sử sử dụng</p>
                            </a>
                        </li>
                        {% endif %}
                    </ul>
                </li>
                <li
                    class="nav-item has-treeview {% if dispatcher.getControllerName() in ['upasset','deasset','uptool','detool','fixedbook','toolbook'] %} {{ 'menu-open' }} {% endif %}">
                    <a href="#"
                        class="nav-link {% if dispatcher.getControllerName() in ['upasset','deasset','uptool','detool','fixedbook','toolbook'] %} {{ 'active' }} {% endif %}">
                        <i class="nav-icon fas fa-search-dollar"></i>
                        <p>
                            Kế toán
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview mt-1">
                        {% if master.checkPermission('upasset', 'index') %}
                        <li class="nav-item">
                            <a href="<?= WEB_ADMIN_URL ?>/upasset"
                                class="nav-link {% if dispatcher.getControllerName()=='upasset' %} {{ 'active' }} {% endif %}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Ghi tăng TSCĐ</p>
                            </a>
                        </li>
                        {% endif %}
                        {% if master.checkPermission('deasset', 'index') %}
                        <li class="nav-item">
                            <a href="<?= WEB_ADMIN_URL ?>/deasset"
                                class="nav-link {% if dispatcher.getControllerName()=='deasset' %} {{ 'active' }} {% endif %}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Khấu hao, hao mòn</p>
                            </a>
                        </li>
                        {% endif %}
                        {#
                        {% if master.checkPermission('fixedbook', 'index') %}
                        <li class="nav-item">
                            <a href="<?= WEB_ADMIN_URL ?>/fixedbook"
                                class="nav-link {% if dispatcher.getControllerName()=='fixedbook' %} {{ 'active' }} {% endif %}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Sổ Tài sản Cố định</p>
                            </a>
                        </li>
                        {% endif %}
                        <hr class="mt-1 mb-1">
                        {% if master.checkPermission('uptool', 'index') %}
                        <li class="nav-item">
                            <a href="<?= WEB_ADMIN_URL ?>/uptool"
                                class="nav-link {% if dispatcher.getControllerName()=='uptool' %} {{ 'active' }} {% endif %}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Ghi tăng CCDC</p>
                            </a>
                        </li>
                        {% endif %}
                        {% if master.checkPermission('detool', 'index') %}
                        <li class="nav-item">
                            <a href="<?= WEB_ADMIN_URL ?>/detool"
                                class="nav-link {% if dispatcher.getControllerName()=='detool' %} {{ 'active' }} {% endif %}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Phân bổ</p>
                            </a>
                        </li>
                        {% endif %}
                        {% if master.checkPermission('toolbook', 'index') %}
                        <li class="nav-item">
                            <a href="<?= WEB_ADMIN_URL ?>/toolbook"
                                class="nav-link {% if dispatcher.getControllerName()=='toolbook' %} {{ 'active' }} {% endif %}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Sổ Công cụ Dụng cụ</p>
                            </a>
                        </li>
                        {% endif %}
                        #}
                    </ul>
                </li>
                <li
                    class="nav-item has-treeview {% if dispatcher.getControllerName() in ['assettype','assetorigin','assetpurchase','depts','assetmadein','employee','supplier','assetunit','location'] %} {{ 'menu-open' }} {% endif %}">
                    <a href="#"
                        class="nav-link {% if dispatcher.getControllerName() in ['assettype','assetorigin','assetpurchase','depts','assetmadein','employee','supplier','assetunit','location'] %} {{ 'active' }} {% endif %}">
                        <i class="nav-icon fas fa-list"></i>
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
                <?php if(!NOTSHOW) { ?>
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
                <?php } ?>
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
                <li
                    class="nav-item has-treeview {% if dispatcher.getControllerName() in ['reports'] %} {{ 'menu-open' }} {% endif %}">
                    <a href="#"
                        class="nav-link {% if dispatcher.getControllerName() in ['reports'] %} {{ 'active' }} {% endif %}">
                        <i class="nav-icon fas fa-chart-bar"></i>
                        <p>
                            Thống kê/báo cáo
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview mt-1">
                        <li class="nav-item">
                            <a href="<?= WEB_ADMIN_URL ?>/reports"
                                class="nav-link {% if dispatcher.getControllerName()=='reports' AND dispatcher.getActionName() == 'index' %} {{ 'active' }} {% endif %}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Danh sách thống kê/báo cáo</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="<?= WEB_ADMIN_URL ?>/reports/list"
                                class="nav-link {% if dispatcher.getControllerName()=='reports' AND dispatcher.getActionName() == 'list' %} {{ 'active' }} {% endif %}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Thiết lập thống kê/báo cáo</p>
                            </a>
                        </li>
                    </ul>
                </li>
                {% if master.checkPermission('sync', 'index') %}
                <li class="nav-item">
                    <a href="<?= WEB_ADMIN_URL ?>/sync"
                        class="nav-link {% if dispatcher.getControllerName()=='sync' %} {{ 'active' }} {% endif %}">
                        <i class="nav-icon fas fa-file-excel"></i>
                        <p>Nhập dữ liệu ban đầu</p>
                    </a>
                </li>
                {% endif %}
                {% if master.checkPermission('backup', 'index') %}
                <li class="nav-item">
                    <a href="<?= WEB_ADMIN_URL ?>/backup"
                        class="nav-link {% if dispatcher.getControllerName()=='backup' AND dispatcher.getActionName() == 'index' %} {{ 'active' }} {% endif %}">
                        <i class="nav-icon fas fa-database"></i>
                        <p>Sao lưu dự phòng</p>
                    </a>
                </li>
                {% endif %}
                <li class="nav-item">
                    <a href="<?= WEB_ADMIN_URL ?>/help"
                        class="nav-link {% if dispatcher.getControllerName()=='help' AND dispatcher.getActionName() == 'index' %} {{ 'active' }} {% endif %}">
                        <i class="nav-icon fas fa-people-carry"></i>
                        <p>Hướng dẫn</p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="<?= WEB_ADMIN_URL ?>/help/faqs"
                        class="nav-link {% if dispatcher.getControllerName()=='help' AND dispatcher.getActionName() == 'faqs' %} {{ 'active' }} {% endif %}">
                        <i class="nav-icon fas fa-question-circle"></i>
                        <p>Câu hỏi thường gặp</p>
                    </a>
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