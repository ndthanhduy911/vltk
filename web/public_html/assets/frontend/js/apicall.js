const getPostByCatId = (id) => {
    return new Promise((resolve, reject) => {
        $.ajax({
            type: "GET",
            url: `/api-posts/getdataposts/`+id,
            data: null,
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