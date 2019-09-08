      <!-- breadcrumb start -->
      <!-- ================ -->
      <?= $this->partial('breadcrumb') ?>
      <!-- breadcrumb end -->

      <!-- main-container start -->
      <!-- ================ -->
      <section class="main-container">
          <div class="container">
              <div class="row">

                  <!-- main start -->
                  <!-- ================ -->
                  <div class="main col-lg-9">
                      <!-- blogpost start -->
                      <!-- ================ -->
                      <article class="blogpost full">
                          <header>
                                <h2><?= $post->title ?></h2>
                                <div class="post-info mb-4">
                                    <span class="post-date">
                                        <i class="fa fa-calendar-o pr-1"></i>
                                        <span class="day"><?php echo $this->helper->datetime_vn($post->calendar) ?></span>
                                    </span>
                                </div>
                          </header>
                          <div class="blogpost-content">
                            <?php if($post->featured_image) : ?>
                                <div class="w-100">
                                    <div class="overlay-container d-flex justify-content-center">
                                        <img src="<?php echo FRONTEND_URL.$post->featured_image ?>" alt="<?= $post->title ?>">
                                        <a class="overlay-link popup-img"
                                            href="<?php echo FRONTEND_URL.$post->featured_image ?>"><i
                                                class="fa fa-search-plus"></i></a>
                                    </div>
                                </div>
                                <?php endif ?>
                                <hr>
                                <div class="mt-2">
                                    <?= $post->content ?>
                                </div>
                          </div>
                          <footer class="clearfix">
                              <!-- <div class="tags pull-left"><i class="fa fa-tags pr-1"></i> <a href="#">tag 1</a>, <a
                                      href="#">tag 2</a>, <a href="#">long tag 3</a></div> -->
                              <div class="link pull-right">
                                  <ul
                                      class="social-links circle small colored clearfix margin-clear text-right animated-effect-1">
                                      <li class="twitter"><a href="#"><i class="fa fa-twitter"></i></a></li>
                                      <li class="googleplus"><a href="#"><i class="fa fa-google-plus"></i></a></li>
                                      <li class="facebook"><a href="#"><i class="fa fa-facebook"></i></a></li>
                                  </ul>
                              </div>
                          </footer>
                      </article>
                      <!-- blogpost end -->
                  </div>
                  <!-- main end -->

                  <!-- sidebar start -->
                  <!-- ================ -->
                  <aside class="col-lg-3 col-xl-3 ml-xl-auto">
                      <?= $this->partial('sidebar') ?>
                  </aside>
                  <!-- sidebar end -->

              </div>
          </div>
      </section>
      <!-- main-container end -->