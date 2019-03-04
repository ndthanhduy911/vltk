<?php
$my_department_id = '';
$my_phone = '';
$my_name = '';
if(isset($client)){
    $my_department_id = $client->department_id;
    $my_name = $client->name;
    $my_phone = $client->phone;
}
?>
<?php if ($package->id==2 && $req_package == 'update') { ?>
<div class="card m-0 bg-primary p-15">
    {{package.note}}
</div>
<div class="w-100 m-t-20 pull-left">
    <legend class="text-primary m-b-0 f-s-15"><?= $this->ml::_ml('Mã hỗ trợ','frontend','formdefault_code','formdefault')?></legend>
    <div class="input-group">
        <span class="input-group-addon">
            <i class="material-icons">reorder</i>
        </span>
        <div class="form-group label-floating">
            {{ form.render('ticket') }}
        </div>
        <div class="invalid-tooltip"></div>
    </div>
</div>
<div class="w-100 m-t-10 pull-left">
    <div class="w-50 pull-left">
        <legend class="text-primary m-b-0 f-s-15"><?= $this->ml::_ml('Họ và tên','frontend','formdefault_name','formdefault')?></legend>
        <div class="input-group">
            <span class="input-group-addon">
                <i class="material-icons">account_box</i>
            </span>
            <div class="form-group label-floating">
                <input value="<?= !empty($content->req_name_create)?$content->req_name_create:'' ?>"
                    data-required-error="Vui lòng nhập họ và tên của người đăng ký." data-error="Chưa đúng định dạng."
                    type="text" id="req_name" name="req_name_create" class="form-control" placeholder="Họ và tên"
                    required="1" maxlength="255" minlength="3" size="255">
                <div class="invalid-tooltip"></div>
            </div>
        </div>
    </div>

    <div class="w-50 pull-left">
        <legend class="text-primary m-b-0 f-s-15"><?= $this->ml::_ml('Đơn vị','frontend','formdefault_department','formdefault')?></legend>
        <div class="input-group">
            <span class="input-group-addon">
                <i class="material-icons">location_city</i>
            </span>
            <?php $department_id = !empty($support->department_id) ? $support->department_id : '' ; ?>
            <div class="form-group label-floating">
                <select id="department_id" name="department_id" class="form-control" data-live-search="true" data-size="15"
                    required="1" data-required-error="Vui lòng chọn dịch vụ.">
                    <optgroup class="dept" label="<?= $this->ml::_ml('Đơn vị/ Phòng ban','frontend','formdefault_department2','formdefault')?>">
                        <?php foreach($department as $value){ if( $value->id != 1){ if($department_id == $value->id){ ?>
                        <option selected value="{{value.id}}">{{value.name}}</option>
                        <?php } else{ ?>
                        <option value="{{value.id}}">{{value.name}}</option>
                        <?php }
                            }
                        } ?>
                    </optgroup>
                    <optgroup label="<?= $this->ml::_ml('Đơn vị/ Phòng ban khác','frontend','formdefault_department3','formdefault')?>">
                        <option value="1"><?= $this->ml::_ml('Khác/ Mô tả','frontend','formdefault_department_other','formdefault')?></option>
                    </optgroup>
                </select>
            </div>
            <div class="invalid-tooltip"></div>
        </div>
    </div>
</div>

<div id="dept_hide" class="w-100 m-t-10 pull-left" style="display: none">
    <div class="input-group w-50 pull-right">
        <span class="input-group-addon">
            <i class="material-icons">location_city</i>
        </span>
        <div class="form-group label-floating">
            {{ form.render('department_other') }}
        </div>
        <div class="invalid-tooltip"></div>
    </div>
</div>

<div class="w-100 m-t-10 pull-left">
    <div class="w-50 pull-left">
        <legend class="text-primary m-b-0 f-s-15"><?= $this->ml::_ml('Số điện thoại','frontend','formdefault_phone','formdefault')?></legend>
        <div class="input-group">
            <span class="input-group-addon">
                <i class="material-icons">phone</i>
            </span>
            <div class="form-group label-floating">
                <input value="<?= !empty($content->req_phone)?$content->req_phone:'' ?>" data-required-error="Vui lòng nhập số điện thoại của người đăng ký."
                    data-error="Chưa đúng định dạng." type="text" id="req_phone" name="req_phone" class="form-control"
                    placeholder="Số điện thoại người đăng ký" required size="255">
            </div>
            <div class="invalid-tooltip"></div>
        </div>
    </div>

    <div class="w-50 pull-left">
        <legend class="text-primary m-b-0 f-s-15"><?= $this->ml::_ml('Địa chỉ e-mail','frontend','formdefault_email','formdefault')?></legend>
        <div class="input-group">
            <span class="input-group-addon">
                <i class="material-icons">email</i>
            </span>
            <div class="form-group label-floating">
                <input value="<?= !empty($content->req_email)?$content->req_email:'' ?>" data-required-error="Vui lòng nhập email của người đăng ký."
                    data-error="Chưa đúng định dạng." type="email" id="req_email" name="req_email" class="form-control"
                    placeholder="Email người đăng ký" required minlength="3" size="255">
            </div>
            <div class="invalid-tooltip"></div>
        </div>
    </div>
</div>



<div class="w-100 m-t-10 pull-left">
    <legend class="text-primary m-b-0 f-s-15"><?= $this->ml::_ml('Mức độ khẩn cấp','frontend','formdefault_priority','formdefault')?></legend>
    <div class="input-group">
        <span class="input-group-addon">
            <i class="material-icons">swap_vert</i>
        </span>
        <div class="form-group label-floating">
            {{ form.render('priority') }}
        </div>
        <div class="invalid-tooltip"></div>
    </div>
</div>

<div class="w-100 m-t-10 pull-left">
    <legend class="text-primary m-b-0 f-s-15"><?= $this->ml::_ml('Ghi chú','frontend','formdefault_note','formdefault')?></legend>
    <div class="input-group">
        <span class="input-group-addon">
            <i class="material-icons">create</i>
        </span>
        <div class="form-group label-floating">
            <textarea rows="2" name="content" class="form-control" placeholder="Ghi chú" size="255"><?= !empty($support->note) ? $support->note:'' ?></textarea>
        </div>
        <div class="invalid-tooltip"></div>
    </div>
</div>

<div style="display: none" class="req_package_import">{{req_package}}</div>
<div style="display: none" class="package_id_import">{{package.id}}</div>
<?php        
    }else{ 
?>
<div class="card m-0 bg-primary p-15">
    {{package.note}}
</div>
<div class="w-100 m-t-20 pull-left">
    <div class="w-50 pull-left">
        <legend class="text-primary m-b-0 f-s-15"><?= $this->ml::_ml('Mã hỗ trợ','frontend','formdefault_code','formdefault')?></legend>
        <div class="input-group">
            <span class="input-group-addon">
                <i class="material-icons">reorder</i>
            </span>
            <div class="form-group label-floating">
                {{ form.render('ticket') }}
            </div>
            <div class="invalid-tooltip"></div>
        </div>
    </div>
    <div class="w-50 pull-left">
        <legend class="text-primary m-b-0 f-s-15"><?= $this->ml::_ml('Đơn vị','frontend','formdefault_department','formdefault')?></legend>     
        <div class="input-group">
            <span class="input-group-addon">
                <i class="material-icons">location_city</i>
            </span>
            <?php $department_id = !empty($support->department_id) ? $support->department_id : $my_department_id ; ?>
            <div class="form-group label-floating">
                <select id="department_id" name="department_id" class="form-control" data-live-search="true" data-size="15"
                    required="1" data-required-error="Vui lòng chọn dịch vụ.">
                    <optgroup class="dept" label="<?= $this->ml::_ml('Đơn vị/ Phòng ban','frontend','formdefault_department2','formdefault')?>">
                        <?php foreach($department as $value){ if( $value->id != 1){ if($department_id == $value->id){ ?>
                        <option selected value="{{value.id}}">{{value.name}}</option>
                        <?php } else{ ?>
                        <option value="{{value.id}}">{{value.name}}</option>
                        <?php }
                            }
                        } ?>
                    </optgroup>
                    <optgroup label="Đơn vị/ Phòng ban khác">
                        <option value="1"><?= $this->ml::_ml('Khác/ Mô tả','frontend','formdefault_department_other','formdefault')?></option>
                    </optgroup>
                </select>
            </div>
            <div class="invalid-tooltip"></div>
        </div>
    </div>
</div>

<div id="dept_hide" class="w-100 m-t-10 pull-left" style="display: none">
    <div class="input-group w-50 pull-right">
        <span class="input-group-addon">
            <i class="material-icons">location_city</i>
        </span>
        <div class="form-group label-floating">
            {{ form.render('department_other') }}
        </div>
        <div class="invalid-tooltip"></div>
    </div>
</div>
<div class="w-100 m-t-10 pull-left">
    <div class="w-50 pull-left">
        <legend class="text-primary m-b-0 f-s-15"><?= $this->ml::_ml('Số điện thoại','frontend','formdefault_phone','formdefault')?></legend>
        <div class="input-group">
            <span class="input-group-addon">
                <i class="material-icons">phone</i>
            </span>
            <div class="form-group label-floating">
                <input value="<?= !empty($content->req_phone)?$content->req_phone: $my_phone ?>" data-required-error="Vui lòng nhập số điện thoại người liên hệ."
                    data-error="Chưa đúng định dạng." type="text" id="req_phone" name="req_phone" class="form-control"
                    placeholder="Số điện thoại người liên hệ" required size="255">
            </div>
            <div class="invalid-tooltip"></div>
        </div>
    </div>

    <div class="w-50 pull-left">
        <legend class="text-primary m-b-0 f-s-15"><?= $this->ml::_ml('Họ và tên người liên hệ','frontend','formdefault_name_contact','formdefault')?></legend>
        <div class="input-group">
            <span class="input-group-addon">
                <i class="material-icons">account_circle</i>
            </span>
            <div class="form-group label-floating">
                <input value="<?= !empty($content->req_name)? $content->req_name : $my_name ?>" data-required-error="Vui lòng nhập thông tin người liên hệ."
                    data-error="Chưa đúng định dạng." type="text" id="req_name" name="req_name" class="form-control"
                    placeholder="Họ và tên" required size="255">
            </div>
            <div class="invalid-tooltip"></div>
        </div>
    </div>
</div>

<div class="w-100 m-t-10 pull-left">
    <legend class="text-primary m-b-0 f-s-15"><?= $this->ml::_ml('Nội dung yêu cầu','frontend','formdefault_content','formdefault')?></legend>
    <div class="input-group">
        <span class="input-group-addon">
            <i class="material-icons">report</i>
        </span>
        <div class="form-group label-floating">
            <textarea rows="2" name="content" class="form-control" placeholder="Nội dung yêu cầu" size="255" data-error="Vui lòng nhập nội dung yêu cầu."
                required><?= !empty($content->content)?$content->content:'' ?></textarea>
        </div>
        <div class="invalid-tooltip"></div>
    </div>
</div>

<div class="w-100 m-t-10 pull-left">
    <legend class="text-primary f-s-15 m-b-0"><?= $this->ml::_ml('Tệp tin đính kèm (đính kèm hình ảnh để mô tả các sự cố, nếu có) Chấp nhận tệp tin','frontend','formdefault_file','formdefault')?> (<span class="text-rose">.gif, .jpg, .png, .xlsx, .docx, .zip</span>)
    </legend>
    <div id="fileupload">
        <div class="row fileupload-buttonbar">
            <div class="col-lg-7">
                <!-- The fileinput-button span is used to style the file input field as button -->
                <div class="fileinput fileinput-new text-center" data-provides="fileinput">
                    <div>
                        <span class="btn btn-success btn-round btn-file">
                            <span><?= $this->ml::_ml('Thêm tệp tin','frontend','formdefault_add_file','formdefault')?></span>
                            <input id="file" type="file" name="files[]" multiple>
                        </span>
                    </div>
                </div>
            </div>
            <!-- The global progress state -->
            <div class="col-lg-5 fileupload-progress fade">
                <!-- The global progress bar -->
                <div class="progress progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100">
                    <div class="progress-bar progress-bar-success" style="width:0%;"></div>
                </div>
                <!-- The extended global progress state -->
                <div class="progress-extended">&nbsp;</div>
            </div>
        </div>

        <table role="presentation" class="table m-b-0">
            <tbody class="files">
                <?php if(!empty($support->file)){?>
                <input id="file_old" name="file_old" value='{{support.file}}' type="hidden">
                <?php $files = json_decode($support->file) ?>
                <?php foreach ($files as $key => $value) { ?>
                <?php if(file_exists('files/support/'.$value)) { ?>
                <?php $size = number_format(filesize('files/support/'.$value)/1024,2); ?>
                <tr class="template-upload fade in">
                    <td style="display:none"><span class="file_old" style="display:none">{{value}}</span></td>
                    <td style="min-width: 100px">
                        <img width="80" src="/files/support/{{value}}" alt="">
                    </td>
                    <td style="min-width: 100px">
                        <a href="/files/support/{{value}}">{{value}}</a>
                    </td>
                    <td style="min-width: 100px">
                        <p class="size">{{size}} KB</p>
                    </td>
                    <td style="width: 100px" class="text-center">
                        <a href="javascript:;" class="btn btn-warning btn-sm btn-cancel" style="min-width: 50px">
                            Hủy
                        </a>
                    </td>
                </tr>
                <?php } ?>
                <?php } ?>
                <?php } ?>
            </tbody>
        </table>
    </div>
</div>

<div class="w-100 m-t-0 pull-left">
        <legend class="text-primary m-b-0 f-s-15"><?= $this->ml::_ml('Mức độ khẩn cấp','frontend','formdefault_priority','formdefault')?></legend>
    <div class="input-group">
        <span class="input-group-addon">
            <i class="material-icons">swap_vert</i>
        </span>
        <div class="form-group label-floating">
            {{ form.render('priority') }}
        </div>
        <div class="invalid-tooltip"></div>
    </div>
</div>

<div class="w-100 m-t-10 pull-left">
    <textarea rows="2" name="content" class="form-control" placeholder="Ghi chú" size="255"><?= !empty($support->note) ? $support->note:'' ?></textarea>
    <div class="input-group">
        <span class="input-group-addon">
            <i class="material-icons">create</i>
        </span>
        <div class="form-group label-floating">
            <textarea rows="2" name="note" class="form-control" placeholder="Ghi chú" size="255"><?= !empty($support->note) ? $support->note:'' ?></textarea>
        </div>
        <div class="invalid-tooltip"></div>
    </div>
</div>

<div style="display: none" class="req_package_import">{{req_package}}</div>
<div style="display: none" class="package_id_import">{{package.id}}</div>

<?php      
} ?>