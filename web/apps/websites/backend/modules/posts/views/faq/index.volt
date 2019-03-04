<!-- Bread crumb -->
<div class="row page-titles">
    <div class="col-md-5 align-self-center">
        <h3 class="text-hnn font-weight-bold">CÂU HỎI THƯỜNG GẶP</h3>
    </div>
    <div class="col-md-7 align-self-center">
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a href="{{ url('/adcp/dashboard') }}">BẢNG ĐIỀU KHIỂN</a>
            </li>
            <li class="breadcrumb-item active">Câu hỏi thường gặp</li>
        </ol>
    </div>
</div>
<?php echo $this->flashSession->output() ?>
<!-- End Bread crumb -->
<div class="container-fluid">
    <!-- Start Page Content -->
    <div class="row">
        <link rel="stylesheet" href="/assets/backend/faq/css/style.css">
        <!-- Resource style -->
        <script src="/assets/frontend/faq/js/modernizr.js"></script>
        <!-- Modernizr -->
        <section class="col-md-12" style="padding: 30px">
            <div class="cd-faq-items">
                <?php $pack_id = $faqs[0]['package_id'] ?>
                <ul class="cd-faq-group">
                    <li class="cd-faq-title">
                        <h2>{{faqs[0]['package_name']}}</h2>
                    </li>
                <?php foreach ($faqs as $key => $faq) { ?>
                    <?php if($faq['package_id'] !== $pack_id ){ ?>
                    <?php $pack_id = $faq['package_id'] ?>
                    </ul>
                    <ul class="cd-faq-group">
                        <li class="cd-faq-title">
                            <h2>{{faq['package_name']}}</h2>
                        </li>
                    <?php } ?>
                    <li>
                        <a class="cd-faq-trigger" href="#{{faq['id']}}">{{faq['ask']}}</a>
                        <div class="cd-faq-content">
                            <article>
                                {{faq['answer']}}
                            </article>
                        </div>
                        <!-- cd-faq-content -->
                    </li>
                <?php } ?>
                </ul>
                
            </div>
            <!-- cd-faq-items -->
            <a href="#0" class="cd-close-panel">Đóng</a>
        </section>
        <!-- cd-faq -->
        <!-- Resource jQuery -->
    </div>
    <!-- End PAge Content -->
</div>