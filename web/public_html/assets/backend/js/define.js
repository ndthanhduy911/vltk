var loader =`
    <div class="preloader">
    <svg class="circular" viewBox="25 25 50 50">
        <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10" /> </svg>
    </div>
`;

var fileSupport = [];
var countFile = 0;

var login_user_id = $('#login_user_id').html();

const getDaysInMonth = function(month,year) {
    // Here January is 1 based
    //Day 0 is the last day in the previous month
    return new Date(year, month, 0).getDate();
    // Here January is 0 based
    // return new Date(year, month+1, 0).getDate();
};

const carouselLoader = () => {
    $('.testimonial-widget-one .owl-carousel').owlCarousel({
        singleItem: true,
        loop: true,
        autoplay: true,
        //        rtl: true,
        autoplayTimeout: 2500,
        autoplayHoverPause: true,
        margin: 10,
        nav: false,
        dots: false,
        responsive: {
            0: {
                items: 1
            },
            600: {
                items: 1
            },
            1000: {
                items: 1
            }
        }
    });
    $('.statistic-slider .owl-carousel').owlCarousel({
        autoplay: false,
        autoplayTimeout: 5000,
        autoplayHoverPause: false,
        loop: true,
        margin: 15,
        nav: false,
        dots: false,
        responsive: {
            0: {
                items: 1
            },
            600: {
                items: 3
            },
            1000: {
                items: 4
            }
        }
    })
}
const chartjsLine = (type = 0, begin = null, end = null) => {
    if($('#lineChart').length){
        switch (type) {
            case 1:{

                break;
            }
            case 2:{
                begin = '01-'+begin;
                let endArray = end.split("-");
                end = getDaysInMonth(parseInt(endArray[0]), parseInt(endArray[1]))+'-'+end;  
                break;
            }
            case 3:{
                begin = '01-01-'+begin;
                end = '31-12-'+end;
                break;
            }
            default:{
                
            }
                break;
        }  
        $.ajax({
            type: "GET",
            url: "/adcp/dashboard/chart",
            data: {
                'begin' : begin,
                'end' : end,
                'type' : type
            },
            dataType: "json",
            success: function (results) {
                let data = results.data;
                let dataOut = {
                    labels : [],
                    datasets : []
                };
                let title;
                switch (type) {
                    case 1:{ 
                        $('#lineChart').remove();
                        $('.lineChart').html(`
                            <canvas id="lineChart"></canvas>
                        `)
                        date = [];
                        data.date.forEach(element => {
                            date.push(moment(element).format('DD-MM-YYYY'));
                        });
                        title = 'BIỂU ĐỒ THỐNG KÊ HỖ TRỢ TỪ NGÀY '+moment(results.begin).format('DD-MM-YYYY')+' ĐẾN '+moment(results.end).format('DD-MM-YYYY')
                        dataOut = {
                            labels: date,
                            datasets: [
                                {
                                    label: data[1].pack_name,
                                    borderColor: "#FF5722",
                                    borderWidth: "1",
                                    backgroundColor: "rgba(255, 193, 7, 0.1)",
                                    data: data[1].data
                                },
                                {
                                    label: data[2].pack_name,
                                    borderColor: "#FFC107",
                                    borderWidth: "1",
                                    backgroundColor: "rgba(255, 235, 59, 0.1)",
                                    pointHighlightStroke: "rgba(26,179,148,1)",
                                    data: data[2].data
                                },
                                {
                                    label: data[3].pack_name,
                                    borderColor: "#4CAF50",
                                    borderWidth: "1",
                                    backgroundColor: "rgba(139, 195, 74, 0.1)",
                                    pointHighlightStroke: "rgba(26,179,148,1)",
                                    data: data[3].data
                                },
                                {
                                    label: data[4].pack_name,
                                    borderColor: "#2196F3",
                                    borderWidth: "1",
                                    backgroundColor: "rgba(3, 168, 244, 0.1)",
                                    pointHighlightStroke: "rgba(26,179,148,1)",
                                    data: data[4].data
                                },
                                {
                                    label: data[5].pack_name,
                                    borderColor: "#9C27B0",
                                    borderWidth: "1",
                                    backgroundColor: "rgba(104, 58, 183, 0.1)",
                                    pointHighlightStroke: "rgba(26,179,148,1)",
                                    data: data[5].data
                                }
                            ]
                        }
                        let ctx = document.getElementById("lineChart");
                        ctx.height = 170;
                        let myChart = new Chart(ctx, {
                            type: 'line',
                            data: dataOut,
                            options: {
                                responsive: true,
                                tooltips: {
                                    mode: 'index',
                                    intersect: false
                                },
                                hover: {
                                    mode: 'nearest',
                                    intersect: true
                                },
                                title: {
                                    display: true,
                                    text: title,
                                    fontSize: 20,
                                    fontColor: '#EE161E',
                                    padding: 20
                                }
                            }
                        }); 
                        break;
                    }
                    case 2:{
                        $('#lineChart').remove();
                        $('.lineChart').html(`
                            <canvas id="lineChart"></canvas>
                        `)
                        month = [];
                        data.month.forEach(element => {
                            month.push(moment(element).format('MM-YYYY'));
                        });
                        title = 'BIỂU ĐỒ THỐNG KÊ HỖ TRỢ THÁNG '+moment(results.begin).format('MM-YYYY')+' ĐẾN '+moment(results.end).format('MM-YYYY')
                        dataOut = {
                            labels: month,
                            datasets: [
                                {
                                    label: data[1].pack_name,
                                    borderColor: "#FF5722",
                                    borderWidth: "1",
                                    backgroundColor: "rgba(255, 193, 7, 0.1)",
                                    data: data[1].data
                                },
                                {
                                    label: data[2].pack_name,
                                    borderColor: "#FFC107",
                                    borderWidth: "1",
                                    backgroundColor: "rgba(255, 235, 59, 0.1)",
                                    pointHighlightStroke: "rgba(26,179,148,1)",
                                    data: data[2].data
                                },
                                {
                                    label: data[3].pack_name,
                                    borderColor: "#4CAF50",
                                    borderWidth: "1",
                                    backgroundColor: "rgba(139, 195, 74, 0.1)",
                                    pointHighlightStroke: "rgba(26,179,148,1)",
                                    data: data[3].data
                                },
                                {
                                    label: data[4].pack_name,
                                    borderColor: "#2196F3",
                                    borderWidth: "1",
                                    backgroundColor: "rgba(3, 168, 244, 0.1)",
                                    pointHighlightStroke: "rgba(26,179,148,1)",
                                    data: data[4].data
                                },
                                {
                                    label: data[5].pack_name,
                                    borderColor: "#9C27B0",
                                    borderWidth: "1",
                                    backgroundColor: "rgba(104, 58, 183, 0.1)",
                                    pointHighlightStroke: "rgba(26,179,148,1)",
                                    data: data[5].data
                                }
                            ]
                        }
                        let ctx = document.getElementById("lineChart");
                        ctx.height = 170;
                        let myChart = new Chart(ctx, {
                            type: 'line',
                            data: dataOut,
                            options: {
                                responsive: true,
                                tooltips: {
                                    mode: 'index',
                                    intersect: false
                                },
                                hover: {
                                    mode: 'nearest',
                                    intersect: true
                                },
                                title: {
                                    display: true,
                                    text: title,
                                    fontSize: 20,
                                    fontColor: '#EE161E',
                                    padding: 20
                                }
                            }
                        }); 
                        break;
                    }
                    case 3:{
                        $('#lineChart').remove();
                        $('.lineChart').html(`
                            <canvas id="lineChart"></canvas>
                        `)
                        title = 'BIỂU ĐỒ THỐNG KÊ HỖ TRỢ TỪ NĂM '+moment(results.begin).format('YYYY')+' ĐẾN '+moment(results.end).format('YYYY')
                        dataOut = {
                            labels: data.year,
                            datasets: [
                                {
                                    label: data[1].pack_name,
                                    borderColor: "#FF5722",
                                    borderWidth: "1",
                                    backgroundColor: "rgba(255, 193, 7, 0.1)",
                                    data: data[1].data
                                },
                                {
                                    label: data[2].pack_name,
                                    borderColor: "#FFC107",
                                    borderWidth: "1",
                                    backgroundColor: "rgba(255, 235, 59, 0.1)",
                                    pointHighlightStroke: "rgba(26,179,148,1)",
                                    data: data[2].data
                                },
                                {
                                    label: data[3].pack_name,
                                    borderColor: "#4CAF50",
                                    borderWidth: "1",
                                    backgroundColor: "rgba(139, 195, 74, 0.1)",
                                    pointHighlightStroke: "rgba(26,179,148,1)",
                                    data: data[3].data
                                },
                                {
                                    label: data[4].pack_name,
                                    borderColor: "#2196F3",
                                    borderWidth: "1",
                                    backgroundColor: "rgba(3, 168, 244, 0.1)",
                                    pointHighlightStroke: "rgba(26,179,148,1)",
                                    data: data[4].data
                                },
                                {
                                    label: data[5].pack_name,
                                    borderColor: "#9C27B0",
                                    borderWidth: "1",
                                    backgroundColor: "rgba(104, 58, 183, 0.1)",
                                    pointHighlightStroke: "rgba(26,179,148,1)",
                                    data: data[5].data
                                }
                            ]
                        }
                        let ctx = document.getElementById("lineChart");
                        ctx.height = 170;
                        let myChart = new Chart(ctx, {
                            type: 'line',
                            data: dataOut,
                            options: {
                                responsive: true,
                                tooltips: {
                                    mode: 'index',
                                    intersect: false
                                },
                                hover: {
                                    mode: 'nearest',
                                    intersect: true
                                },
                                title: {
                                    display: true,
                                    text: title,
                                    fontSize: 20,
                                    fontColor: '#EE161E',
                                    padding: 20
                                }
                            }
                        }); 
                        break;
                    }
                    default:{
                        title = "BIỂU ĐỒ THỐNG KÊ SỐ LƯỢNG YÊU CẦU HỖ TRỢ NĂM "+(new Date()).getFullYear();
                        dataOut = {
                            labels: ["Tháng 1", "Tháng 2", "Tháng 3", "Tháng 4", "Tháng 5", "Tháng 6", "Tháng 7", "Tháng 8", "Tháng 9", "Tháng 10", "Tháng 11", "Tháng 12"],
                            datasets: [
                                {
                                    label: data[1].pack_name,
                                    borderColor: "#FF5722",
                                    borderWidth: "1",
                                    backgroundColor: "rgba(255, 193, 7, 0.1)",
                                    data: data[1].data
                                },
                                {
                                    label: data[2].pack_name,
                                    borderColor: "#FFC107",
                                    borderWidth: "1",
                                    backgroundColor: "rgba(255, 235, 59, 0.1)",
                                    pointHighlightStroke: "rgba(26,179,148,1)",
                                    data: data[2].data
                                },
                                {
                                    label: data[3].pack_name,
                                    borderColor: "#4CAF50",
                                    borderWidth: "1",
                                    backgroundColor: "rgba(139, 195, 74, 0.1)",
                                    pointHighlightStroke: "rgba(26,179,148,1)",
                                    data: data[3].data
                                },
                                {
                                    label: data[4].pack_name,
                                    borderColor: "#2196F3",
                                    borderWidth: "1",
                                    backgroundColor: "rgba(3, 168, 244, 0.1)",
                                    pointHighlightStroke: "rgba(26,179,148,1)",
                                    data: data[4].data
                                },
                                {
                                    label: data[5].pack_name,
                                    borderColor: "#9C27B0",
                                    borderWidth: "1",
                                    backgroundColor: "rgba(104, 58, 183, 0.1)",
                                    pointHighlightStroke: "rgba(26,179,148,1)",
                                    data: data[5].data
                                }
                            ]
                        }
                        let ctx = document.getElementById("lineChart");
                        ctx.height = 170;
                        let myChart = new Chart(ctx, {
                            type: 'line',
                            data: dataOut,
                            options: {
                                responsive: true,
                                tooltips: {
                                    mode: 'index',
                                    intersect: false
                                },
                                hover: {
                                    mode: 'nearest',
                                    intersect: true
                                },
                                title: {
                                    display: true,
                                    text: title,
                                    fontSize: 20,
                                    fontColor: '#EE161E',
                                    padding: 20
                                }
                            }
                        }); 
                        break;
                    }
                } 
            }
        });
    }
}
const chartjsPie = (type = 0, begin = null, end = null) => {
    if($('#pieChart').length){
        let title = {
            display: true,
            text: "BIỂU ĐỒ % ĐƠN VỊ GỬI YÊU CẦU NĂM "+(new Date()).getFullYear(),
            fontSize: 20,
            fontColor: '#EE161E',
            padding: 20
        };
        switch (type) {
            case 1:{
                title.text = "BIỂU ĐỒ % YÊU CẦU TỪ NGÀY "+begin+" ĐẾN "+end;
                break;
            }
            case 2:{
                title.text = "BIỂU ĐỒ % YÊU CẦU TỪ THÁNG "+begin+" ĐẾN "+end;
                begin = '01-'+begin;
                let endArray = end.split("-");
                end = getDaysInMonth(parseInt(endArray[0]), parseInt(endArray[1]))+'-'+end;  
                break;
            }
            case 3:{
                title.text = "BIỂU ĐỒ % YÊU CẦU TỪ NĂM "+begin+" ĐẾN "+end;
                begin = '01-01-'+begin;
                end = '31-12-'+end;
                break;
            }
            default:{
                title.text = "BIỂU ĐỒ % ĐƠN VỊ GỬI YÊU CẦU NĂM "+(new Date()).getFullYear();
            }
                break;
        } 
        $.ajax({
            type: "GET",
            url: "/adcp/dashboard/chartclient",
            data: {
                'begin' : begin,
                'end' : end,
                'type' : type
            },
            dataType: "json",
            success: function (response) {
                $('#pieChart').remove();
                $('.pieChart').html(`
                    <canvas id="pieChart"></canvas>
                `)
                let ctx = document.getElementById("pieChart");
                ctx.height = 340;
                let pieOptions = {
                    events: false,
                    title: title,
                    animation: {
                      duration: 500,
                      easing: "easeOutQuart",
                      onComplete: function () {
                        var ctx = this.chart.ctx;
                        ctx.font = Chart.helpers.fontString(Chart.defaults.global.defaultFontFamily, 'normal', Chart.defaults.global.defaultFontFamily);
                        ctx.textAlign = 'center';
                        ctx.textBaseline = 'bottom';
                  
                        this.data.datasets.forEach(function (dataset) {
                  
                          for (var i = 0; i < dataset.data.length; i++) {
                            var model = dataset._meta[Object.keys(dataset._meta)[0]].data[i]._model,
                                total = dataset._meta[Object.keys(dataset._meta)[0]].total,
                                mid_radius = model.innerRadius + (model.outerRadius - model.innerRadius)/2,
                                start_angle = model.startAngle,
                                end_angle = model.endAngle,
                                mid_angle = start_angle + (end_angle - start_angle)/2;
                  
                            var x = mid_radius * Math.cos(mid_angle);
                            var y = mid_radius * Math.sin(mid_angle);
                  
                            ctx.fillStyle = '#fff';
                            if (i == 3){ // Darker text color for lighter background
                              ctx.fillStyle = '#fff';
                            }
                            var percent = String(Math.round(dataset.data[i]/total*100)) + "%";
                            // ctx.fillText(dataset.data[i], model.x + x, model.y + y);
                            // Display percent in another line, line break doesn't work for fillText
                            ctx.fillText(percent, model.x + x, model.y + y + 15);
                          }
                        });               
                      }
                    }
                };
                if(response.data.length){
                    $('#empty-chart').hide()
                    let myChart = new Chart(ctx, {
                        type: 'pie',
                        data: {
                            datasets: [{
                                data: response.data,
                                backgroundColor: [
                                    "#FF9124",
                                    "#FFCD56",
                                    "#4BC0C0",
                                    "#36A2EB"
                                ],
                                hoverBackgroundColor: [
                                    "rgba(0, 123, 255,0.9)",
                                    "rgba(0, 123, 255,0.7)",
                                    "rgba(0, 123, 255,0.5)",
                                    "rgba(0,0,0,0.07)"
                                ],
                            }],
                            labels: response.client
                        },
                        options: pieOptions
                    });
                }else{
                    $('#empty-chart').show()
                }
            }
        });
    }    
}
const chartjsLoader = ()=>{
    chartjsLine();
    chartjsPie();
    $('body').on('change','#select_chart', (e)=>{
        e.preventDefault();
        let id = $('#select_chart option:selected').val();
        $('.select_chart input').val('');
        $('.select_chart').addClass('hidden');
        $('#select_chart'+id).removeClass('hidden');
    })

    $('#begin_date').datepicker({
        format : 'dd-mm-yyyy',
        todayHighlight: true,
        autoclose: true
    }).on('changeDate', function(e) {
       if($('#begin_date').val() && $('#end_date').val()){
            chartjsLine(1,$('#begin_date').val(),$('#end_date').val());
       }
    });

    $('#end_date').datepicker({
        format : 'dd-mm-yyyy',
        todayHighlight: true,
        autoclose: true
    }).on('changeDate', function(e) {
        if($('#begin_date').val() && $('#end_date').val()){
            chartjsLine(1,$('#begin_date').val(),$('#end_date').val());
        }
     });
    
    $('#begin_month').datepicker({
        viewMode: 1,
        startView: 1,
        minViewMode: 1,
        todayHighlight: true,
        format: 'mm-yyyy',
        autoclose: true,
    }).on('changeDate', function(e) {
        if($('#begin_month').val() && $('#end_month').val()){
            chartjsLine(2,$('#begin_month').val(),$('#end_month').val());
        }
     });
    $('#end_month').datepicker({
        viewMode: 1,
        startView: 1,
        minViewMode: 1,
        todayHighlight: true,
        format: 'mm-yyyy',
        autoclose: true,
    }).on('changeDate', function(e) {
        if($('#begin_month').val() && $('#end_month').val()){
            chartjsLine(2,$('#begin_month').val(),$('#end_month').val());
        }
    });

    $('#begin_year').datepicker({
        viewMode: 2,
        startView: 2,
        minViewMode: 2,
        todayHighlight: true,
        format: 'yyyy',
        autoclose: true,
    }).on('changeDate', function(e) {
        if($('#begin_year').val() && $('#end_year').val()){
            chartjsLine(3,$('#begin_year').val(),$('#end_year').val());
        }
    });
    $('#end_year').datepicker({
        viewMode: 2,
        startView: 2,
        minViewMode: 2,
        todayHighlight: true,
        format: 'yyyy',
        autoclose: true,
    }).on('changeDate', function(e) {
        if($('#begin_year').val() && $('#end_year').val()){
            chartjsLine(3,$('#begin_year').val(),$('#end_year').val());
        }
    });

    $('body').on('change','#select2_chart', (e)=>{
        e.preventDefault();
        let id = $('#select2_chart option:selected').val();
        $('.select2_chart input').val('');
        $('.select2_chart').addClass('hidden');
        $('#select2_chart'+id).removeClass('hidden');
    })

    $('#begin2_date').datepicker({
        format : 'dd-mm-yyyy',
        todayHighlight: true,
        autoclose: true
    }).on('changeDate', function(e) {
       if($('#begin2_date').val() && $('#end2_date').val()){
            chartjsPie(1,$('#begin2_date').val(),$('#end2_date').val());
       }
    });

    $('#end2_date').datepicker({
        format : 'dd-mm-yyyy',
        todayHighlight: true,
        autoclose: true
    }).on('changeDate', function(e) {
        if($('#begin2_date').val() && $('#end2_date').val()){
            chartjsPie(1,$('#begin2_date').val(),$('#end2_date').val());
        }
     });
    
    $('#begin2_month').datepicker({
        viewMode: 1,
        startView: 1,
        minViewMode: 1,
        todayHighlight: true,
        format: 'mm-yyyy',
        autoclose: true,
    }).on('changeDate', function(e) {
        if($('#begin2_month').val() && $('#end2_month').val()){
            chartjsPie(2,$('#begin2_month').val(),$('#end2_month').val());
        }
     });
    $('#end2_month').datepicker({
        viewMode: 1,
        startView: 1,
        minViewMode: 1,
        todayHighlight: true,
        format: 'mm-yyyy',
        autoclose: true,
    }).on('changeDate', function(e) {
        if($('#begin2_month').val() && $('#end2_month').val()){
            chartjsPie(2,$('#begin2_month').val(),$('#end2_month').val());
        }
    });

    $('#begin2_year').datepicker({
        viewMode: 2,
        startView: 2,
        minViewMode: 2,
        todayHighlight: true,
        format: 'yyyy',
        autoclose: true,
    }).on('changeDate', function(e) {
        if($('#begin2_year').val() && $('#end2_year').val()){
            chartjsPie(3,$('#begin_year').val(),$('#end2_year').val());
        }
    });
    $('#end2_year').datepicker({
        viewMode: 2,
        startView: 2,
        minViewMode: 2,
        todayHighlight: true,
        format: 'yyyy',
        autoclose: true,
    }).on('changeDate', function(e) {
        if($('#begin2_year').val() && $('#end2_year').val()){
            chartjsPie(3,$('#begin2_year').val(),$('#end2_year').val());
        }
    });
}

