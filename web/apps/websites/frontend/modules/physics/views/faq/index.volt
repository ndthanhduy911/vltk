<div class="container-fluid">
    <div class="row">
        <link rel="stylesheet" href="/assets/frontend/faq/css/reset.css">
        <link rel="stylesheet" href="/assets/frontend/faq/css/style.css">
        <!-- Resource style -->
        <script src="/assets/frontend/faq/js/modernizr.js"></script>
        <!-- Modernizr -->

        <section class="col-md-12">
            <div class="card p-15">
                <div class="cd-faq-items">
                    <?php $pack_id = $faqs[0]['package_id'] ?>
                    <ul class="cd-faq-group p-l-15 p-r-15">
                        <li class="cd-faq-title">
                            <h2 class="m-b-0">{{faqs[0]['package_name']}}</h2>
                        </li>
                        <?php foreach ($faqs as $key => $faq) { ?>
                        <?php if($faq['package_id'] !== $pack_id ){ ?>
                        <?php $pack_id = $faq['package_id'] ?>
                    </ul>
                    <ul class="cd-faq-group p-l-15 p-r-15">
                        <li class="cd-faq-title">
                            <h2 class="m-b-0">{{faq['package_name']}}</h2>
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
            </div>

        </section>
        <!-- cd-faq -->
        <!-- Resource jQuery -->
        <script src="/assets/frontend/faq/js/jquery-2.1.1.js"></script>
        <script src="/assets/frontend/faq/js/jquery.mobile.custom.min.js"></script>
        <script src="/assets/frontend/faq/js/main.js"></script>
        <!-- Resource jQuery -->
    </div>
</div>