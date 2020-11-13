//Call API
const callApi = (href,data={},type = "GET",ctype='json') => {
    return new Promise((resolve) => {
        $.ajax({
            type: type,
            url: href,
            data: data,
            dataType: ctype,
            success: function (response) {
                $('body .block-loader').remove();
                if(typeof response.logout != 'undefined'){
                    window.location.reload();
                }else{
                    if (typeof response.error == 'undefined') {
                        if(typeof response.token != 'undefined'){
                            $('.tokenCSRF').val(response.token.value);
                            $('.tokenCSRF').attr('name', response.token.key);
                        }
                        resolve(response);
                    } else {
                        showErrorAjax(response);
                    }
                }
                $('[data-toggle="tooltip"]').tooltip()
            },
            error: function (error) {
                $('body .block-loader').remove();
                showSweetAlertError('Thất bại');
            }
        });
    })
}
// ===================================
// ASSETTYPE
// ===================================
// Get asset type child
const apiGetAssetTypeChild = (typeId = 0) => {
    return new Promise((resolve, reject) => {
        callApi(`${webAdminUrl}/assettype/getassettypechild/${typeId}`).then((response)=>{
            resolve(response);
        })
        // $.ajax({
        //     type: "GET",
        //     url: `${webAdminUrl}/assettype/getassettypechild/${typeId}`,
        //     data: null,
        //     dataType: "json",
        //     success: function (response) {
        //         resolve(response);
        //     },
        //     error : function (error) {
        //         reject(error)
        //     }
        // });
    })
}

const apiS2AssetTypeChild = (typeId = 0,type = "") => {
    return new Promise((resolve, reject) => {
        callApi(`${webAdminUrl}/assettype/gets2atchild/${typeId}`,{type:type}).then((response)=>{
            resolve(response);
        })
        // $.ajax({
        //     type: "GET",
        //     url: `${webAdminUrl}/assettype/gets2atchild/${typeId}`,
        //     data: {type:type},
        //     dataType: "json",
        //     success: function (response) {
        //         resolve(response);
        //     },
        //     error : function (error) {
        //         reject(error)
        //     }
        // });
    })
}

const apiGetFieldSpecific = (typeId = 0) => {
    return new Promise((resolve, reject) => {
        callApi(`${webAdminUrl}/assettype/getfieldspecific/${typeId}`,null,'GET','html').then((response)=>{
            resolve(response);
        })
        // $.ajax({
        //     type: "GET",
        //     url: `${webAdminUrl}/assettype/getfieldspecific/${typeId}`,
        //     data: null,
        //     dataType: "html",
        //     success: function (response) {
        //         resolve(response);
        //     },
        //     error : function (error) {
        //         reject(error)
        //     }
        // });
    })
}

// ===================================
// DEPTS
// ===================================
// Get dept child
const apiGetDeptsChild = (deptId = 0) => {
    return new Promise((resolve, reject) => {
        callApi(`${webAdminUrl}/depts/getdeptschild/${deptId}`).then((response)=>{
            resolve(response);
        })
        // $.ajax({
        //     type: "GET",
        //     url: `${webAdminUrl}/depts/getdeptschild/${deptId}`,
        //     data: null,
        //     dataType: "json",
        //     success: function (response) {
        //         resolve(response);
        //     },
        //     error : function (error) {
        //         reject(error)
        //     }
        // });
    })
}

// ===================================
// EMPLOYEE
// ===================================
//Get list employee of dept for seletc2
const apiS2EmployeeList = (deptId = 0) => {
    return new Promise((resolve, reject) => {
        callApi(`${webAdminUrl}/employee/gets2employeelist/${deptId}`).then((response)=>{
            resolve(response);
        })
        // $.ajax({
        //     type: "GET",
        //     url: `${webAdminUrl}/employee/gets2employeelist/${deptId}`,
        //     data: null,
        //     dataType: "json",
        //     success: function (response) {
        //         resolve(response);
        //     },
        //     error : function (error) {
        //         reject(error)
        //     }
        // });
    })
}

