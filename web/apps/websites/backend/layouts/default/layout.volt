<!DOCTYPE html>
<html lang="en">

<head>
    <meta name="description" content="Admin">
    <!-- Twitter meta-->
    <meta property="twitter:card" content="admin">
    <meta property="twitter:site" content="@admin">
    <meta property="twitter:creator" content="@admin">
    <!-- Open Graph Meta-->
    <meta property="og:type" content="website">
    <meta property="og:site_name" content="Admin">
    <meta property="og:title" content="Admin">
    <meta property="og:url" content="/">
    <meta property="og:image" content="/">
    <meta property="og:description" content="">
    <title>ADMIN</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="icon" type="image/png" sizes="16x16" href="/favicon.ico">

    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css" href="/assets/backend/fonts/font-awesome/css/font-awesome.min.css">
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="/assets/backend/css/main.css">
    {{ assets.outputCss() }}
</head>

<body class="app sidebar-mini rtl">

    <!-- header header  -->
    {{ partial('header') }}
    <!-- Left Sidebar  -->
    {{ partial('slidebar') }}

    {{ content() }}

    {{ partial('footer') }}


    <!-- Inclue Javascript -->
    <!-- Essential javascripts for application to work-->
    <script src="/assets/backend/js/jquery-3.2.1.min.js"></script>
    <script src="/assets/backend/js/popper.min.js"></script>
    <script src="/assets/backend/js/bootstrap.min.js"></script>
    <script src="/assets/backend/js/main.js"></script>
    <!-- The javascript plugin to display page loading on top-->
    <script src="/assets/backend/js/plugins/pace.min.js"></script>
    <!-- Page specific javascripts-->
    <script type="text/javascript" src="/assets/backend/js/plugins/chart.js"></script>
    <script type="text/javascript">
      var data = {
      	labels: ["January", "February", "March", "April", "May"],
      	datasets: [
      		{
      			label: "My First dataset",
      			fillColor: "rgba(220,220,220,0.2)",
      			strokeColor: "rgba(220,220,220,1)",
      			pointColor: "rgba(220,220,220,1)",
      			pointStrokeColor: "#fff",
      			pointHighlightFill: "#fff",
      			pointHighlightStroke: "rgba(220,220,220,1)",
      			data: [65, 59, 80, 81, 56]
      		},
      		{
      			label: "My Second dataset",
      			fillColor: "rgba(151,187,205,0.2)",
      			strokeColor: "rgba(151,187,205,1)",
      			pointColor: "rgba(151,187,205,1)",
      			pointStrokeColor: "#fff",
      			pointHighlightFill: "#fff",
      			pointHighlightStroke: "rgba(151,187,205,1)",
      			data: [28, 48, 40, 19, 86]
      		}
      	]
      };
      var pdata = [
      	{
      		value: 300,
      		color: "#46BFBD",
      		highlight: "#5AD3D1",
      		label: "Complete"
      	},
      	{
      		value: 50,
      		color:"#F7464A",
      		highlight: "#FF5A5E",
      		label: "In-Progress"
      	}
      ]
      
      var ctxl = $("#lineChartDemo").get(0).getContext("2d");
      var lineChart = new Chart(ctxl).Line(data);
      
      var ctxp = $("#pieChartDemo").get(0).getContext("2d");
      var pieChart = new Chart(ctxp).Pie(pdata);
    </script>
    <!-- Google analytics script-->
    <script type="text/javascript">
      if(document.location.hostname == 'pratikborsadiya.in') {
      	(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
      	(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
      	m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
      	})(window,document,'script','//www.google-analytics.com/analytics.js','ga');
      	ga('create', 'UA-72504830-1', 'auto');
      	ga('send', 'pageview');
      }
    </script>
</body>

</html>