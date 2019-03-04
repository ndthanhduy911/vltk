<?php
/**
 * Created by PhpStorm.
 * User: huynguyen
 * Date: 10/4/14
 * Time: 9:22 AM
 */

namespace Library\Constant;


class Constant
{

    public $itemPerPageSizeHome = 5;
    public $itemPerPageSizeNomal = 20;
    public $itemPerPageSizeLarge = 100;
    public $rangePagination = 10;

    /*------------------------------------define_path_image_message----------------------------*/
    public $prefixPath = 'http://myceleb.vn/';
    public $pathNoImage = 'https://lh4.googleusercontent.com/-5DbIuyGBNOY/VJz1tecKH4I/AAAAAAAADPQ/VEZ7YJQNNKQ/w400-h300-no/noimage.png';
    public $pathNoAvatar = 'https://lh4.googleusercontent.com/--SoUXCmejrs/VMr2Dvi7UyI/AAAAAAAAD1M/7Vna8-XynTQ/s300-no/ad516503a11cd5ca435acc9bb6523536.png';

    public $pathImageAvatarUser = 'files/user/avatar/';
    public $pathImageNormalAvatarUser = 'files/user/avatar/thumbnails/75_75/';

    public $pathImageAvatarMember = 'files/member/avatar/';
    public $pathImageNormalAvatarMember = 'files/member/avatar/thumbnails/100_100/';


    public $pathImageAlbumMusic =  'files/music/album/';
    public $pathImageNormalAlbumMusic = 'files/music/album/thumbnails/250_250/';

    public $pathMainImageMovie = 'files/movie/main/';
    public $pathCoverImageMovie = 'files/movie/cover/';

    public $pathMainImageNormalMovie = 'files/movie/main/thumbnails/250_250/';
    public $pathCoverImageNormalMovie = 'files/movie/cover/thumbnails/250_250/';

    public $pathMainImageAlbumPhoto = 'files/photo/album_photo/main/';
    public $pathCoverImageAlbumPhoto = 'files/photo/album_photo/cover/';

    public $pathMainImageNormalAlbumPhoto = 'files/photo/album_photo/main/thumbnails/500_500/';
    public $pathCoverImageNormalAlbumPhoto = 'files/photo/album_photo/cover/thumbnails/500_500/';

    public $pathImagePhoto = 'files/photo/photo/';
    public $pathImageNormalPhoto = 'files/photo/photo/thumbnails/500_500/';
    public $pathImageMediumPhoto = 'files/photo/photo/medium/';

    public $pathImageShow = 'files/show/';
    public $pathImageNormalShow = 'files/show/thumbnails/250_250/';

    public $pathImageEvent = 'files/event/';
    public $pathImageNormalEvent = 'files/event/thumbnails/250_250/';

    public $pathImageNews = 'files/news/';
    public $pathImageNormalNews = 'files/news/thumbnails/250_250/';

    public $pathImageFilm = 'files/images/';
    public $pathImageNormalFilm = 'files/images/thumbnails/250_250/';

    public $pathImageShopProduct = 'files/shop/product/';
    public $pathImageNormalShopProduct = 'files/shop/product/thumbnails/250_250/';

    public $pathImageHomeSlide = 'files/home/slide/';
    public $pathImageNormalHomeSlide = 'files/home/slide/thumbnails/250_250/';
    
    public $pathImageHomeNotification = 'files/home/notification/';
    public $pathImageNormalHomeNotification = 'files/home/notification/thumbnails/250_250/';

    public $pathImageCeleb = 'files/celeb/image/';
    public $pathImageNormalCeleb = 'files/celeb/image/thumbnails/250_250/';

    public $pathFolderCeleb = 'files/celeb/';

    public $pathAudioCeleb = 'files/celeb/audio/';

    public $pathMovieCeleb = 'files/celeb/movie/';

