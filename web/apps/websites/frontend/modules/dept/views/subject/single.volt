{{ partial('breadcrumb') }}

<section class="main-container pt-5">
    <div class="container">
        <div class="row">
            <div class="main col-md-9">
                <article>
                    {{ subject_lang.content }}
                </article>
            </div>

            <div class="col-md-3">
                {{ partial('sidebar') }}
            </div>
        </div>
    </div>
</section>