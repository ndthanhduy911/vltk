      <!-- breadcrumb start -->
      <!-- ================ -->
      {{ partial('breadcrumb') }}
      <!-- breadcrumb end -->

      <!-- main-container start -->
      <!-- ================ -->
      <section class="main-container">
          <div class="container">
              <div class="row">

                  <!-- main start -->
                  <!-- ================ -->
                  <div class="main col-lg-9">

                      <!-- page-title start -->
                      <!-- ================ -->
                      <h1 class="page-title">{{title}}</h1>
                      <div class="separator-2"></div>
                      <!-- page-title end -->

                      <!-- masonry grid start -->
                      <!-- ================ -->
                      <div class="masonry-grid row">
                          <?php foreach ($posts as $key => $post) { ?>
                          <!-- masonry grid item start -->
                          <div class="masonry-grid-item col-md-6">
                              <!-- blogpost start -->
                              <article class="blogpost shadow-2 light-gray-bg bordered object-non-visible"
                                  data-animation-effect="fadeInUpSmall" data-effect-delay="100">
                                  <?php if($post->featured_image) : ?>
                                  <div class="overlay-container">
                                      <img class="ml-auto mr-auto" src="<?php echo FRONTEND_URL.$post->featured_image ?>" alt="{{post.title}}">
                                      <a class="overlay-link" href="<?php echo FRONTEND_URL.'/posts/'.$post->slug ?>"><i class="fa fa-link"></i></a>
                                  </div>
                                  <?php endif ?>
                                  <header>
                                      <h2><a href="<?php echo FRONTEND_URL.'/posts/'.$post->slug ?>">{{post.title}}</a></h2>
                                      <div class="post-info">
                                          <span class="post-date">
                                              <i class="fa fa-calendar-o pr-1"></i>
                                              <span class="day"><?php echo $this->helper->datetime_vn($post->calendar) ?></span>
                                          </span>
                                      </div>
                                  </header>
                                  <div class="blogpost-content">
                                      <p>{{post.excerpt}}</p>
                                  </div>
                                  <footer class="clearfix">
                                      <!-- <div class="tags pull-left"><i class="fa fa-tags pr-1"></i> <a href="#">tag 1</a>,
                                          <a href="#">tag 2</a>, <a href="#">long tag 3</a></div> -->
                                      <div class="link pull-right"><i class="fa fa-link pr-1"></i><a href="<?php echo FRONTEND_URL.'/posts/'.$post->slug ?>">Xem thêm</a></div>
                                  </footer>
                              </article>
                              <!-- blogpost end -->
                          </div>
                          <!-- masonry grid item end -->
                          <?php } ?>
                      </div>
                      <!-- masonry grid end -->

                      <?php if($paging !== false) : ?>
                      <!-- pagination start -->
                      <nav aria-label="Page navigation">
                          <ul class="pagination justify-content-center">
                                <?php if($paging['current_page'] > 1): ?>
                                <li class="page-item">
                                    <a class="page-link" href="?page=<?php echo $paging['current_page'] - 1 ?>" aria-label="Trước">
                                        <i aria-hidden="true" class="fa fa-angle-left"></i>
                                        <span class="sr-only">Trước</span>
                                    </a>
                                </li>
                                <?php endif ?>
                                <?php for ($i = 1; $i <= $paging['total_page']; $i++) { ?>
                                <li class="page-item <?php echo $i == $paging['current_page'] ? 'active' : ''  ?>"><a class="page-link" href="?page={{i}}">{{i}}</a></li>
                                <?php } ?>
                                <?php if((int)$paging['current_page'] !== (int)$paging['total_page']): ?>
                                <li class="page-item">
                                    <a class="page-link" href="?page=<?php echo $paging['current_page'] + 1 ?>" aria-label="Sau">
                                        <i aria-hidden="true" class="fa fa-angle-right"></i>
                                        <span class="sr-only">Sau</span>
                                    </a>
                                </li>
                                <?php endif ?>
                          </ul>
                      </nav>
                      <!-- pagination end -->
                      <?php endif ?>
                  </div>
                  <!-- main end -->

                  <!-- sidebar start -->
                  <!-- ================ -->
                  <aside class="col-lg-3 col-xl-3 ml-xl-auto">
                    {{ partial('sidebar') }}
                  </aside>
                  <!-- sidebar end -->

              </div>
          </div>
      </section>
      <!-- main-container end -->