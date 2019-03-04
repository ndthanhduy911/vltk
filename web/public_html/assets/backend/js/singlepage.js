class SinglePage {
    getData(infoPage, __this) {
        let _this = this;
        if(window.location.pathname !== infoPage.link){
            $.ajax({
                type: "GET",
                url: infoPage.link,
                data: {
                    single: true
                },
                dataType: "html",
                error: function (error) {
    
                },
                success: function (results) {
                    $(infoPage.class).html(loader);
                    $(infoPage.class).append(results);                    
                    history.pushState('', '', infoPage.link);
                    $('#sidebarnav li').removeClass('active');
                    $('#sidebarnav li a').removeClass('active');
                    __this.parent('a').addClass('active');
                    __this.addClass('active');
                    if(__this.parents('ul.collapse').length){
                        __this.parents('ul.collapse').parent('li').addClass('active');
                    }
                    _this.loadScript(infoPage.link, function () {
                        $(".preloader").fadeOut();
                    });
                }
            });
        }
    }
    loadScript(url, cb){
        switch (url) {
            case '/adcp/client'     :
                loaderClient(cb);
                break;
            case '/adcp/package'    :
                loaderPackage(cb);
                break;
            case '/adcp/language'    :
                loaderLanguage(cb);
                break;
            case '/adcp/support'   :{
                loaderSupport(cb);
                break;
            }
            case '/adcp/support/mysupport'   :{
                loaderMySupport(cb);
                break;
            }
            case '/adcp/department'   :{
                loaderDepartment(cb);
                break;
            }
            case '/adcp/method'   :{
                loaderMethod(cb);
                break;
            }
            case '/adcp/user'       :{
                loaderUser(cb);
                break;
            }
            case '/adcp/log/client'   :{
                loaderLogClient(cb);
                break;
            }
            case '/adcp/log'   :{
                loaderLog(cb);
                break;
            }
            case '/adcp/emailsms'   :{
                loaderEmail(cb);
                loaderSMS(cb);
                break;
            }
            case '/adcp/permission/list'       :{
                loaderPermissionList(cb);
                break;
            }
            case '/adcp/permission'       :{
                loaderGroup(cb);
                break;
            }
            case '/adcp/setting'       :{
                saveGenaralSetting('#frmLoginSetting');
                $(".preloader").fadeOut();
                break;
            }
            case '/adcp/setting/faq'       :{
                loaderFaq();
                $(".preloader").fadeOut();
                break;
            }
            case '/adcp/dashboard':
            case '/adcp':{
                carouselLoader();
                chartjsLoader();
                $(".preloader").fadeOut();
                break;
            }
            default:
                $(".preloader").fadeOut();
                break;
        }
    }
}

$(document).ready(function () {
    Single = new SinglePage();
    $('#sidebarnav li a').on('click', function (e) {
        if($(this).hasClass('logout')){
            let link = $(this).attr('link-out');
            swal({
                title: "Bạn có chắc là muốn đăng xuất ?",
                type: "warning",
                showCancelButton: true,
                cancelButtonText: "Đóng",
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "Đồng ý !!",
                closeOnConfirm: false
            },
            function(){
                window.location.pathname = link;
            });
        }else if($(this).attr('href')=='javascript:;'){
            let _this = $(this);
            if(_this.hasClass('has-arrow')){
                let ul = _this.next('ul');
                ul.removeClass('in');
                ul.collapse('toggle');
                ul.addClass('active');
                _this.toggleClass('changed');
            }
        }else{
            e.preventDefault();
            let link = $(this).attr('href');
            Single.getData({
                class: '.page-wrapper',
                link: link
            },$(this));
        }
    });
});