    public $pathImageFanzoneProduct = 'files/fanzone/fanzone_product/image/';
    public $pathImageNormalFanzoneProduct = 'files/fanzone/fanzone_product/image/thumbnails/250_250/';

    public $pathFolderFanzoneProduct = 'files/fanzone/fanzone_product/';


    public $pathSong = 'files/music/song/';
    public $pathMovie = 'files/movie/movie/';
    /*------------------------------------end_define_error_message----------------------------*/

    /*------------------------------------define_error_message----------------------------*/
    public $errorMessageIsNotNumeric = "không phải là số";
    public $errorMessageIsNotFound = "không tìm thấy";
    public $errorMessageIsWrong = "sai";
    public $errorMessageIsExist = "đã tồn tại";
    /*------------------------------------define_error_message----------------------------*/

    /*------------------------------------define_message----------------------------*/
    public $messageRequestFriend = " yêu cầu kết bạn ";
    public $messageAcceptFriend = " chấp nhận yêu cầu kết bạn ";
    public $messageComment = " bình luận ";
    public $messageLikeObjectPost = " thích ";
    public $messageLikeComment = " thích bình luận ";
    public $messageRatingObjectPost = " rating ";
    public $messageOfYou = " của bạn ";
    public $messageToYou = " với bạn ";
    public $messageHasDo = " đã ";
    public $clearCacheSuccess = "Xóa cache thành công";
    /*------------------------------------define_message----------------------------*/