// ===================================
// ROLE
// ===================================

// ===================================
// CHECKIN
// ===================================
const apiGetAssetCode = (typeId = 0) => {
    return new Promise((resolve, reject) => {
        callApi(`${webAdminUrl}/checkin/getassetcode/${typeId}`).then((response)=>{
            resolve(response);
        })
        // $.ajax({
        //     type: "GET",
        //     url: `${webAdminUrl}/checkin/getassetcode/${typeId}`,
        //     data: null,
        //     dataType: "json",
        //     success: function (response) {
        //         resolve(response);
        //     },
        //     error : function (error) {
        //         reject(error)
        //     }
        // });
    })
}
const apiGetDetailInDropdown = (ids = '',cId=0) => {
    return new Promise((resolve, reject) => {
        callApi(`${webAdminUrl}/checkin/getdetailindropdown/${cId}?ids=${ids}`).then((response)=>{
            resolve(response);
        })
        // $.ajax({
        //     type: "GET",
        //     url: `${webAdminUrl}/checkin/getdetailindropdown/${cId}?ids=${ids}`,
        //     data: null,
        //     dataType: "json",
        //     success: function (response) {
        //         resolve(response);
        //     },
        //     error : function (error) {
        //         reject(error)
        //     }
        // });
    })
}

// ===================================
// CHECKOUT
// ===================================
const apiGetDetailOutDropdown = (ids = '') => {
    return new Promise((resolve, reject) => {
        callApi(`${webAdminUrl}/checkout/getdetailoutdropdown?ids=${ids}`).then((response)=>{
            resolve(response);
        })
        // $.ajax({
        //     type: "GET",
        //     url: `${webAdminUrl}/checkout/getdetailoutdropdown?ids=${ids}`,
        //     data: null,
        //     dataType: "json",
        //     success: function (response) {
        //         resolve(response);
        //     },
        //     error : function (error) {
        //         reject(error)
        //     }
        // });
    })
}
const apiGetAssetTypeOut = (deptId = 0) => {
    return new Promise((resolve, reject) => {
        callApi(`${webAdminUrl}/checkout/getassettypeout/${deptId}`).then((response)=>{
            resolve(response);
        })
        // $.ajax({
        //     type: "GET",
        //     url: `${webAdminUrl}/checkout/getassettypeout/${deptId}`,
        //     data: null,
        //     dataType: "json",
        //     success: function (response) {
        //         resolve(response);
        //     },
        //     error : function (error) {
        //         reject(error)
        //     }
        // });
    })
}
const apiGetDetailCanOut = (deptId = 0) => {
    return new Promise((resolve, reject) => {
        callApi(`${webAdminUrl}/checkout/getdetailcanout/${deptId}`).then((response)=>{
            resolve(response);
        })
        // $.ajax({
        //     type: "GET",
        //     url: `${webAdminUrl}/checkout/getdetailcanout/${deptId}`,
        //     data: null,
        //     dataType: "json",
        //     success: function (response) {
        //         resolve(response);
        //     },
        //     error : function (error) {
        //         reject(error)
        //     }
        // });
    })
}

// ===================================
// REDUCTION
// ===================================
const apiGetRDetailDropdown = (ids = '') => {
    return new Promise((resolve, reject) => {
        callApi(`${webAdminUrl}/reduction/getassetdropdown?ids=${ids}`).then((response)=>{
            resolve(response);
        })
        // $.ajax({
        //     type: "GET",
        //     url: `${webAdminUrl}/reduction/getassetdropdown?ids=${ids}`,
        //     data: null,
        //     dataType: "json",
        //     success: function (response) {
        //         resolve(response);
        //     },
        //     error : function (error) {
        //         reject(error)
        //     }
        // });
    })
}

