<div class="container-fluid">
    <div class="row">
        <div class="col-md-12 pull-left">
            <div class="card p-15">
                <p class="text-justify">
                    Bộ phận SUPPORT PHYSICS tiếp nhận các yêu cầu hỗ trợ kỹ thuật, phối hợp và xử
                    lý sự cố từ của khách hàng.
                    Chúng tôi tiến hành xác nhận các yêu cầu bao gồm các thông tin như sau:
                </p>
                <p class="pl-3" style="margin: 0px; line-height: 1.5;"> - Mức độ yêu cầu: bình thường, khẩn,
                    nghiêm trọng;</p>
                <p class="pl-3" style="margin: 0px; line-height: 1.5;"> - Phạm vi hỗ trợ kỹ thuật, phối hợp và xử lý
                    sự cố xảy ra theo cá nhân, tổ chức (máy cá nhân,
                    mạng máy tính);</p>
                <p class="pl-3" style="margin: 0px; line-height: 1.5;"> - Địa điểm.</p>
            </div>
        </div>
        <div class="col-md-12">
            <div class="card p-t-15 p-b-15">
                <div class="col-md-12 pull-left">
                    <?php foreach ($packages as $key => $value) { ?>
                    <?php if($key != 0 && $key%2==0){ ?>
                </div>
                <div class="col-md-12 pull-left">
                    <div class="col-md-6 pull-left">
                        <h4 class="text-primary text-uppercase" style="font-weight: bold">{{value.name}}</h4>
                        <article class="text-justify">{{value.note}}</article>
                    </div>
                    <?php } else{ ?>
                    <div class="col-md-6 pull-left">
                        <h4 class="text-primary text-uppercase" style="font-weight: bold">{{value.name}}</h4>
                        <article class="text-justify">{{value.note}}</article>
                    </div>
                    <?php } ?>
                    <?php } ?>
                </div>
            </div>

        </div>
    </div>
</div>