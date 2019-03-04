<div class="left-sidebar">
    <!-- Sidebar scroll-->
    <div class="scroll-sidebar">
        <!-- Sidebar navigation-->
        <nav class="sidebar-nav">
            <ul id="sidebarnav">
                <li class="nav-devider"></li>
                <li class="nav-label">BẢNG ĐIỀU KHIỂN</li>
                <li class="{% if dispatcher.getControllerName() == 'dashboard' %} {{ 'active' }} {% endif %}">
                    <a class="" href="{{ url('/adcp/dashboard') }}" aria-expanded="false">
                        <i class="fa fa-bar-chart"></i>
                        <span class="hide-menu">Bảng điều khiển
                            <span class="label label-rouded"></span>
                        </span>
                    </a>
                </li>
                <li class="nav-label">Quản lý</li>
                <?php if($this->rolemaster::isPermission($this->session->get("permission"),'client','index')){ ?>
                <li class="{% if dispatcher.getControllerName() == 'client' %} {{ 'active' }} {% endif %}">
                    <a class="" href="{{ url('/adcp/client') }}" aria-expanded="false">
                        <i class="fa fa-users"></i>
                        <span class="hide-menu">Danh sách người yêu cầu
                            <span class="label label-rouded"></span>
                        </span>
                    </a>
                </li>
                <?php } ?>
                <?php if($this->rolemaster::isPermission($this->session->get("permission"),'department','index')){ ?>
                <li class="{% if dispatcher.getControllerName() == 'department' %} {{ 'active' }} {% endif %}">
                    <a class="" href="{{ url('/adcp/department') }}" aria-expanded="false">
                        <i class="fa fa-building-o"></i>
                        <span class="hide-menu">Đơn vị
                            <span class="label label-rouded"></span>
                        </span>
                    </a>
                </li>
                <?php } ?>
                <?php if($this->rolemaster::isPermission($this->session->get("permission"),'support','index')){ ?>
                <li class="{% if dispatcher.getControllerName() == 'support' %} {{ 'active' }} {% endif %}">
                    <a class="has-arrow {% if dispatcher.getControllerName() == 'support' %} {{ 'changed' }} {% endif %}" href="javascript:;">
                        <i class="fa fa-handshake-o"></i>
                        <span class="hide-menu">Xử lý yêu cầu hỗ trợ<span class="label label-rouded"></span></span>
                    </a>
                    <ul aria-expanded="false" class="collapse {% if dispatcher.getControllerName() == 'support' %} {{ 'show' }} {% endif %}">
                        <li><a class="{% if dispatcher.getControllerName() == 'support' AND dispatcher.getActionName() == 'index' %} {{ 'active' }} {% endif %}" href="{{ url('/adcp/support') }}">Danh sách yêu cầu</a></li>
                        <li><a class="{% if dispatcher.getControllerName() == 'support' AND dispatcher.getActionName() == 'mysupport' %} {{ 'active' }} {% endif %}" href="{{ url('/adcp/support/mysupport') }}">Yêu cầu được giao</a></li>
                        <!-- <li><a class="{% if dispatcher.getControllerName() == 'support' AND dispatcher.getActionName() == 'report' %} {{ 'active' }} {% endif %}" href="{{ url('/adcp/report') }}">Thống kê</a></li> -->
                    </ul>
                </li>
                <?php } ?>
                <?php if($this->rolemaster::isPermission($this->session->get("permission"),'method','index')){ ?>
                <li class="{% if dispatcher.getControllerName() == 'method' %} {{ 'active' }} {% endif %}">
                    <a class="" href="{{ url('/adcp/method') }}" aria-expanded="false">
                        <i class="fa fa-archive"></i>
                        <span class="hide-menu">Phương thức xử lý
                            <span class="label label-rouded"></span>
                        </span>
                    </a>
                </li>
                <?php } ?>
                <!-- <li class="{% if dispatcher.getControllerName() == 'mail' %} {{ 'active' }} {% endif %}">
                    <a class="" href="{{ url('/adcp/mail') }}" aria-expanded="false">
                        <i class="fa fa-envelope"></i>
                        <span class="hide-menu">Thư điện tử
                            <span class="label label-rouded"></span>
                        </span>
                    </a>
                </li> -->
                
                <li id="settingManager" class="{% if dispatcher.getControllerName() == 'setting' %} {{ 'active' }} {% endif %}">
                    <a class="has-arrow {% if dispatcher.getControllerName() == 'setting' %} {{ 'changed' }} {% endif %}" href="javascript:;">
                        <i class="fa fa-cog"></i>
                        <span class="hide-menu">Quản lý hệ thống<span class="label label-rouded"></span></span>
                    </a>
                    <ul aria-expanded="false" class="collapse {% if dispatcher.getControllerName() == 'setting' %} {{ 'show' }} {% endif %}">
                        <?php if($this->rolemaster::isPermission($this->session->get("permission"),'user','index')){ ?>
                        <li><a class="{% if dispatcher.getControllerName() == 'user' AND dispatcher.getActionName() == 'index' %} {{ 'active' }} {% endif %}" href="{{ url('/adcp/user') }}">Quản trị tài khoản</a></li>
                        <?php } ?>
                        <?php if($this->rolemaster::isPermission($this->session->get("permission"),'package','index')){ ?>
                        <li><a class="{% if dispatcher.getControllerName() == 'package' AND dispatcher.getActionName() == 'index' %} {{ 'active' }} {% endif %}" href="{{ url('/adcp/package') }}">Mô tả nội dung dịch vụ</a></li>
                        <?php } ?>
                        <?php if($this->rolemaster::isPermission($this->session->get("permission"),'setting','')){ ?>
                        <li><a class="{% if dispatcher.getControllerName() == 'setting' AND dispatcher.getActionName() == 'index' %} {{ 'active' }} {% endif %}" href="{{ url('/adcp/setting') }}">Thiết lập chung</a></li>
                        <li><a class="{% if dispatcher.getControllerName() == 'setting' AND dispatcher.getActionName() == 'faq' %} {{ 'active' }} {% endif %}" href="{{ url('/adcp/setting/faq') }}">Câu hỏi thường gặp</a></li>
                        <li><a class="{% if dispatcher.getControllerName() == 'emailsms' AND dispatcher.getActionName() == 'index' %} {{ 'active' }} {% endif %}" href="{{ url('/adcp/emailsms') }}">SMS/EMAIL</a></li>
                        <li><a class="{% if dispatcher.getControllerName() == 'language' AND dispatcher.getActionName() == 'index' %} {{ 'active' }} {% endif %}" href="{{ url('/adcp/language') }}">Ngôn ngữ</a></li>
                        <?php } ?>
                        <?php if($this->rolemaster::isPermission($this->session->get("permission"),'permission','index')){ ?>
                        <li><a class="{% if dispatcher.getControllerName() == 'permission' AND dispatcher.getActionName() == 'index' %} {{ 'active' }} {% endif %}" href="{{ url('/adcp/permission') }}">Nhóm phân quyền</a></li>
                        <?php } ?>
                        <?php if($this->rolemaster::isPermission($this->session->get("permission"),'permission','list')){ ?>
                        <li><a class="{% if dispatcher.getControllerName() == 'permission' AND dispatcher.getActionName() == 'list' %} {{ 'active' }} {% endif %}" href="{{ url('/adcp/permission/list') }}">Danh sách phân quyền</a></li>
                        <?php } ?>
                        <?php if($this->rolemaster::isPermission($this->session->get("permission"),'setting','')){ ?>
                        <li><a class="{% if dispatcher.getControllerName() == 'log' AND dispatcher.getActionName() == 'index' %} {{ 'active' }} {% endif %}" href="{{ url('/adcp/log') }}">Xem LOG quản trị</a></li>
                        <li><a class="{% if dispatcher.getControllerName() == 'log' AND dispatcher.getActionName() == 'client' %} {{ 'active' }} {% endif %}" href="{{ url('/adcp/log/client') }}">Xem LOG người dùng</a></li>
                        <?php } ?>
                    </ul>
                </li>
                
                <li class="{% if dispatcher.getControllerName() == 'about' %} {{ 'active' }} {% endif %}">
                    <a class="" href="{{ url('/adcp/about') }}" aria-expanded="false">
                        <i class="fa fa-comment"></i>
                        <span class="hide-menu">Hotline
                            <span class="label label-rouded"></span>
                        </span>
                    </a>
                </li>
                <li class="{% if dispatcher.getControllerName() == 'policy' %} {{ 'active' }} {% endif %}">
                    <a class="" href="{{ url('/adcp/policy') }}" aria-expanded="false">
                        <i class="fa fa-bookmark-o"></i>
                        <span class="hide-menu">Chính sách
                            <span class="label label-rouded"></span>
                        </span>
                    </a>
                </li>
                <li class="{% if dispatcher.getControllerName() == 'faq' %} {{ 'active' }} {% endif %}">
                    <a class="" href="{{ url('/adcp/faq') }}" aria-expanded="false">
                        <i class="fa fa-question-circle-o"></i>
                        <span class="hide-menu">Câu hỏi thường gặp
                            <span class="label label-rouded"></span>
                        </span>
                    </a>
                </li>
                <li class="{% if dispatcher.getControllerName() == 'help' %} {{ 'active' }} {% endif %}">
                    <a class="" href="{{ url('/adcp/help') }}" aria-expanded="false">
                        <i class="fa fa-question-circle"></i>
                        <span class="hide-menu">Hướng dẫn
                            <span class="label label-rouded"></span>
                        </span>
                    </a>
                </li>
                <li class="">
                    <a class="logout" link-out="{{ url('/adcp/logout') }}" href="javascript:;" aria-expanded="false">
                        <i class="fa fa-power-off"></i>
                        <span class="hide-menu">Đăng xuất
                            <span class="label label-rouded"></span>
                        </span>
                    </a>
                </li>
            </ul>
        </nav>
        <!-- End Sidebar navigation -->
    </div>
    <!-- End Sidebar scroll-->
</div>