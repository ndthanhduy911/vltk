<?php use Models\Staff; 

    $npStaff = Staff::getNamepace();
    $mainStaffs = $this->modelsManager->createBuilder()
    ->columns(array(
        $npStaff.'.id',
        $npStaff.'.slug',
        $npStaff.'.featured_image',
        // $npStaff.'.position',
        'SL.title title',
        'SL.regency regency',
        'SL.content content'
    ))
    ->from($npStaff)
    ->leftJoin("Models\StaffLang", "SL.staff_id = $npStaff.id AND SL.lang_id = $lang_id",'SL')
    ->where("$npStaff.status = 1")
    ->inWhere($npStaff.".id", [1])
    ->getQuery()
    ->execute();

?>

<?= $this->partial('breadcrumb') ?>

<section class="main-container pt-4">
    <div class="container">
        <div class="row">
            <div class="main col-md-9">
                <h3 class="text-primary"><?= $this->ml->_ml_system('about', 'BAN CHỦ NHIỆM') ?></h3>
                <div class="separator-2"></div>
                <div class="row grid-space-10">
                    <div class="col-md-4">
                        <div class="team-member image-box style-2 dark-bg text-center">
                            <div class="overlay-container overlay-visible">
                                <img src="<?php echo FRONTEND_URL ?>/assets/frontend/images/team-member-1.jpg"
                                    alt="" width="100%">
                            </div>
                            <div class="body">
                                <h5 class="margin-clear">PGS.TS. LÊ VŨ TUẤN HÙNG</h5>
                                <small>TRƯỞNG KHOA</small>
                                <div class="separator mt-10"></div>
                                <a href="mailto:lvthung@hcmus.edu.vn" class="margin-clear btn btn-md-link link-light"><i
                                        class="pr-10 fa fa-envelope-o"></i>lvthung@hcmus.edu.vn</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="team-member image-box style-2 dark-bg text-center">
                            <div class="overlay-container overlay-visible">
                                <img src="<?php echo FRONTEND_URL ?>/assets/frontend/images/team-member-1.jpg"
                                    alt="" width="100%">
                            </div>
                            <div class="body">
                                <h5 class="margin-clear">PGS.TS. HUỲNH TRÚC PHƯƠNG</h5>
                                <small>PHÓ TRƯỞNG KHOA</small>
                                <div class="separator mt-10"></div>
                                <a href="mailto:htphuong@hcmus.edu.vn<" class="margin-clear btn btn-md-link link-light"><i
                                        class="pr-10 fa fa-envelope-o"></i>htphuong@hcmus.edu.vn</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="team-member image-box style-2 dark-bg text-center">
                            <div class="overlay-container overlay-visible">
                                <img src="<?php echo FRONTEND_URL ?>/assets/frontend/images/team-member-1.jpg"
                                    alt="" width="100%">
                            </div>
                            <div class="body">
                                <h5 class="margin-clear">PGS.TS. HUỲNH VĂN TUẤN</h5>
                                <small>PHÓ TRƯỞNG KHOA</small>
                                <div class="separator mt-10"></div>
                                <a href="mailto:hvtuan@hcmus.edu.vn" class="margin-clear btn btn-md-link link-light"><i
                                        class="pr-10 fa fa-envelope-o"></i>hvtuan@hcmus.edu.vn</a>
                            </div>
                        </div>
                    </div>
                </div>
                <br>
                <br>

                <h3 class="text-primary">BỘ MÔN VẬT LÝ LÝ THUYẾT </h3>
                <div class="separator-2"></div>
                <div class="w-100">
                    <div class="image-box team-member style-3-b">
                        <div class="row">
                            <div class="col-md-3 col-lg-3 col-xl-3">
                                <div class="overlay-container overlay-visible">
                                    <img src="<?php echo FRONTEND_URL ?>/assets/frontend/images/team-member-1.jpg"
                                        alt="" width="100%">
                                </div>
                            </div>
                            <div class="col-md-9 p-sm-0">
                                <div class="body mt-3">
                                    <h5 class="title margin-clear">PGS.TS. NGUYỄN QUỐC KHÁNH</h5>
                                    <div class="separator-2 mt-2"></div>
                                    <h5 class="m-0">TRƯỞNG BỘ MÔN</h5>
                                    <a href="mailto:nqkhanh@hcmus.edu.vn" class="btn btn-link pl-0 text-left"><i
                                            class="pr-10 margin-clear fa fa-envelope-o"></i>nqkhanh@hcmus.edu.vn</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <h3 class="text-primary">BỘ MÔN VẬT LÝ HẠT NHÂN - NGÀNH KỸ THUẬT HẠT NHÂN </h3>
                <div class="separator-2"></div>
                <div class="w-100">
                    <div class="image-box team-member style-3-b">
                        <div class="row">
                            <div class="col-md-3 col-lg-3 col-xl-3">
                                <div class="overlay-container overlay-visible">
                                    <img src="<?php echo FRONTEND_URL ?>/assets/frontend/images/team-member-1.jpg"
                                        alt="" width="100%">
                                </div>
                            </div>
                            <div class="col-md-9 p-sm-0">
                                <div class="body mt-3">
                                    <h5 class="title margin-clear">GS.TS. CHÂU VĂN TẠO</h5>
                                    <div class="separator-2 mt-2"></div>
                                    <h5 class="m-0">TRƯỞNG BỘ MÔN</h5>
                                    <a href="mailto:cvtao@hcmus.edu.vn" class="btn btn-link pl-0 text-left"><i
                                            class="pr-10 margin-clear fa fa-envelope-o"></i>cvtao@hcmus.edu.vn</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="image-box team-member style-3-b">
                        <div class="row">
                            <div class="col-md-3 col-lg-3 col-xl-3">
                                <div class="overlay-container overlay-visible">
                                    <img src="<?php echo FRONTEND_URL ?>/assets/frontend/images/team-member-1.jpg"
                                        alt="" width="100%">
                                </div>
                            </div>
                            <div class="col-md-9 p-sm-0">
                                <div class="body mt-3">
                                    <h5 class="title margin-clear">PGS.TS. TRẦN THIỆN THANH</h5>
                                    <div class="separator-2 mt-2"></div>
                                    <h5 class="m-0">PHÓ BỘ MÔN</h5>
                                    <a href="mailto:ttthanh@hcmus.edu.vn" class="btn btn-link pl-0 text-left"><i
                                            class="pr-10 margin-clear fa fa-envelope-o"></i>ttthanh@hcmus.edu.vn</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <h3 class="text-primary">BỘ MÔN VẬT LÝ CHẤT RẮN </h3>
                <div class="separator-2"></div>
                <div class="w-100">
                    <div class="image-box team-member style-3-b">
                        <div class="row">
                            <div class="col-md-3 col-lg-3 col-xl-3">
                                <div class="overlay-container overlay-visible">
                                    <img src="<?php echo FRONTEND_URL ?>/assets/frontend/images/team-member-1.jpg"
                                        alt="" width="100%">
                                </div>
                            </div>
                            <div class="col-md-9 p-sm-0">
                                <div class="body mt-3">
                                    <h5 class="title margin-clear">PGS.TS. TRẦN QUANG TRUNG</h5>
                                    <div class="separator-2 mt-2"></div>
                                    <h5 class="m-0">TRƯỞNG BỘ MÔN</h5>
                                    <a href="mailto:tqtrung@hcmus.edu.vn" class="btn btn-link pl-0 text-left"><i
                                            class="pr-10 margin-clear fa fa-envelope-o"></i>tqtrung@hcmus.edu.vn</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <h3 class="text-primary">BỘ MÔN VẬT LÝ ỨNG DỤNG </h3>
                <div class="separator-2"></div>
                <div class="w-100">
                    <div class="image-box team-member style-3-b">
                        <div class="row">
                            <div class="col-md-3 col-lg-3 col-xl-3">
                                <div class="overlay-container overlay-visible">
                                    <img src="<?php echo FRONTEND_URL ?>/assets/frontend/images/team-member-1.jpg"
                                        alt="" width="100%">
                                </div>
                            </div>
                            <div class="col-md-9 p-sm-0">
                                <div class="body mt-3">
                                    <h5 class="title margin-clear">PGS.TS. LÊ VŨ TUẤN HÙNG</h5>
                                    <div class="separator-2 mt-2"></div>
                                    <h5 class="m-0">TRƯỞNG BỘ MÔN</h5>
                                    <a href="mailto:youremail@domain.com" class="btn btn-link pl-0 text-left"><i
                                            class="pr-10 margin-clear fa fa-envelope-o"></i>lvthung@hcmus.edu.vn</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="image-box team-member style-3-b">
                        <div class="row">
                            <div class="col-md-3 col-lg-3 col-xl-3">
                                <div class="overlay-container overlay-visible">
                                    <img src="<?php echo FRONTEND_URL ?>/assets/frontend/images/team-member-1.jpg"
                                        alt="" width="100%">
                                </div>
                            </div>
                            <div class="col-md-9 p-sm-0">
                                <div class="body mt-3">
                                    <h5 class="title margin-clear">PGS.TS. VŨ THỊ HẠNH THU</h5>
                                    <div class="separator-2 mt-2"></div>
                                    <h5 class="m-0">PHÓ BỘ MÔN</h5>
                                    <a href="mailto:vththu@hcmus.edu.vn" class="btn btn-link pl-0 text-left"><i
                                            class="pr-10 margin-clear fa fa-envelope-o"></i>vththu@hcmus.edu.vn</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <h3 class="text-primary">BỘ MÔN VẬT LÝ ĐIỆN TỬ </h3>
                <div class="separator-2"></div>
                <div class="w-100">
                    <div class="image-box team-member style-3-b">
                        <div class="row">
                            <div class="col-md-3 col-lg-3 col-xl-3">
                                <div class="overlay-container overlay-visible">
                                    <img src="<?php echo FRONTEND_URL ?>/assets/frontend/images/team-member-1.jpg"
                                        alt="" width="100%">
                                </div>
                            </div>
                            <div class="col-md-9 p-sm-0">
                                <div class="body mt-3">
                                    <h5 class="title margin-clear">PGS.TS. NGUYỄN VĂN HIẾU</h5>
                                    <div class="separator-2 mt-2"></div>
                                    <h5 class="m-0">TRƯỞNG BỘ MÔN</h5>
                                    <a href="mailto:nvhieu@hcmus.edu.vn" class="btn btn-link pl-0 text-left"><i
                                            class="pr-10 margin-clear fa fa-envelope-o"></i>nvhieu@hcmus.edu.vn</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="image-box team-member style-3-b">
                        <div class="row">
                            <div class="col-md-3 col-lg-3 col-xl-3">
                                <div class="overlay-container overlay-visible">
                                    <img src="<?php echo FRONTEND_URL ?>/assets/frontend/images/team-member-1.jpg"
                                        alt="" width="100%">
                                </div>
                            </div>
                            <div class="col-md-9 p-sm-0">
                                <div class="body mt-3">
                                    <h5 class="title margin-clear">TS. NGUYỄN CHÍ NHÂN</h5>
                                    <div class="separator-2 mt-2"></div>
                                    <h5 class="m-0">PHÓ BỘ MÔN</h5>
                                    <a href="mailto:ncnhan@hcmus.edu.vn" class="btn btn-link pl-0 text-left"><i
                                            class="pr-10 margin-clear fa fa-envelope-o"></i>ncnhan@hcmus.edu.vn</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <h3 class="text-primary">BỘ MÔN VẬT LÝ TIN HỌC </h3>
                <div class="separator-2"></div>
                <div class="w-100">
                    <div class="image-box team-member style-3-b">
                        <div class="row">
                            <div class="col-md-3 col-lg-3 col-xl-3">
                                <div class="overlay-container overlay-visible">
                                    <img src="<?php echo FRONTEND_URL ?>/assets/frontend/images/team-member-1.jpg"
                                        alt="" width="100%">
                                </div>
                            </div>
                            <div class="col-md-9 p-sm-0">
                                <div class="body mt-3">
                                    <h5 class="title margin-clear">PGS.TS. HUỲNH VĂN TUẤN</h5>
                                    <div class="separator-2 mt-2"></div>
                                    <h5 class="m-0">TRƯỞNG BỘ MÔN</h5>
                                    <a href="mailto:hvtuan@hcmus.edu.vn" class="btn btn-link pl-0 text-left"><i
                                            class="pr-10 margin-clear fa fa-envelope-o"></i>hvtuan@hcmus.edu.vn</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <h3 class="text-primary">BỘ MÔN VẬT LÝ ĐỊA CẦU </h3>
                <div class="separator-2"></div>
                <div class="w-100">
                    <div class="image-box team-member style-3-b">
                        <div class="row">
                            <div class="col-md-3 col-lg-3 col-xl-3">
                                <div class="overlay-container overlay-visible">
                                    <img src="<?php echo FRONTEND_URL ?>/assets/frontend/images/team-member-1.jpg"
                                        alt="" width="100%">
                                </div>
                            </div>
                            <div class="col-md-9 p-sm-0">
                                <div class="body mt-3">
                                    <h5 class="title margin-clear">PGS.TS. NGUYỄN THÀNH VẤN</h5>
                                    <div class="separator-2 mt-2"></div>
                                    <h5 class="m-0">TRƯỞNG BỘ MÔN</h5>
                                    <a href="mailto:ntvan@hcmus.edu.vn" class="btn btn-link pl-0 text-left"><i
                                            class="pr-10 margin-clear fa fa-envelope-o"></i>ntvan@hcmus.edu.vn</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <h3 class="text-primary">BỘ MÔN HẢI DƯƠNG - KHÍ TƯỢNG - THỦY VĂN </h3>
                <div class="separator-2"></div>
                <div class="w-100">
                    <div class="image-box team-member style-3-b">
                        <div class="row">
                            <div class="col-md-3 col-lg-3 col-xl-3">
                                <div class="overlay-container overlay-visible">
                                    <img src="<?php echo FRONTEND_URL ?>/assets/frontend/images/team-member-1.jpg"
                                        alt="" width="100%">
                                </div>
                            </div>
                            <div class="col-md-9 p-sm-0">
                                <div class="body mt-3">
                                    <h5 class="title margin-clear">PGS.TS. VÕ LƯƠNG HỒNG PHƯỚC</h5>
                                    <div class="separator-2 mt-2"></div>
                                    <h5 class="m-0">TRƯỞNG BỘ MÔN</h5>
                                    <a href="mailto:vlhphuoc@hcmus.edu.vn" class="btn btn-link pl-0 text-left"><i
                                            class="pr-10 margin-clear fa fa-envelope-o"></i>vlhphuoc@hcmus.edu.vn</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <?= $this->partial('sidebar') ?>
            </div>
        </div>
    </div>
</section>