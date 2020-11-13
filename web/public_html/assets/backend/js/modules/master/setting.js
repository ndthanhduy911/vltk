$('#features .features').on('change', function (e) {
    e.preventDefault();
    let feature_id = $(this).val()
    let view = $(this).is(":checked") ? 1 : 0
    $.ajax({
        type: "POST",
        url: `${webAdminUrl}/setting/ajax_features`,
        data: {
            feature_id : feature_id,
            view : view
        },
        dataType: "json",
        success: function (response) {
            if(view){
                $(`li[data-features="${feature_id}"]`).removeClass('hidden');
            }else{
                $(`li[data-features="${feature_id}"]`).addClass('hidden');
            }
        }
    });
});