const selectTime = (time)=>{
    switch (parseInt(time)) {
        case 1:{
            return 'contract';
        }
        case 2:{
            return 'd';
        }
        case 3:{
            return 'w';
        }
        case 4:{
            return 'M';
        }
        case 5:{
            return 'Q';
        }
        case 6:{
            return 'y';
        }
        default:
            return 0;
    }
}
const limitText = (selector,limit) => {
    $('.page-wrapper').on('keydown',selector, function () {
        if($(this).val().length>limit){
            $(this).val($(this).val().substr(0, limit));
        }     
    });
}
const getPriority = ($type)=>{
    switch ($type) {
        case 'low':
            return '<span class="badge badge-info" style="font-size: 0.7rem; padding: 0.5rem">Chậm</span>';
        case 'normal':
            return '<span class="badge badge-success" style="font-size: 0.7rem; padding: 0.5rem">Bình thường</span>';
        case 'height':
            return '<span class="badge badge-warning text-white" style="font-size: 0.7rem; padding: 0.5rem">Cao</span>';
        case 'urgent':
            return '<span class="badge badge-danger text-white" style="font-size: 0.7rem; padding: 0.5rem">Khẩn cấp</span>';        
        default:
            return 'Chưa xác định';
    }
}
const getStatusSupport = ($type)=>{
    switch ($type) {
        case 0:
            return '<span status="'+$type+'" class="badge badge-danger" style="font-size: 0.7rem; padding: 0.5rem">Chưa giao</span>';
        case 1:
            return '<span status="'+$type+'" class="badge badge-info" style="font-size: 0.7rem; padding: 0.5rem">Đã giao</span>';
        case 2:
            return '<span status="'+$type+'" class="badge badge-success" style="font-size: 0.7rem; padding: 0.5rem">Xong</span>';
        case 3:
            return `<span status="${$type}" class="badge badge-primary" style="font-size: 0.7rem; padding: 0.5rem">Đang làm</span>`;
        case 4:
            return `<span status="${$type}" class="badge badge-danger" style="font-size: 0.7rem; padding: 0.5rem">Sự cố</span>`;
        
        default:
            return 'Chưa xác định';
    }
}
const getStatusMySupport = ($type)=>{
    switch ($type) {
        case 0:
            return `<span status="${$type}" class="badge badge-danger" style="font-size: 0.7rem; padding: 0.5rem">Chưa giao</span>`;
        case 1:
            return `<span status="${$type}" class="badge badge-info" style="font-size: 0.7rem; padding: 0.5rem">Đã nhận</span>`;
        case 2:
            return `<span status="${$type}" class="badge badge-success" style="font-size: 0.7rem; padding: 0.5rem">Xong</span>`;
        case 3:
            return `<span status="${$type}" class="badge badge-primary" style="font-size: 0.7rem; padding: 0.5rem">Đang làm</span>`;
        case 4:
            return `<span status="${$type}" class="badge badge-danger" style="font-size: 0.7rem; padding: 0.5rem">Sự cố</span>`;
        
        default:
            return 'Chưa xác định';
    }
}
const getContentSupport = (key)=>{
    switch (key) {
        case 'req_name_create': return 'Họ và tên người được tạo';
        case 'req_phone': return 'Số điện thoại';
        case 'req_email': return 'Email';
        case 'req_name': return 'Họ và tên người liên hệ';
        case 'req_phone': return 'Điện thoại người liên hệ';
        case 'department_id': return 'Đơn vị';
        case 'content': return 'Nội dung yêu cầu';
        case 'file': return 'Tệp tin đi kèm';
        default: return '';

    }
}
const getPackage = (type , cb) => {
    $.ajax({
        type: "GET",
        url: "/adcp/package/getpackagetype/"+type,
        data: {},
        dataType: "json",
        success: function (results) {
            cb(results.data);
        }
    })
}

