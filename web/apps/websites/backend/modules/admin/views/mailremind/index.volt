<!-- Bread crumb -->
<div class="row page-titles">
    <div class="col-md-5 align-self-center">
        <h3 class="text-hnn font-weight-bold">MAIL</h3>
    </div>
    <div class="col-md-7 align-self-center">
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a href="{{ url('/adcp/dashboard') }}">DASHBOARD</a>
            </li>
            <li class="breadcrumb-item active">Mail</li>
        </ol>
    </div>
</div>
<?php echo $this->flashSession->output() ?>
<!-- End Bread crumb -->
<div class="container-fluid">
    <!-- Start Page Content -->
    <div class="row">
        <div class="col-12">
            <div class="card" style="font-size: 0.8rem">
                <div class="card-body">
                    <div class="row">
                        <h2 class="card-title font-weight-bold col-md-11" style="font-size: 1rem">Management Mail</h2>
                    </div>
                    <div class="table-responsive">
                        <table id="mailTB" class="table table-bordered table-hover">
                            <thead class="text-center" style="line-height: 2.5">
                                <tr style="background: #EE161E">
                                    <th class="align-middle text-white">ID</th>
                                    <th class="align-middle text-white">Contract ID</th>
                                    <th class="align-middle text-white">Email Receiver</th>
                                    <th class="align-middle text-white">Client Receiver</th>
                                    <th class="align-middle text-white">Sent Date</th>
                                    <th class="align-middle text-white">Status</th>
                                    <th class="align-middle text-white text-center">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php $stt=1 ?>{% for mailremind in page.items %}
                                <tr class="text-center" role="row">
                                    <td><?php echo $stt++ ?></td>
                                    <td>{{mailremind.contract_name}}</td>
                                    <td>{{mailremind.email_receiver}}</td>
                                    <td>{{mailremind.client_receiver}}</td>
                                    <td>{{mailremind.sent_date}}</td>
                                    <td>
                                         <span class="badge badge-success" style="font-size: 0.7rem; padding: 0.5rem">
                                            <?php echo $mailremind->status ? 'Active' : 'Disabled' ?>
                                        </span>
                                    </td>
                                    <td class="align-middle text-center">
                                        <a class="delete-confirm btn btn-danger btn-sm m-2-4" obj="Mail Remind" data-id={{mailremind.id}} href="/adcp/mail/delete/{{mailremind.id}}">
                                            <i class="fa fa-remove"></i>
                                        </a>
                                    </td>
                                </tr>
                                {% endfor %}
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End PAge Content -->
</div>