// ===================================
// TRANSFER
// ===================================
const apiGetTransferDropdown = (ids = '') => {
    return new Promise((resolve, reject) => {
        callApi(`${webAdminUrl}/transfer/getdetaildropdown`,{ids : ids}).then((response)=>{
            resolve(response);
        })
        // $.ajax({
        //     type: "POST",
        //     url: `${webAdminUrl}/transfer/getdetaildropdown`,
        //     data: {ids : ids},
        //     dataType: "json",
        //     success: function (response) {
        //         resolve(response);
        //     },
        //     error : function (error) {
        //         reject(error)
        //     }
        // });
    })
}

// ===================================
// ASSET
// ===================================
const apiGetS2AssetTypeDept = (deptId = 0, data = {}) => {
    return new Promise((resolve, reject) => {
        callApi(`${webAdminUrl}/asset/gets2assettypedept/${deptId}`,data).then((response)=>{
            resolve(response);
        })
        // $.ajax({
        //     type: "GET",
        //     url: `${webAdminUrl}/asset/gets2assettypedept/${deptId}`,
        //     data: data,
        //     dataType: "json",
        //     success: function (response) {
        //         resolve(response);
        //     },
        //     error : function (error) {
        //         reject(error)
        //     }
        // });
    })
}

const apiGetS2AssetDept = (deptId = 0) => {
    return new Promise((resolve, reject) => {
        callApi(`${webAdminUrl}/asset/gets2assetdept/${deptId}`).then((response)=>{
            resolve(response);
        })
        // $.ajax({
        //     type: "GET",
        //     url: `${webAdminUrl}/asset/gets2assetdept/${deptId}`,
        //     data: null,
        //     dataType: "json",
        //     success: function (response) {
        //         resolve(response);
        //     },
        //     error : function (error) {
        //         reject(error)
        //     }
        // });
    })
}

const apiGetAssetByCode = (code = 0) => {
    return new Promise((resolve, reject) => {
        callApi(`${webAdminUrl}/asset/getassetbycode/${code}`).then((response)=>{
            resolve(response);
        })
        // $.ajax({
        //     type: "GET",
        //     url: `${webAdminUrl}/asset/getassetbycode/${code}`,
        //     data: null,
        //     dataType: "json",
        //     success: function (response) {
        //         resolve(response);
        //     },
        //     error : function (error) {
        //         reject(error)
        //     }
        // });
    })
}

// ===================================
// LOCATION
// ===================================

const apiGetS2DistrictCity = (cityId = 0) => {
    return new Promise((resolve, reject) => {
        callApi(`${webAdminUrl}/assettype/gets2districtcity/${cityId}`).then((response)=>{
            resolve(response);
        })
        // $.ajax({
        //     type: "GET",
        //     url: `${webAdminUrl}/assettype/gets2districtcity/${cityId}`,
        //     data: null,
        //     dataType: "json",
        //     success: function (response) {
        //         resolve(response);
        //     },
        //     error : function (error) {
        //         reject(error)
        //     }
        // });
    })
}

const apiGetS2WardDistrict = (dId = 0) => {
    return new Promise((resolve, reject) => {
        callApi(`${webAdminUrl}/assettype/gets2warddistrict/${dId}`).then((response)=>{
            resolve(response);
        })
        // $.ajax({
        //     type: "GET",
        //     url: `${webAdminUrl}/assettype/gets2warddistrict/${dId}`,
        //     data: null,
        //     dataType: "json",
        //     success: function (response) {
        //         resolve(response);
        //     },
        //     error : function (error) {
        //         reject(error)
        //     }
        // });
    })
}

// ===================================
// BACKUP
// ===================================
const apiGetDownloads = (ids = '') => {
    return new Promise((resolve, reject) => {
        callApi(`${webAdminUrl}/backup/getdownloads/${ids}`).then((response)=>{
            resolve(response);
        })
        // $.ajax({
        //     type: "GET",
        //     url: `${webAdminUrl}/backup/getdownloads/${ids}`,
        //     data: null,
        //     dataType: "json",
        //     success: function (response) {
        //         resolve(response);
        //     },
        //     error : function (error) {
        //         reject(error)
        //     }
        // });
    })
}