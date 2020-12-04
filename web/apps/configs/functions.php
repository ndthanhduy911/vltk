<?php 
function requiredLabel($title = "Bắt buộc"){
    return "<a class='text-danger' data-toggle='tooltip' title='$title'>(*)</a>";
}

function cFL($attr,$lang,$key){
    if(!empty($lang)){
        $attr['name'] = $key."[{$lang[0]}]";
        $attr['id'] = $key.$lang[0];
        if(!$lang[1]){
            $attr['class'] = $attr['class'].' nvali';
        }
    }
    return $attr;
}