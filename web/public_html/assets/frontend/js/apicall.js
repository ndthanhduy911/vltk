const getPostByCatId = (id, dept_id = 1, limit = 5) => {
    return new Promise((resolve, reject) => {
        $.ajax({
            type: "GET",
            url: `/api-posts/getdataposts/${id}`,
            data: {dept_id : dept_id, limit : limit},
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

const changeLang = (lang_id) => {
    return new Promise((resolve, reject) => {
        $.ajax({
            type: "GET",
            url: `/faculty-api/changelanguage/${lang_id}`,
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