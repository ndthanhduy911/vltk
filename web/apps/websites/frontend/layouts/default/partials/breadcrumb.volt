<div class="breadcrumb-container">
    <div class="container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><i class="fa fa-home pr-2"></i><a class="link-dark" href="<?= WEB_URL ?>/{{ dept.id != 1? dept.slug : '' }}">{{ ml._ml('home', 'Trang chủ') }}</a></li>
            {% if ltitle AND lslug %}
            <li class="breadcrumb-item"><a class="link-dark" href="{{lslug}}">{{ltitle}}</a></li>
            {% endif %}
            <li class="breadcrumb-item active">{{title}}</li>
        </ol>
    </div>
</div>