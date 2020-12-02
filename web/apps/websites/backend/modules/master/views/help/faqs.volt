<div class="content-header">
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-6 d-flex align-items-center">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="<?= WEB_ADMIN_URL ?>"><i class="fas fa-home"></i></a></li>
                    <li class="breadcrumb-item active">{{ title }}</li>
                </ol>
            </div>
        </div>
    </div>
</div>

<div class="col-md-12">
    <div class="col-md-12">
        <?php echo $this->flashSession->output(); ?>
    </div>
</div>

<section class="content col-md-12">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-10 col-md-12 mx-auto">
                <div class="accordion mt-4" id="faqExample">
                    <div class="card">
                        <div class="card-header p-2" id="headingOne">
                            <h5 class="mb-0">
                                <button class="btn btn-link btn-hnn btn-hnn-default collapsed" type="button" data-toggle="collapse"
                                    data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne"><span>Q: Làm thế nào để thêm mới tài sản?</span>

                                </button>
                            </h5>
                        </div>

                        <div id="collapseOne" class="collapse" aria-labelledby="headingOne"
                            data-parent="#faqExample">
                            <div class="card-body">
                                <b>Trả lời:</b> Bạn vào mục Tài sản ở mục menu bên trái sau đó nhấn nút thêm để thêm mơi tài sản. <br/>Bạn có thể đọc thêm hướng dẫn sử dụng.<br/><a href="/admin/help/faqs">Tài liệu hướng dẫn</a> 
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header p-2" id="headingTwo">
                            <h5 class="mb-0">
                                <button class="btn btn-link btn-hnn btn-hnn-default collapsed" type="button" data-toggle="collapse"
                                    data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo"><span>Q: Làm thế nào để thêm mới cùng lúc nhiều tài sản?</span>

                                </button>
                            </h5>
                        </div>

                        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
                            data-parent="#faqExample">
                            <div class="card-body">
                                <b>Trả lời:</b> Để thêm mới một lúc nhiều tài sản bạn có thể dùng tình năng nhập tài sản bằng file excel.
                                <br/>Bước 1: Bạn vào mục Tài sản ở mục menu bên trái sau đó nhấn nút nhập tài sản.
                                <br/>Bước 2: Chọn Tải biểu mẫu để về tập tin excel.
                                <br/>Bước 3: Điền thông tin tài sản theo hướng dẫn trên tập tin excel đã tài về.
                                <br/>Bước 4: Quay lại giao diện nhập tài sản sau đó tải tập tin đã điền thông tin và nhấn nút nhập dữ liệu để hoàn tất.
                                <br/><a href="/admin/help/faqs">Tài liệu hướng dẫn</a> 
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header p-2" id="headingThree">
                            <h5 class="mb-0">
                                <button class="btn btn-link collapsed btn-hnn btn-hnn-default" type="button" data-toggle="collapse"
                                    data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                    <span>Q: Làm thế nào để chỉnh sửa thông tin tài sản?</span>
                                </button>
                            </h5>
                        </div>
                        <div id="collapseThree" class="collapse" aria-labelledby="headingThree"
                            data-parent="#faqExample">
                            <div class="card-body">
                                <b>Trả lời:</b> Bạn vào mục Tài sản ở mục menu bên trái sau đó nhấn vào tài sản bạn muốn chỉnh sửa để mở giao diện xem chi tiết sau đó nhấn vào nút sửa để cập nhật lại thông tin bạn muốn. <br/>Bạn có thể đọc thêm hướng dẫn sử dụng. <br/><a href="/admin/help/faqs">Tài liệu hướng dẫn</a>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header p-2" id="headingFour">
                            <h5 class="mb-0">
                                <button class="btn btn-link collapsed btn-hnn btn-hnn-default" type="button" data-toggle="collapse"
                                    data-target="#collapseFour" aria-expanded="false"
                                    aria-controls="collapseFour">
                                    <span>Q. Làm thế nào để ẩn đi các tính năng không sử dụng?</span>
                                </button>
                            </h5>
                        </div>
                        <div id="collapseFour" class="collapse" aria-labelledby="headingFour"
                            data-parent="#faqExample">
                            <div class="card-body">
                                <b>Trả lời:</b> Bạn vào mục Quản trị hệ thống > Cài đặt > Tính năng bỏ chọn những tính năng bạn cho là không cần thiết. Chú ý: Tài khoản bạn phải có quyền tương ứng mới có thể thực hiện thao tác này. <br/>Bạn có thể đọc thêm hướng dẫn sử dụng. <br/><a href="/admin/help/faqs">Tài liệu hướng dẫn</a>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header p-2" id="headingFive">
                            <h5 class="mb-0">
                                <button class="btn btn-link collapsed btn-hnn btn-hnn-default" type="button" data-toggle="collapse"
                                    data-target="#collapseFive" aria-expanded="false"
                                    aria-controls="collapseFive">
                                    <span>Q. Làm thế nào để thêm mới tài khoản?</span>
                                </button>
                            </h5>
                        </div>
                        <div id="collapseFive" class="collapse" aria-labelledby="headingFive"
                            data-parent="#faqExample">
                            <div class="card-body">
                                <b>Trả lời:</b> Bạn vào mục Quản trị hệ thống > Tài khoản người dùng sau đó chọn Thêm để mới tài khoản. Chú ý: Tài khoản bạn phải có quyền tương ứng mới có thể thực hiện thao tác này. <br/>Bạn có thể đọc thêm hướng dẫn sử dụng. <br/><a href="/admin/help/faqs">Tài liệu hướng dẫn</a>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header p-2" id="headingSix">
                            <h5 class="mb-0">
                                <button class="btn btn-link collapsed btn-hnn btn-hnn-default" type="button" data-toggle="collapse"
                                    data-target="#collapseSix" aria-expanded="false"
                                    aria-controls="collapseSix">
                                    <span>Q. Làm thế nào để thêm mới tài khoản?</span>
                                </button>
                            </h5>
                        </div>
                        <div id="collapseSix" class="collapse" aria-labelledby="headingSix"
                            data-parent="#faqExample">
                            <div class="card-body">
                                <b>Trả lời:</b> Bạn vào mục Quản trị hệ thống > Tài khoản người dùng sau đó chọn Thêm để mới tài khoản. Chú ý: Tài khoản bạn phải có quyền tương ứng mới có thể thực hiện thao tác này. <br/>Bạn có thể đọc thêm hướng dẫn sử dụng. <br/><a href="/admin/help/faqs">Tài liệu hướng dẫn</a>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header p-2" id="headingSeven">
                            <h5 class="mb-0">
                                <button class="btn btn-link collapsed btn-hnn btn-hnn-default" type="button" data-toggle="collapse"
                                    data-target="#collapseSeven" aria-expanded="false"
                                    aria-controls="collapseSeven">
                                    <span>Q. Làm thế nào để tạo tài khoản người dùng cho hệ thống này? (người có vai trò quản lý tài sản)</span>
                                </button>
                            </h5>
                        </div>
                        <div id="collapseSeven" class="collapse" aria-labelledby="headingSeven"
                            data-parent="#faqExample">
                            <div class="card-body">
                                <b>Trả lời:</b><br/> 
                                <ul>
                                    <li>Bước 1: Xác định tài khoản này có những quyền hạn và vai trò gì? (Ví dụ: có nhiều quyền hạn nhất là admin, sau đó là Manager, sau đó nữa là tài khoản chỉ vào Xem)</li>
                                    <li>Bước 2: Vào mục Quản trị hệ thống >>  chọn Tài khoản người dùng >> nhấn nút Thêm</li>
                                    <li>Bước 3: Tại giao diện ở bước này, điền đầy đủ các thông tin cần thiết để tạo tài khoản như Tên tài khoản, Họ và Tên, Mật khẩu,  … và lưu ý chọn đúng Nhóm người dùng để gán đúng quyền – tương ứng với vai trò của người đó trên hệ thống</li>
                                    <li>Bước 4: Nhấn nút Thêm mới để hoàn tất thao tác tạo tài khoản người dùng</li>
                                </ul>
                                <br/>Bạn có thể đọc thêm hướng dẫn sử dụng. <br/><a href="/admin/help/faqs">Tài liệu hướng dẫn</a>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header p-2" id="headingEight">
                            <h5 class="mb-0">
                                <button class="btn btn-link collapsed btn-hnn btn-hnn-default" type="button" data-toggle="collapse"
                                    data-target="#collapseEight" aria-expanded="false"
                                    aria-controls="collapseEight">
                                    <span>Q. Làm thế nào để thêm mới một Trang thiết bị?</span>
                                </button>
                            </h5>
                        </div>
                        <div id="collapseEight" class="collapse" aria-labelledby="headingEight"
                            data-parent="#faqExample">
                            <div class="card-body">
                                <b>Trả lời:</b><br/> 
                                <ul>
                                    <li>Bước 1: Vào mục Trang thiết bị >> chọn Danh sách Trang thiết bị >> nhấn Thêm</li>
                                    <li>Bước 2: Tại giao diện ở bước này, điền các thông tin về Trang thiết bị. Nếu các thông tin về Loại trang thiết bị hay Danh mục trang thiết bị chưa có (do chưa khai báo thông tin) thì xem thêm hướng dẫn cách Tạo loại vật tư và tạo Danh mục trang thiết bị</li>
                                    <li>Bước 3: Nhấn nút Thêm để hoàn tất thao tác thêm một vật tư mới</li>
                                </ul>
                                <br/>Bạn có thể đọc thêm hướng dẫn sử dụng. <br/><a href="/admin/help/faqs">Tài liệu hướng dẫn</a>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header p-2" id="headingNine">
                            <h5 class="mb-0">
                                <button class="btn btn-link collapsed btn-hnn btn-hnn-default" type="button" data-toggle="collapse"
                                    data-target="#collapseNine" aria-expanded="false"
                                    aria-controls="collapseNine">
                                    <span>Q. Làm thế nào để tạo Phiếu nhập Trang thiết bị?</span>
                                </button>
                            </h5>
                        </div>
                        <div id="collapseNine" class="collapse" aria-labelledby="headingNine"
                            data-parent="#faqExample">
                            <div class="card-body">
                                <b>Trả lời:</b><br/> 
                                <ul>
                                    <li>Bước 1: Vào mục Trang thiết bị >> chọn Phiếu nhập vật tư >> nhấn nút Thêm</li>
                                    <li>Bước 2: Tại giao diện ở bước này, thêm các thông tin cần thiết cho Phiếu</li>
                                    <li>Bước 3: Nhấn nút Thêm để hoàn thành việc tạo Phiếu nhập vật tư</li>
                                    <li>Bước 4: Thêm vật tư vào phiếu, nhấn nút Thêm tại dòng Danh sách vật tư</li>
                                    <li>Bước 5: Tại giao diện thêm mới vật tư: chọn Trang thiết bị từ danh sách xổ xuống, và điền vào số lượng tương ứng</li>
                                    <li>Bước 6: Nhấn Thêm mới để thêm vật tư cho phiếu nhập</li>
                                </ul>
                                <br/>Bạn có thể đọc thêm hướng dẫn sử dụng. <br/><a href="/admin/help/faqs">Tài liệu hướng dẫn</a>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header p-2" id="headingTen">
                            <h5 class="mb-0">
                                <button class="btn btn-link collapsed btn-hnn btn-hnn-default" type="button" data-toggle="collapse"
                                    data-target="#collapseTen" aria-expanded="false"
                                    aria-controls="collapseTen">
                                    <span>Q. Làm thế nào để tạo Phiếu xuất Trang thiết bị?</span>
                                </button>
                            </h5>
                        </div>
                        <div id="collapseTen" class="collapse" aria-labelledby="headingTen"
                            data-parent="#faqExample">
                            <div class="card-body">
                                <b>Trả lời:</b><br/> 
                                <ul>
                                    <li>Bước 1: Vào mục Trang thiết bị >> chọn Phiếu xuất vật tư >> nhấn nút Thêm</li>
                                    <li>Bước 2: Tại giao diện ở bước này, thêm các thông tin cần thiết cho Phiếu</li>
                                    <li>Bước 3: Nhấn nút Thêm để hoàn thành việc tạo Phiếu xuất vật tư</li>
                                </ul>
                                <br/>Bạn có thể đọc thêm hướng dẫn sử dụng. <br/><a href="/admin/help/faqs">Tài liệu hướng dẫn</a>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header p-2" id="headingTen">
                            <h5 class="mb-0">
                                <button class="btn btn-link collapsed btn-hnn btn-hnn-default" type="button" data-toggle="collapse"
                                    data-target="#collapseTen" aria-expanded="false"
                                    aria-controls="collapseTen">
                                    <span>Q. Làm thế nào để thêm Trang thiết bị vào phiếu xuất?</span>
                                </button>
                            </h5>
                        </div>
                        <div id="collapseTen" class="collapse" aria-labelledby="headingTen"
                            data-parent="#faqExample">
                            <div class="card-body">
                                <b>Trả lời:</b><br/> 
                                <ul>
                                    <li>Bước 1: Vào mục Trang thiết bị >> chọn Phiếu xuất vật tư >> chọn phiếu xuất tương ứng (Phiếu vừa tạo)</li>
                                    <li>Bước 2: Ở phần Danh sách vật tư, nhấn nút Thêm</li>
                                    <li>Bước 3: Tại giao diện thêm mới vật tư, chọn Trang thiết bị tương ứng từ danh sách xổ xuống và điền thông tin số lượng tương ứng</li>
                                    <li>Bước 4: Nhấn nút Thêm mới để hoàn thành</li>
                                </ul>
                                <br/>Bạn có thể đọc thêm hướng dẫn sử dụng. <br/><a href="/admin/help/faqs">Tài liệu hướng dẫn</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>