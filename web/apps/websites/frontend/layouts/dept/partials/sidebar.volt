<div class="sidebar" data-active-color="red" data-background-color="white" data-image="/assets/frontend/img/sidebar-1.jpg">
    <div class="logo">
        <a href="<?php echo FRONTEND_URL ?>/" class="simple-text">
            <img width="80%" src="/images/physics.png" alt="PHYSICS">
        </a>
    </div>
    <div class="logo logo-mini">
        <a href="<?php echo FRONTEND_URL ?>/" class="simple-text">
            <img width="80%" src="/images/physics.png" alt="PHYSICS">
        </a>
    </div>
    <div class="sidebar-wrapper">
        <div class="user">
            <div class="photo">
                <?php $avatar = $this->session->get('avatar'); ?>
                <?php $user_id = $this->session->get('user_id'); ?>
                <a class="profile-link" href="/account/profile/">
                    <img width="30%" src="/files/avatar/{{avatar?avatar:'hnn-avatar.png'}}" class="border radius bg-white">
                </a>
                
            </div>
            <div class="info">
                <a href="#collapseProfile" class="collapsed" data-toggle="collapse">
                    <?= $this->session->get('fullName'); ?>
                    <b class="caret"></b>
                </a>
                <div class="collapse" id="collapseProfile">
                    <ul class="nav m-t-3">
                        <li>
                            <a class="m-t-3 profile-link" href="/account/profile/"><?= $this->ml::_ml('Trang cá nhân','frontend','sidebar_profile','sidebar')?></a>
                        </li>
                        <li>
                            <a class="m-t-3 logout" href="/account/logout"><?= $this->ml::_ml('Đăng xuất','frontend','sidebar_logout','sidebar')?></a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <ul class="nav">
            <li class="{% if dispatcher.getControllerName() == 'account' AND dispatcher.getActionName() == 'index' %} {{ 'active' }} {% endif %}">
                <a href="/account/">
                    <i class="material-icons">dashboard</i>
                    <p><?= $this->ml::_ml('Bảng điều khiển','frontend','sidebar_dashboard','sidebar')?></p>
                </a>
            </li>
            <li class="{% if dispatcher.getControllerName() == 'support' AND dispatcher.getActionName() == 'index' %} {{ 'active' }} {% endif %}">
                <a href="/support/">
                    <i class="material-icons">queue</i>
                    <p><?= $this->ml::_ml('Tạo yêu cầu hỗ trợ','frontend','sidebar_creare_suppport','sidebar')?></p>
                </a>
            </li>
            <li class="{% if dispatcher.getControllerName() == 'support' AND dispatcher.getActionName() == 'list' %} {{ 'active' }} {% endif %}">
                <a href="/support/list/">
                    <i class="material-icons">view_list</i>
                    <p><?= $this->ml::_ml('Danh sách yêu cầu hỗ trợ','frontend','sidebar_suppports','sidebar')?></p>
                </a>
            </li>
            <li class="{% if dispatcher.getControllerName() == 'support' AND dispatcher.getActionName() == 'help' %} {{ 'active' }} {% endif %}">
                <a href="/support/help/">
                    <i class="material-icons">live_help</i>
                    <p><?= $this->ml::_ml('Hướng dẫn','frontend','sidebar_help','sidebar')?></p>
                </a>
            </li>
            <li class="{% if dispatcher.getControllerName() == 'support' AND dispatcher.getActionName() == 'package' %} {{ 'active' }} {% endif %}">
                <a href="/support/package/">
                    <i class="material-icons">collections_bookmark</i>
                    <p><?= $this->ml::_ml('Danh mục yêu cầu hỗ','frontend','sidebar_packages','sidebar')?></p>
                </a>
            </li>
            <li class="{% if dispatcher.getControllerName() == 'faq' AND dispatcher.getActionName() == 'index' %} {{ 'active' }} {% endif %}">
                <a href="/faq/" class="faq">
                    <i class="material-icons">question_answer</i>
                    <p><?= $this->ml::_ml('Câu hỏi thường gặp','frontend','sidebar_faqs','sidebar')?></p>
                </a>
            </li>
        </ul>
    </div>
</div>