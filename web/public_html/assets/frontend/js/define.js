const langId = $('#lang_id').attr('data-lang');
const fontendUrl = window.location.origin;
const deptId = $('#logo').attr('dept-id');

//Format number money
const number_format = (number, decimals, dec_point, thousands_sep, unit = "") => {
    // * example 1: number_format(1234.5678, 2, '.', '');
    // * returns 1: 1234.57

    var n = number,
        c = isNaN(decimals = Math.abs(decimals)) ? 2 : decimals;
    var d = dec_point == undefined ? "," : dec_point;
    var t = thousands_sep == undefined ? "." : thousands_sep,
        s = n < 0 ? "-" : "";
    var i = parseInt(n = Math.abs(+n || 0).toFixed(c)) + "",
        j = (j = i.length) > 3 ? j % 3 : 0;

    return (s + (j ? i.substr(0, j) + t : "") + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t) + (c ? d + Math.abs(n - i).toFixed(c).slice(2) : "") + ' ' + unit).trim();
}

// Format date Viet Nam
const vi_moment = (date, type) => {
    return moment(date, 'YYYY-MM-DD HH:mm:ss').format(type)
}

const getLinkPostBySlug = ($slug = null) => {
    return window.location.origin+'/news/' + $slug;
}

const getDatePost = ($date = null, calendar = null) => {
    return calendar ? vi_moment(calendar , 'DD/MM/YYYY') : vi_moment(date , 'DD/MM/YYYY');
}

const getTimePost = ($date = null, calendar = null) => {
    return calendar ? vi_moment(calendar , 'HH:mm') : vi_moment(date , 'HH:mm');
}

const changeTitleToSlug = (title, slug) => {
    $(title).change(function (e) { 
        e.preventDefault();
        $(slug).val(changeToSlug($(this).val()));
    });
}