const sendEmail = (data)=>{
    $.ajax({
        type: "POST",
        url: '/adcp/emailsms/sendemail',
        data: data,
        dataType: "json",
        success: function (results) {
            
        },
        error: function( error ){

        }
    });
}

const sendPoliEmail = (data)=>{
    $.ajax({
        type: "POST",
        url: '/adcp/emailsms/sendpoliemail',
        data: data,
        dataType: "json",
        success: function (results) {
            
        },
        error: function( error ){

        }
    });
}

const loaderClient = (cb=()=>{}) => {
    if ($('#client').length) {
        // $.ajax({
        //     type: "GET",
        //     url: "/adcp/client/getclient",
        //     data: {},
        //     dataType: "json",
        //     success: function (results) {
                // results.data.forEach((element, index) => {
                //     let status = (element.status == 1) ? `<span status="${element.status}" class="badge badge-success" style="font-size: 0.7rem; padding: 0.5rem">Active</span>` :
                //         `<span status="${element.status}" class="badge badge-danger" style="font-size: 0.7rem; padding: 0.5rem">Disable</span>`;
                //     $('#client tbody').append(`
                //         <tr>
                //             <td></td>
                //             <td>${element.name}</td>
                //             <td>${element.address}</td>
                //             <td>${element.department_id}</td>
                //             <td>${element.email}</td>
                //             <td>${element.phone}</td>
                //             <td>${status}</td>
                //             <td>
                //                 <a class="btn btn-primary btn-sm m-2-4 editClient" href="/adcp/client/edit/${element.id}">
                //                     <i class="fa fa-edit"></i>
                //                 </a>
                //                 <a class="delete-confirm btn btn-danger btn-sm m-2-4" data-id=${element.id} obj="Client" href="/adcp/client/delete">
                //                     <i class="fa fa-remove"></i>
                //                 </a>
                //             </td>
                //         </tr>
                //     `);
                // });
                $('#client').DataTable({
                    dom: 'Blfrtip',
                    buttons: [
                        {
                            extend: 'copy',
                            exportOptions: {
                                columns: [ 0, 1, 2, 3, 4, 5, 6]
                            }
                        },
                        // {
                        //     extend: 'csv',
                        //     exportOptions: {
                        //         columns: [ 0, 1, 2, 3, 4, 5, 6]
                        //     }
                        // },
                        {
                            extend: 'excel',
                            exportOptions: {
                                columns: [ 0, 1, 2, 3, 4, 5, 6]
                            },
                        },
                        {
                            extend: 'pdfHtml5',
                            exportOptions: {
                                columns: [ 0, 1, 2, 3, 4, 5, 6]
                            },
                        },
                        {
                            extend: 'print',
                            exportOptions: {
                                columns: [ 0, 1, 2, 3, 4, 5, 6]
                            },
                            customize : function(win) {
                                let table = $(win.document.body);                                
                                table.find('th, td').addClass('text-center align-middle');
                                table.find('tbody tr').each(function(index){
                                    $(this).find('td:eq(0)').html(index+1);
                                });
                            }
                        },
                    ],
                    columnDefs: [
                        { orderable: false, targets: [ 7 ] }
                    ],
                    "processing": true,
                    'createdRow': function( row, data, dataIndex ) {
                        $(row).addClass('text-center');
                        $('td', row).addClass('align-middle');
                        $('td:eq(8)', row).addClass('hidden');
                        $('td:eq(0)', row).html(dataIndex+1);
                    },
                    "deferRender": true,
                    "language": {
                        "sProcessing":   "Đang xử lý...",
                        "sLengthMenu":   "Xem _MENU_ mục",
                        "sZeroRecords":  "Không tìm thấy dòng nào phù hợp",
                        "sInfo":         "Đang xem _START_ đến _END_ trong tổng số _TOTAL_ mục",
                        "sInfoEmpty":    "Đang xem 0 đến 0 trong tổng số 0 mục",
                        "sInfoFiltered": "(được lọc từ _MAX_ mục)",
                        "sInfoPostFix":  "",
                        "sSearch":       "Tìm:",
                        "sUrl":          "",
                        "oPaginate": {
                            "sFirst":    "Đầu",
                            "sPrevious": "Trước",
                            "sNext":     "Tiếp",
                            "sLast":     "Cuối"
                        }
                    }
                });
                cb();
        //     }
        // });
    }
}
const loaderLanguage = (cb=()=>{}) => {
    if ($('#language').length) {
        $('#language').DataTable({
            dom: 'Blfrtip',
            buttons: [
                {
                    extend: 'copy',
                    exportOptions: {
                        columns: [ 0, 1, 2, 3]
                    }
                },
                {
                    extend: 'excel',
                    exportOptions: {
                        columns: [ 0, 1, 2, 3]
                    },
                },
                {
                    extend: 'pdfHtml5',
                    exportOptions: {
                        columns: [ 0, 1, 2, 3]
                    },
                },
                {
                    extend: 'print',
                    exportOptions: {
                        columns: [ 0, 1, 2, 3]
                    },
                    customize : function(win) {
                        let table = $(win.document.body);                                
                        table.find('th, td').addClass('text-center align-middle');
                        table.find('tbody tr').each(function(index){
                            $(this).find('td:eq(0)').html(index+1);
                        });
                    }
                },
            ],
            columnDefs: [
                { orderable: false, targets: [ 4 ] }
            ],
            "processing": true,
            'createdRow': function( row, data, dataIndex ) {
                $(row).addClass('text-center');
                $('td', row).addClass('align-middle');
                $('td:eq(0)', row).html(dataIndex+1);
            },
            "deferRender": true,
            "language": {
                "sProcessing":   "Đang xử lý...",
                "sLengthMenu":   "Xem _MENU_ mục",
                "sZeroRecords":  "Không tìm thấy dòng nào phù hợp",
                "sInfo":         "Đang xem _START_ đến _END_ trong tổng số _TOTAL_ mục",
                "sInfoEmpty":    "Đang xem 0 đến 0 trong tổng số 0 mục",
                "sInfoFiltered": "(được lọc từ _MAX_ mục)",
                "sInfoPostFix":  "",
                "sSearch":       "Tìm:",
                "sUrl":          "",
                "oPaginate": {
                    "sFirst":    "Đầu",
                    "sPrevious": "Trước",
                    "sNext":     "Tiếp",
                    "sLast":     "Cuối"
                }
            }
        });
        cb();
    }
}
const loaderSupport = (cb=()=>{}) => {
    if ($('#support').length) {
        $('#support').DataTable({
            dom: 'Blfrtip',
            buttons: [
            {
                extend: 'copy',
                exportOptions: {
                    columns: [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11 ]
                }
            },
            {
                extend: 'excel',
                exportOptions: {
                    columns: [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11 ]
                },
            },
            {
                extend: 'pdfHtml5',
                exportOptions: {
                    columns: [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11 ]
                },
            },
            {
                extend: 'print',
                exportOptions: {
                    columns: [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11 ]
                },
                customize : function(win) {
                    let table = $(win.document.body);                                
                    table.find('th, td').addClass('text-center align-middle');
                    table.find('tbody tr').each(function(index){
                        $(this).find('td:eq(0)').html(index+1);
                    });
                }
            },
            ],
            "autoWidth": false,
            "processing": true,
            "deferRender": true,
            'createdRow': function( row, data, dataIndex ) {
                $(row).addClass('text-center');
                $('td', row).addClass('align-middle');
                $('td:eq(8)', row).addClass('text-left');
                $('td:eq(13)', row).addClass('hidden');
                $('td:eq(14)', row).addClass('hidden');
                $('td:eq(15)', row).addClass('hidden');
                $('td:eq(16)', row).addClass('hidden');
                $('td:eq(17)', row).addClass('hidden');
                $('td:eq(18)', row).addClass('hidden');
                $('td:eq(19)', row).addClass('hidden');
                $('td:eq(20)', row).addClass('hidden');
                $('td:eq(0)', row).html(dataIndex+1);
            },
            columnDefs: [
                { orderable: false, targets: [ 2,3,4,5,12 ] }
            ],
            "language": {
                "sProcessing":   "Đang xử lý...",
                "sLengthMenu":   "Xem _MENU_ mục",
                "sZeroRecords":  "Không tìm thấy dòng nào phù hợp",
                "sInfo":         "Đang xem _START_ đến _END_ trong tổng số _TOTAL_ mục",
                "sInfoEmpty":    "Đang xem 0 đến 0 trong tổng số 0 mục",
                "sInfoFiltered": "(được lọc từ _MAX_ mục)",
                "sInfoPostFix":  "",
                "sSearch":       "Tìm:",
                "sUrl":          "",
                "oPaginate": {
                    "sFirst":    "Đầu",
                    "sPrevious": "Trước",
                    "sNext":     "Tiếp",
                    "sLast":     "Cuối"
                }
            }
        });
        cb()
    }
}
const loaderMySupport = (cb=()=>{}) => {
    if ($('#mysupport').length) {
        $('#mysupport').DataTable({
            dom: 'Blfrtip',
            buttons: [
                {
                    extend: 'copy',
                    exportOptions: {
                        columns: [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11 ]
                    }
                },
                // {
                //     extend: 'csv',
                //     exportOptions: {
                //         columns: [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11 ]
                //     }
                // },
                {
                    extend: 'excel',
                    exportOptions: {
                        columns: [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11 ]
                    },
                },
                {
                    extend: 'pdfHtml5',
                    exportOptions: {
                        columns: [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11 ]
                    },
                },
                {
                    extend: 'print',
                    exportOptions: {
                        columns: [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11 ]
                    },
                    customize : function(win) {
                        let table = $(win.document.body);                                
                        table.find('th, td').addClass('text-center align-middle');
                        table.find('tbody tr').each(function(index){
                            $(this).find('td:eq(0)').html(index+1);
                        });
                    }
                },
            ],
            "autoWidth": false,
            "processing": true,
            "deferRender": true,
            'createdRow': function( row, data, dataIndex ) {
                $(row).addClass('text-center');
                $('td', row).addClass('align-middle');
                $('td:eq(13)', row).addClass('hidden');
                $('td:eq(14)', row).addClass('hidden');
                $('td:eq(15)', row).addClass('hidden');
                $('td:eq(16)', row).addClass('hidden');
                $('td:eq(17)', row).addClass('hidden');
                $('td:eq(18)', row).addClass('hidden');
                $('td:eq(19)', row).addClass('hidden');
                $('td:eq(29)', row).addClass('hidden');
                $('td:eq(0)', row).html(dataIndex+1);
            },
            columnDefs: [
                { orderable: false, targets: [ 2,3,4,5,12 ] }
            ],
            "language": {
                "sProcessing":   "Đang xử lý...",
                "sLengthMenu":   "Xem _MENU_ mục",
                "sZeroRecords":  "Không tìm thấy dòng nào phù hợp",
                "sInfo":         "Đang xem _START_ đến _END_ trong tổng số _TOTAL_ mục",
                "sInfoEmpty":    "Đang xem 0 đến 0 trong tổng số 0 mục",
                "sInfoFiltered": "(được lọc từ _MAX_ mục)",
                "sInfoPostFix":  "",
                "sSearch":       "Tìm:",
                "sUrl":          "",
                "oPaginate": {
                    "sFirst":    "Đầu",
                    "sPrevious": "Trước",
                    "sNext":     "Tiếp",
                    "sLast":     "Cuối"
                }
            }
        });
        cb()
    }
}
const loaderPermissionList = (cb=()=>{}) => {
    if ($('#permission').length) {
        $('#permission').DataTable({
            dom: 'Blfrtip',
            buttons: [
                {
                    extend: 'copy',
                    exportOptions: {
                        columns: [ 0, 1, 2, 3 ]
                    }
                },
                // {
                //     extend: 'csv',
                //     exportOptions: {
                //         columns: [ 0, 1, 2, 3 ]
                //     }
                // },
                {
                    extend: 'excel',
                    exportOptions: {
                        columns: [ 0, 1, 2, 3 ]
                    },
                },
                {
                    extend: 'pdfHtml5',
                    exportOptions: {
                        columns: [ 0, 1, 2, 3]
                    },
                },
                {
                    extend: 'print',
                    exportOptions: {
                        columns: [ 0, 1, 2, 3]
                    },
                    customize : function(win) {
                        let table = $(win.document.body);                                
                        table.find('th, td').addClass('text-center align-middle');
                        table.find('tbody tr').each(function(index){
                            $(this).find('td:eq(0)').html(index+1);
                        });
                    }
                },
            ],
            "processing": true,
            'createdRow': function( row, data, dataIndex ) {
                $(row).addClass('text-center');
                $('td', row).addClass('align-middle');
                $('td:eq(0)', row).html(dataIndex+1);
            },
            columnDefs: [
                { orderable: false, targets: [ 4 ] }
            ],
            "deferRender": true,
            "language": {
                "sProcessing":   "Đang xử lý...",
                "sLengthMenu":   "Xem _MENU_ mục",
                "sZeroRecords":  "Không tìm thấy dòng nào phù hợp",
                "sInfo":         "Đang xem _START_ đến _END_ trong tổng số _TOTAL_ mục",
                "sInfoEmpty":    "Đang xem 0 đến 0 trong tổng số 0 mục",
                "sInfoFiltered": "(được lọc từ _MAX_ mục)",
                "sInfoPostFix":  "",
                "sSearch":       "Tìm:",
                "sUrl":          "",
                "oPaginate": {
                    "sFirst":    "Đầu",
                    "sPrevious": "Trước",
                    "sNext":     "Tiếp",
                    "sLast":     "Cuối"
                }
            }
        });
        cb();
    }
}
const loaderGroup = (cb=()=>{}) => {
    if ($('#group').length) {
        $('#group').DataTable({
            dom: 'Blfrtip',
            buttons: [                        {
                extend: 'copy',
                exportOptions: {
                    columns: [ 0, 1, 2, 3 ]
                }
            },
            {
                extend: 'excel',
                exportOptions: {
                    columns: [ 0, 1, 2, 3]
                },
            },
            {
                extend: 'pdfHtml5',
                exportOptions: {
                    columns: [ 0, 1, 2, 3 ]
                },
            },
            {
                extend: 'print',
                exportOptions: {
                    columns: [ 0, 1, 2, 3 ]
                },
                customize : function(win) {
                    let table = $(win.document.body);                                
                    table.find('th, td').addClass('text-center align-middle');
                    table.find('tbody tr').each(function(index){
                        $(this).find('td:eq(0)').html(index+1);
                    });
                }
            }],
            "processing": true,
            'createdRow': function( row, data, dataIndex ) {
                $(row).addClass('text-center');
                $('td', row).addClass('align-middle');
                $('td:eq(0)', row).html(dataIndex+1);
            },
            "deferRender": true,
            columnDefs: [
                { orderable: false, targets: [ 4 ] }
            ],
            "language": {
                "sProcessing":   "Đang xử lý...",
                "sLengthMenu":   "Xem _MENU_ mục",
                "sZeroRecords":  "Không tìm thấy dòng nào phù hợp",
                "sInfo":         "Đang xem _START_ đến _END_ trong tổng số _TOTAL_ mục",
                "sInfoEmpty":    "Đang xem 0 đến 0 trong tổng số 0 mục",
                "sInfoFiltered": "(được lọc từ _MAX_ mục)",
                "sInfoPostFix":  "",
                "sSearch":       "Tìm:",
                "sUrl":          "",
                "oPaginate": {
                    "sFirst":    "Đầu",
                    "sPrevious": "Trước",
                    "sNext":     "Tiếp",
                    "sLast":     "Cuối"
                }
            }
        });
        cb();
    }
}
const loaderUser = (cb=()=>{}) => {
    if ($('#userTB').length) {
        $('#userTB').DataTable({
            dom: 'Blfrtip',
            buttons: [
                {
                    extend: 'copy',
                    exportOptions: {
                        columns: [ 0, 1, 2, 3, 4, 5, 6]
                    }
                },
                // {
                //     extend: 'csv',
                //     exportOptions: {
                //         columns: [ 0, 1, 2, 3, 4, 5, 6]
                //     }
                // },
                {
                    extend: 'excel',
                    exportOptions: {
                        columns: [ 0, 1, 2, 3, 4, 5, 6]
                    },
                },
                {
                    extend: 'pdfHtml5',
                    exportOptions: {
                        columns: [ 0, 1, 2, 3, 4, 5, 6]
                    },
                },
                {
                    extend: 'print',
                    exportOptions: {
                        columns: [ 0, 1, 2, 3, 4, 5, 6]
                    },
                    customize : function(win) {
                        let table = $(win.document.body);                                
                        table.find('th, td').addClass('text-center align-middle');
                        table.find('tbody tr').each(function(index){
                            $(this).find('td:eq(0)').html(index+1);
                        });
                    }
                },
            ],
            "autoWidth": false,
            "processing": true,
            'createdRow': function( row, data, dataIndex ) {
                $(row).addClass('text-center');
                $('td', row).addClass('align-middle');
                $('td:eq(8)', row).addClass('hidden');
                $('td:eq(9)', row).addClass('hidden');
                $('td:eq(0)', row).html(dataIndex+1);
            },
            "deferRender": true,
            columnDefs: [
                { orderable: false, targets: [ 7 ] }
            ],
            "language": {
                "sProcessing":   "Đang xử lý...",
                "sLengthMenu":   "Xem _MENU_ mục",
                "sZeroRecords":  "Không tìm thấy dòng nào phù hợp",
                "sInfo":         "Đang xem _START_ đến _END_ trong tổng số _TOTAL_ mục",
                "sInfoEmpty":    "Đang xem 0 đến 0 trong tổng số 0 mục",
                "sInfoFiltered": "(được lọc từ _MAX_ mục)",
                "sInfoPostFix":  "",
                "sSearch":       "Tìm:",
                "sUrl":          "",
                "oPaginate": {
                    "sFirst":    "Đầu",
                    "sPrevious": "Trước",
                    "sNext":     "Tiếp",
                    "sLast":     "Cuối"
                }
            }
        });
        cb()
    }
}
const loaderMail = (cb=()=>{}) => {
    if ($('#mailTB').length) {
        $('#mailTB').DataTable({
            dom: 'Blfrtip',
            buttons: [
                'copy', 'excel', 'pdf', 'print'
            ],
            "processing": true,
            'createdRow': function( row, data, dataIndex ) {
                $(row).addClass('text-center');
                $('td', row).addClass('align-middle');
                $('td:eq(0)', row).html(dataIndex+1);
            },
            "deferRender": true,
            "language": {
                "sProcessing":   "Đang xử lý...",
                "sLengthMenu":   "Xem _MENU_ mục",
                "sZeroRecords":  "Không tìm thấy dòng nào phù hợp",
                "sInfo":         "Đang xem _START_ đến _END_ trong tổng số _TOTAL_ mục",
                "sInfoEmpty":    "Đang xem 0 đến 0 trong tổng số 0 mục",
                "sInfoFiltered": "(được lọc từ _MAX_ mục)",
                "sInfoPostFix":  "",
                "sSearch":       "Tìm:",
                "sUrl":          "",
                "oPaginate": {
                    "sFirst":    "Đầu",
                    "sPrevious": "Trước",
                    "sNext":     "Tiếp",
                    "sLast":     "Cuối"
                }
            }
        });
        cb();
    }
}
const loaderDepartment = (cb=()=>{}) => {
    if ($('#department').length) {
        $('#department').DataTable({
            dom: 'Blfrtip',
            buttons: [
                {
                    extend: 'copy',
                    exportOptions: {
                        columns: [ 0, 1, 2, 3, 4, 5 ]
                    }
                },
                // {
                //     extend: 'csv',
                //     exportOptions: {
                //         columns: [ 0, 1, 2, 3, 4, 5 ]
                //     }
                // },
                {
                    extend: 'excel',
                    exportOptions: {
                        columns: [ 0, 1, 2, 3, 4, 5 ]
                    },
                },
                {
                    extend: 'pdfHtml5',
                    exportOptions: {
                        columns: [ 0, 1, 2, 3, 4, 5 ]
                    },
                },
                {
                    extend: 'print',
                    exportOptions: {
                        columns: [ 0, 1, 2, 3, 4, 5 ]
                    },
                    customize : function(win) {
                        let table = $(win.document.body);                                
                        table.find('th, td').addClass('text-center align-middle');
                        table.find('tbody tr').each(function(index){
                            $(this).find('td:eq(0)').html(index+1);
                        });
                    }
                },
            ],
            "processing": true,
            'createdRow': function( row, data, dataIndex ) {
                $(row).addClass('text-center');
                $('td', row).addClass('align-middle');
                $('td:eq(0)', row).html(dataIndex+1);
            },
            "deferRender": true,
            columnDefs: [
                { orderable: false, targets: [ 6 ] }
            ],
            "language": {
                "sProcessing":   "Đang xử lý...",
                "sLengthMenu":   "Xem _MENU_ mục",
                "sZeroRecords":  "Không tìm thấy dòng nào phù hợp",
                "sInfo":         "Đang xem _START_ đến _END_ trong tổng số _TOTAL_ mục",
                "sInfoEmpty":    "Đang xem 0 đến 0 trong tổng số 0 mục",
                "sInfoFiltered": "(được lọc từ _MAX_ mục)",
                "sInfoPostFix":  "",
                "sSearch":       "Tìm:",
                "sUrl":          "",
                "oPaginate": {
                    "sFirst":    "Đầu",
                    "sPrevious": "Trước",
                    "sNext":     "Tiếp",
                    "sLast":     "Cuối"
                }
            }
        });
        cb()
    }
}
const loaderMethod = (cb=()=>{}) => {
    if ($('#method').length) {
        $('#method').DataTable({
            dom: 'Blfrtip',
            buttons: [
                {
                    extend: 'copy',
                    exportOptions: {
                        columns: [ 0, 1, 2, 3]
                    }
                },
                // {
                //     extend: 'csv',
                //     exportOptions: {
                //         columns: [ 0, 1, 2, 3]
                //     }
                // },
                {
                    extend: 'excel',
                    exportOptions: {
                        columns: [ 0, 1, 2, 3]
                    },
                },
                {
                    extend: 'pdfHtml5',
                    exportOptions: {
                        columns: [ 0, 1, 2, 3]
                    },
                },
                {
                    extend: 'print',
                    exportOptions: {
                        columns: [ 0, 1, 2, 3]
                    },
                    customize : function(win) {
                        let table = $(win.document.body);                                
                        table.find('th, td').addClass('text-center align-middle');
                        table.find('tbody tr').each(function(index){
                            $(this).find('td:eq(0)').html(index+1);
                        });
                    }
                },
            ],
            "processing": true,
            'createdRow': function( row, data, dataIndex ) {
                $(row).addClass('text-center');
                $('td', row).addClass('align-middle');
                $('td:eq(0)', row).html(dataIndex+1);
                $('td:eq(2)', row).addClass('text-justify');
            },
            "deferRender": true,
            columnDefs: [
                { orderable: false, targets: [ 4 ] }
            ],
            "language": {
                "sProcessing":   "Đang xử lý...",
                "sLengthMenu":   "Xem _MENU_ mục",
                "sZeroRecords":  "Không tìm thấy dòng nào phù hợp",
                "sInfo":         "Đang xem _START_ đến _END_ trong tổng số _TOTAL_ mục",
                "sInfoEmpty":    "Đang xem 0 đến 0 trong tổng số 0 mục",
                "sInfoFiltered": "(được lọc từ _MAX_ mục)",
                "sInfoPostFix":  "",
                "sSearch":       "Tìm:",
                "sUrl":          "",
                "oPaginate": {
                    "sFirst":    "Đầu",
                    "sPrevious": "Trước",
                    "sNext":     "Tiếp",
                    "sLast":     "Cuối"
                }
            }
        });
        cb();
    }
}
const loaderFaq = (cb=()=>{}) => {
    if ($('#faq').length) {
        $('#faq').DataTable({
            dom: 'Blfrtip',
            buttons: [
            {
                extend: 'copy',
                exportOptions: {
                    columns: [ 0, 1, 2, 3, 4, 5 ]
                }
            },
            // {
            //     extend: 'csv',
            //     exportOptions: {
            //         columns: [ 0, 1, 2, 3, 4, 5 ]
            //     }
            // },
            {
                extend: 'excel',
                exportOptions: {
                    columns: [ 0, 1, 2, 3, 4, 5 ]
                },
            },
            {
                extend: 'pdfHtml5',
                exportOptions: {
                    columns: [ 0, 1, 2, 3, 4, 5 ]
                },
            },
            {
                extend: 'print',
                exportOptions: {
                    columns: [ 0, 1, 2, 3, 4, 5 ]
                },
                customize : function(win) {
                    let table = $(win.document.body);                                
                    table.find('th, td').addClass('text-center align-middle');
                    table.find('tbody tr').each(function(index){
                        $(this).find('td:eq(0)').html(index+1);
                    });
                }
            },
            ],
            "processing": true,
            'createdRow': function( row, data, dataIndex ) {
                $(row).addClass('text-center');
                $('td:eq(2)', row).addClass('text-left');
                $('td:eq(3)', row).addClass('text-left');
                $('td', row).addClass('align-middle');
                $('td:eq(0)', row).html(dataIndex+1);
            },
            "deferRender": true,
            columnDefs: [
                { orderable: false, targets: [ 6 ] }
            ],
            "language": {
                "sProcessing":   "Đang xử lý...",
                "sLengthMenu":   "Xem _MENU_ mục",
                "sZeroRecords":  "Không tìm thấy dòng nào phù hợp",
                "sInfo":         "Đang xem _START_ đến _END_ trong tổng số _TOTAL_ mục",
                "sInfoEmpty":    "Đang xem 0 đến 0 trong tổng số 0 mục",
                "sInfoFiltered": "(được lọc từ _MAX_ mục)",
                "sInfoPostFix":  "",
                "sSearch":       "Tìm:",
                "sUrl":          "",
                "oPaginate": {
                    "sFirst":    "Đầu",
                    "sPrevious": "Trước",
                    "sNext":     "Tiếp",
                    "sLast":     "Cuối"
                }
            }
        });
        cb();
    }
}
const loaderLog = (cb=()=>{}) => {
    if ($('#log').length) {
        $('#log').DataTable({
            dom: 'Blfrtip',
            buttons: [
                {
                    extend: 'copy',
                    exportOptions: {
                        columns: [ 0, 1, 2, 3, 4, 5]
                    }
                },
                {
                    extend: 'excel',
                    exportOptions: {
                        columns: [ 0, 1, 2, 3, 4, 5]
                    },
                },
                {
                    extend: 'pdfHtml5',
                    exportOptions: {
                        columns: [ 0, 1, 2, 3, 4, 5]
                    },
                },
                {
                    extend: 'print',
                    exportOptions: {
                        columns: [ 0, 1, 2, 3, 4, 5]
                    },
                    customize : function(win) {
                        let table = $(win.document.body);                                
                        table.find('th, td').addClass('text-center align-middle');
                        table.find('tbody tr').each(function(index){
                            $(this).find('td:eq(0)').html(index+1);
                        });
                    }
                },
            ],
            columnDefs: [
                { orderable: false, targets: [ 5 ] }
            ],
            "processing": true,
            'createdRow': function( row, data, dataIndex ) {
                $(row).addClass('text-center');
                $('td', row).addClass('align-middle');
                $('td:eq(0)', row).html(dataIndex+1);
            },
            "aLengthMenu": [[100, 200, 300], [100, 200, 300]],
            "deferRender": true,
            "language": {
                "sProcessing":   "Đang xử lý...",
                "sLengthMenu":   "Xem _MENU_ mục",
                "sZeroRecords":  "Không tìm thấy dòng nào phù hợp",
                "sInfo":         "Đang xem _START_ đến _END_ trong tổng số _TOTAL_ mục",
                "sInfoEmpty":    "Đang xem 0 đến 0 trong tổng số 0 mục",
                "sInfoFiltered": "(được lọc từ _MAX_ mục)",
                "sInfoPostFix":  "",
                "sSearch":       "Tìm:",
                "sUrl":          "",
                "oPaginate": {
                    "sFirst":    "Đầu",
                    "sPrevious": "Trước",
                    "sNext":     "Tiếp",
                    "sLast":     "Cuối"
                }
            }
        });
        cb();
    }
}
const loaderLogClient = (cb=()=>{}) => {
    if ($('#log_client').length) {
        $('#log_client').DataTable({
            dom: 'Blfrtip',
            buttons: [
                {
                    extend: 'copy',
                    exportOptions: {
                        columns: [ 0, 1, 2, 3, 4, 5]
                    }
                },
                // {
                //     extend: 'csv',
                //     exportOptions: {
                //         columns: [ 0, 1, 2, 3, 4, 5]
                //     }
                // },
                {
                    extend: 'excel',
                    exportOptions: {
                        columns: [ 0, 1, 2, 3, 4, 5]
                    },
                },
                {
                    extend: 'pdfHtml5',
                    exportOptions: {
                        columns: [ 0, 1, 2, 3, 4, 5]
                    },
                },
                {
                    extend: 'print',
                    exportOptions: {
                        columns: [ 0, 1, 2, 3, 4, 5]
                    },
                    customize : function(win) {
                        let table = $(win.document.body);                                
                        table.find('th, td').addClass('text-center align-middle');
                        table.find('tbody tr').each(function(index){
                            $(this).find('td:eq(0)').html(index+1);
                        });
                    }
                },
            ],
            columnDefs: [
                { orderable: false, targets: [ 5 ] }
            ],
            "processing": true,
            'createdRow': function( row, data, dataIndex ) {
                $(row).addClass('text-center');
                $('td', row).addClass('align-middle');
                $('td:eq(0)', row).html(dataIndex+1);
            },
            "deferRender": true,
            "aLengthMenu": [[100, 200, 300], [100, 200, 300]],
            "language": {
                "sProcessing":   "Đang xử lý...",
                "sLengthMenu":   "Xem _MENU_ mục",
                "sZeroRecords":  "Không tìm thấy dòng nào phù hợp",
                "sInfo":         "Đang xem _START_ đến _END_ trong tổng số _TOTAL_ mục",
                "sInfoEmpty":    "Đang xem 0 đến 0 trong tổng số 0 mục",
                "sInfoFiltered": "(được lọc từ _MAX_ mục)",
                "sInfoPostFix":  "",
                "sSearch":       "Tìm:",
                "sUrl":          "",
                "oPaginate": {
                    "sFirst":    "Đầu",
                    "sPrevious": "Trước",
                    "sNext":     "Tiếp",
                    "sLast":     "Cuối"
                }
            }
        });
        cb();
    }
}
const loaderEmail = (cb=()=>{}) => {
    if ($('#tb_email').length) {
        $('#tb_email').DataTable({
            dom: 'Blfrtip',
            buttons: [
                {
                    extend: 'copy',
                    exportOptions: {
                        columns: [ 0, 1, 2, 3, 4, 5]
                    }
                },
                // {
                //     extend: 'csv',
                //     exportOptions: {
                //         columns: [ 0, 1, 2, 3, 4, 5]
                //     }
                // },
                {
                    extend: 'excel',
                    exportOptions: {
                        columns: [ 0, 1, 2, 3, 4, 5]
                    },
                },
                {
                    extend: 'pdfHtml5',
                    exportOptions: {
                        columns: [ 0, 1, 2, 3, 4, 5]
                    },
                },
                {
                    extend: 'print',
                    exportOptions: {
                        columns: [ 0, 1, 2, 3, 4, 5]
                    },
                    customize : function(win) {
                        let table = $(win.document.body);                                
                        table.find('th, td').addClass('text-center align-middle');
                        table.find('tbody tr').each(function(index){
                            $(this).find('td:eq(0)').html(index+1);
                        });
                    }
                },
            ],
            columnDefs: [
                { orderable: false, targets: [ 5 ] }
            ],
            "processing": true,
            'createdRow': function( row, data, dataIndex ) {
                $(row).addClass('text-center');
                $('td', row).addClass('align-middle');
                $('td:eq(0)', row).html(dataIndex+1);
            },
            "deferRender": true,
            "language": {
                "sProcessing":   "Đang xử lý...",
                "sLengthMenu":   "Xem _MENU_ mục",
                "sZeroRecords":  "Không tìm thấy dòng nào phù hợp",
                "sInfo":         "Đang xem _START_ đến _END_ trong tổng số _TOTAL_ mục",
                "sInfoEmpty":    "Đang xem 0 đến 0 trong tổng số 0 mục",
                "sInfoFiltered": "(được lọc từ _MAX_ mục)",
                "sInfoPostFix":  "",
                "sSearch":       "Tìm:",
                "sUrl":          "",
                "oPaginate": {
                    "sFirst":    "Đầu",
                    "sPrevious": "Trước",
                    "sNext":     "Tiếp",
                    "sLast":     "Cuối"
                }
            }
        });
        cb();
    }
}
const loaderSMS = (cb=()=>{}) => {
    if ($('#tb_sms').length) {
        $('#tb_sms').DataTable({
            dom: 'Blfrtip',
            buttons: [
                {
                    extend: 'copy',
                    exportOptions: {
                        columns: [ 0, 1, 2, 3, 4, 5]
                    }
                },
                // {
                //     extend: 'csv',
                //     exportOptions: {
                //         columns: [ 0, 1, 2, 3, 4, 5]
                //     }
                // },
                {
                    extend: 'excel',
                    exportOptions: {
                        columns: [ 0, 1, 2, 3, 4, 5]
                    },
                },
                {
                    extend: 'pdfHtml5',
                    exportOptions: {
                        columns: [ 0, 1, 2, 3, 4, 5]
                    },
                },
                {
                    extend: 'print',
                    exportOptions: {
                        columns: [ 0, 1, 2, 3, 4, 5]
                    },
                    customize : function(win) {
                        let table = $(win.document.body);                                
                        table.find('th, td').addClass('text-center align-middle');
                        table.find('tbody tr').each(function(index){
                            $(this).find('td:eq(0)').html(index+1);
                        });
                    }
                },
            ],
            columnDefs: [
                { orderable: false, targets: [ 5 ] }
            ],
            "processing": true,
            'createdRow': function( row, data, dataIndex ) {
                $(row).addClass('text-center');
                $('td', row).addClass('align-middle');
                $('td:eq(0)', row).html(dataIndex+1);
            },
            "deferRender": true,
            "language": {
                "sProcessing":   "Đang xử lý...",
                "sLengthMenu":   "Xem _MENU_ mục",
                "sZeroRecords":  "Không tìm thấy dòng nào phù hợp",
                "sInfo":         "Đang xem _START_ đến _END_ trong tổng số _TOTAL_ mục",
                "sInfoEmpty":    "Đang xem 0 đến 0 trong tổng số 0 mục",
                "sInfoFiltered": "(được lọc từ _MAX_ mục)",
                "sInfoPostFix":  "",
                "sSearch":       "Tìm:",
                "sUrl":          "",
                "oPaginate": {
                    "sFirst":    "Đầu",
                    "sPrevious": "Trước",
                    "sNext":     "Tiếp",
                    "sLast":     "Cuối"
                }
            }
        });
        cb();
    }
}
const getTypeFile = (str) => {
   var base = new String(str).substring(str.lastIndexOf('/') + 1); 
    if(base.lastIndexOf(".") != -1)       
        base = base.substring(0, base.lastIndexOf("."));
   return base;
}

const saveGenaralSetting = (formId) => {
    if($(formId).length){
        let form = $(formId);
        let href = form.attr('action');
        form.validator().on('submit', function (e) {
            if (e.isDefaultPrevented()) {
                // handle the invalid form...
            } else {
                e.preventDefault();
                let data = form.serializeArray();
                let arrField = [];
                $.ajax({
                    type: "POST",
                    url: href,
                    data: data,
                    dataType: "json",
                    success: function (results) {
                        swal("Thành công !!!", `Cập nhật thành công !!!`, "success");
                    },
                    error: function (error) {
                        if (error.responseJSON === undefined) {
                            swal({
                                title: "Lỗi !!",
                                text: `<strong class="text-danger">Lỗi chưa xác định !!</strong>`,
                                type: "error",
                                html: true
                            });
                        } else {
                            let err = '';
                            error.responseJSON.error.forEach(element => {
                                err += element + ' !!</br>';
                            });
                            swal({
                                title: "Lỗi !!",
                                text: `<strong class="text-danger"> ${err}</strong>`,
                                type: "error",
                                html: true
                            });
                        }
                    }
                });
            }
        });
    }
    return false;
}