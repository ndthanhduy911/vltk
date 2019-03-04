$(function () {
    "use strict";
    switch (window.location.pathname) {
        
        case '/adcp/client'     :
        case '/adcp/client/'     :
        case '/adcp/client/index'     :
        case '/adcp/client/index/'     :
            loaderClient();
            break;

        case '/adcp/package'    :
        case '/adcp/package/'    :
        case '/adcp/package/index'    :
        case '/adcp/package/index/'    :
            loaderPackage();
            break;

        case '/adcp/language'    :
        case '/adcp/language/'    :
        case '/adcp/language/index'    :
        case '/adcp/language/index/'    :
            loaderLanguage();
            break;

        case '/adcp/contract'   :
        case '/adcp/contract/'   :
        case '/adcp/contract/index'   :
        case '/adcp/contract/index/'   :
            loaderContract();
            break;

        case '/adcp/payment'    :
        case '/adcp/payment/'    :
        case '/adcp/payment/index'    :
        case '/adcp/payment/index/'    :
            loaderPayment();
            break;

        case '/adcp/user'       :
        case '/adcp/user/'       :
        case '/adcp/user/index'       :
        case '/adcp/user/index/'       :
            loaderUser();
            break;

        case '/adcp/mail'       :
        case '/adcp/mail/index'       :
        case '/adcp/mail/'       :
        case '/adcp/mail/index/'       :
            loaderMail();
            break;

        case '/adcp/support':
        case '/adcp/support/index':
        case '/adcp/support/':
        case '/adcp/support/index/':
            loaderSupport();
            break;

        case '/adcp/support/mysupport':
        case '/adcp/support/mysupport/':
            loaderMySupport();
            break;

        
        case '/adcp/department':
        case '/adcp/department/index':
        case '/adcp/department/':
        case '/adcp/department/index/':
            loaderDepartment();
            break;

        case '/adcp/method':
        case '/adcp/method/index':
        case '/adcp/method/':
        case '/adcp/method/index/':
            loaderMethod();
            break;

        case '/adcp/permission':
        case '/adcp/permission/index':
        case '/adcp/permission/':
        case '/adcp/permission/index/':
            loaderGroup();
            break;

        case '/adcp/log':
        case '/adcp/log/index':
        case '/adcp/log/':
        case '/adcp/log/index/':
            loaderLog();
            break;

        case '/adcp/log/client':
        case '/adcp/log/client/':
            loaderLogClient();
            break;

        case '/adcp/emailsms':
        case '/adcp/emailsms/index':
        case '/adcp/emailsms/':
        case '/adcp/emailsms/index/':
        {
            loaderEmail();
            loaderSMS();
            break;
        }


        case '/adcp/setting':
        case '/adcp/setting/index':
        case '/adcp/setting/':
        case '/adcp/setting/index/':
        {
            saveGenaralSetting('#frmLoginSetting');
            break;
        }

        case '/adcp/setting/faq':
        case '/adcp/setting/faq/':
        {
            loaderFaq();
            break;
        }
        

        case '/adcp/permission/list':
        case '/adcp/permission/list/':
            loaderPermissionList();
            break;

        case '/adcp/dashboard':
        case '/adcp/dashboard/':
        case '/adcp':
        case '/adcp/':
        {
            carouselLoader();
            chartjsLoader();
            break;
        }
    
        default:
            break;
    }
})

