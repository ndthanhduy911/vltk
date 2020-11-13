<?php $detailForm = new Library\Forms\DetailForm(); ?>
<div class="modal fade" id="modalViewDetail">
    <div class="modal-dialog" style="max-width: 1350px; width: 98%;">
        <div class="modal-content">
            <form action="" id="frmViewDetail" method="post" enctype="multipart/form-data" data-toggle="validator" novalidate="true">
                <div class="modal-header">
                    <h4 class="modal-title"></h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="form-group label-floating col-auto flex-1">
                            <div class="input-group">
                                <label class="control-label">{{detailForm.getLabel('code')}}</label>
                                {{detailForm.render('code',['disabled' : true])}}
                                <div class="invalid-feedback"></div>
                            </div>
                        </div>
                        <div class="form-group label-floating col-auto flex-1">
                            <div class="input-group">
                                <label class="control-label">{{detailForm.getLabel('name')}}</label>
                                {{detailForm.render('name',['disabled' : true])}}
                                <div class="invalid-feedback"></div>
                            </div>
                        </div>
                        <div class="form-group label-floating col-auto flex-1 hidden">
                            <div class="input-group">
                                <label class="control-label">{{detailForm.getLabel('typeid')}}</label>
                                {{detailForm.render('typeid',['disabled' : true])}}
                                <div class="invalid-feedback"></div>
                            </div>
                        </div>
                        <div class="form-group label-floating col-auto flex-1">
                            <div class="input-group">
                                <label class="control-label">{{detailForm.getLabel('typename')}}</label>
                                {{detailForm.render('typename',['disabled' : true])}}
                                <div class="invalid-feedback"></div>
                            </div>
                        </div>
                        <div class="form-group label-floating col-auto flex-1">
                            <div class="input-group">
                                <label class="control-label">{{detailForm.getLabel('unitname')}}</label>
                                {{detailForm.render('unitname',['disabled' : true])}}
                                <div class="invalid-feedback"></div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-auto flex-1">
                            <?php
                                $detailArray = ['originname','purchasename','barcode','purchaseddate','producedyear',
                                'madename','suppliername','co','cq','cityid','districtid','wardid','street','address','acreage','maplat',
                                'maplng','brandcar','weight','numberpf','numberpl','seats','cylinder','framenumber','wattage','machinesnb','brand'];
                            ?>
                            <div class="row">
                                <div class="form-group label-floating col-md-12">
                                    <div class="input-group">
                                        <label class="control-label">{{detailForm.getLabel('specifications')}}</label>
                                        {{ detailForm.render('specifications',['disabled' : true]) }}
                                        <div class="invalid-feedback">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                            {% for detail in detailArray %}
                                <div class="form-group label-floating col-md-4">
                                    <div class="input-group">
                                        <label class="control-label">{{detailForm.getLabel(detail)}}</label>
                                        {{ detailForm.render(detail,['disabled' : true]) }}
                                        <div class="invalid-feedback">
                                        </div>
                                    </div>
                                </div>
                            {% endfor %}
                            </div>
                            <div class="row">
                                <div class="form-group label-floating col-md-12">
                                    <div class="input-group">
                                        <label class="control-label">{{detailForm.getLabel('note')}}</label>
                                        {{ detailForm.render('note',['disabled' : true]) }}
                                        <div class="invalid-feedback">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 flex-1">
                            <div class="text-center w-100">
                                <div class="mr-auto ml-auto">
                                    <div class="sp-wrap" id="detail-img"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>