    public $keyCache = array(
        'music' => array(
            'name'				=> 'music',
            'getListAlbumMusic'         => 'getListAlbumMusic',
            'getAlbumMusicById'         => 'getAlbumMusicById',
            'searchListAlbumMusic'      => 'searchListAlbumMusic',
            'getSongInAlbumMusic'       => 'getSongInAlbumMusic',
            'getMusicById'                  => 'getMusicById'
        ),
        'celeb' => array(
            'name'                          => 'celeb',
            'getListCelebs'                 => 'getListCelebs',
            'getCelebById'                  => 'getCelebById',
        ),
        'fanzoneChat'   => array(
            'name'                          => 'fanzoneChat',
            'getListMessages'               => 'getListMessages',
            'getMessageById'                => 'getMessageById'
        ),
        'fanzoneProduct'    => array(
            'name'                          => 'fanzoneProduct',
            'getListFanzoneProduct'         => 'getListFanzoneProduct',
            'getFanzoneProductById'         => 'getFanzoneProductById'
        ),
        'event'            => array(
            'name'                          => 'events',
            'getListEvents'                 => 'getListEvents',
            'searchEventByName'             => 'searchEventByName',
            'getEventById'                  => 'getEventById'
        ),
        'profile'       => array(
            'name'                          => 'profile',
            'getListProfiles'               => 'getListProfiles',
            'getProfileById'                => 'getProfileById',
            'getMessageProfileId'           => 'getMessageProfileId',
            'getTypeUserById'               => 'getTypeUserById',
            'searchFriendsByName'           => 'searchFriendsByName',
            'getTopUsers'                   => 'getTopUsers',
            'searchTopUsers'                => 'searchTopUsers',
            'statisticPointUserById'        => 'statisticPointUserById'
        ),
        'member'    => array(
            'getMemberById'                 => 'getMemberById',
            'getFriendsByMember'      => 'getFriendsByMember',
            'searchFriendByMember'          => 'searchFriendByMember',
            'getTopMember'                  => 'getTopMember',
            'searchTopMember'               => 'searchTopMember',
            'getMessagesByMember'           => 'getMessagesByMember',
            'statisticPointMemberByMonth'   => 'statisticPointMemberByMonth',
            'statisticPointMemberByWeek'    => 'statisticPointMemberByWeek'
        ),
        'shop'      => array(
            'name'                          => 'shop',
            'getListShopsByType'            => 'getListShopsByType',
            'getListProductOrther'          => 'getListProductOrther',
            'getProductOrtherById'          => 'getProductOrtherById',
            'getListProductInCart'          => 'getListProductInCart',
            'getCartById'                   => 'getCartById',
            'getProductInCart'              => 'getProductInCart'
        ),
        'show'      => array(
            'name'                          => 'show',
            'getListShows'                  => 'getListShows',
            'getListShowsByMonth'           => 'getListShowsByMonth',
            'getListShowsByDay'             => 'getListShowsByDay',
            'searchShowsByTitle'             =>'searchShowsByTitle',
            'getShowById'                   => 'getShowById'
        ),
        'chat'  => array(
            'name'                          => 'chat',
            'getListMessagesByTwoUserId'    => 'getListMessagesByTwoUserId',
        ),
        'comment'   => array(
            'name'                          => 'comment',
            'getListCommentByObject'        => 'getListCommentByObject'
        ),
        'like'      => array(
            'name'                          => 'like',
            'getListLikeByObject'           => 'getListLikeByObject',
            'checkLikeByObject'             => 'checkLikeByObject'
        ),
        'share'      => array(
            'name'                          => 'share',
            'getListShareByObject'           => 'getListShareByObject',
            'checkShareByObject'             => 'checkShareByObject'
        ),
        'view'      => array(
            'name'                          => 'view',
            'getListViewByObject'           => 'getListViewByObject',
            'checkViewByObject'             => 'checkViewByObject'
        ),
        'rating'     => array(
            'name'                          => 'rating',
            'getListRatingByObject'         => 'getListRatingByObject'
        ),
        'notification'  => array(
            'name'                          => 'notification',
            'getListNotificationsByUserId'  => 'getListNotificationsByUserId'
        ),
        'albumMusic' => array(
            'name'							=> 'albumMusic',
            'listAlbumMusic'         		=> 'listAlbumMusic',
            'searchListAlbumMusic'         	=> 'searchListAlbumMusic',
            'getSongByAlbumMusic'			=> 'getSongByAlbumMusic',
            'getCodeSms'					=> 'getCodeSms',
            'getAlbumMusicById'             => 'AlbumMusicById'
        ),
        'movie'      => array(
            'name'                          => 'movie',
            'getMovieById'                  => 'getMovieById',
            'getListMovieByType'            => 'getListMovieByType',
            'searchMovieByName'             => 'searchMovieByName',
            'getListAlbumMovie'             => 'getListAlbumMovie',
            'getAlbumMovieById'             => 'getAlbumMovieById',
            'getListMovieInAlbum'           => 'getListMovieInAlbum'
        ),
        'albumPhoto' => array(
            'name'							=> 'albumPhoto',
            'listAlbumPhoto'         		=> 'listAlbumPhoto',
            'searchAlbumPhotoByName'	    => 'searchAlbumPhotoByName',
            'getAlbumPhotoById'			    => 'getAlbumPhotoById',
            'getPhotoByAlbumPhotoId'   		=> 'getPhotoByAlbumPhotoId',
            'getPhotoById'					=> 'getPhotoById'
        ),
        'news' => array(
            'name'      =>'news',
            'detail'    => 'news_detail',
            'DetailHome'    => 'DetailHome',
            'getListNewsByType' => 'getListNewsByType',
            'searchNewsByName'    => 'searchNewsByName',
            'getNewsById'         => 'getNewsById'
        ),
        'home' => array(
            'name'      =>'home',
            'slide'    => 'slide',
            'DetailHome'    => 'DetailHome',
            'Chats'    => 'Chats',
            'music'    => 'music',
            'notification'    => 'notification',
            'event'         => 'event',
            'chat'          => 'chat',
            'music'         => 'music',
            'notification'  => 'notification'
        ),
        'point' => array(
            'getPointByType' => 'getPointByType'
        ),
        'object' => array(
            'getObjectByType' => 'getObjectByType'
        ),
    );

} 
