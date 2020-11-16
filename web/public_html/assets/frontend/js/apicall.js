const getPostByCatId = (id, deptid = 1, limit = 5) => {
    return new Promise((resolve, reject) => {
        $.ajax({
            type: "GET",
            url: `/api-posts/getdataposts`,
            data: {deptid : deptid, limit : limit, catid : id},
            dataType: "json",
            success: function (response) {
                resolve(response);
            },
            error : function (error) {
                reject(error)
            }
        });
    })
}

const changeLang = (langid) => {
    return new Promise((resolve, reject) => {
        $.ajax({
            type: "GET",
            url: `/api/changelanguage/${langid}`,
            data: null,
            dataType: "json",
            success: function (response) {
                window.location.reload();
            },
            error : function (error) {
                window.location.reload();
            }
        });
    })
}