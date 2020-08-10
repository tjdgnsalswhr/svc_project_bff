<%--<%@ page import="java.util.HashMap" %>--%>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%-- <% request.setAttribute("webUrl", "/resources"); %> --%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>SVC with SK</title>
    <link rel="stylesheet" href="/resources/assets/css/login.css">
    <!--     Fonts and icons     -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">

    <!-- CSS Files -->
    <link href="/resources/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="/resources/assets/css/datepicker.min.css" rel="stylesheet" type="text/css">
    <link href="/resources/assets/css/paper-dashboard.css?v=2.0.0" rel="stylesheet" />
    <script src="/resources/assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
    <script src="/resources/assets/js/core/jquery.min.js"></script>
    <script src="/resources/assets/js/core/bootstrap.min.js"></script>
    <script src="/resources/assets/js/datepicker.min.js"></script>
    <script src="/resources/assets/js/i18n/datepicker.en.js"></script>
    <script src="/resources/assets/js/team_list_information.js"></script>

    <%
        //String tmbrCustDomain= (String)request.getAttribute("tmbrCustDomain");
        response.addHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Access-Control-Allow-Headers", "origin, x-requested-with, content-type, accept");
        //List customerList = (List) request.getAttribute("custList");
        String cid = (String)request.getAttribute("cid");
    %>

</head>

<body class="" onLoad="init_team_list_info_page();">
    <div class="wrapper ">
        <div class="sidebar" data-color="white" data-active-color="danger">
            <!--
       Tip 1: You can change the color of the sidebar using: data-color="blue | green | orange | red | yellow"
   -->
            <div class="logo">
                <a href="#" class="simple-text logo-mini">
                    <div class="logo-image-small">
                        <img src="/resources/assets/img/SVC로고4.png">
                    </div>
                </a>
                <a href="#" class="simple-text logo-normal" style="font-weight: bold">
                    SVC with SK
                    <!-- <div class="logo-image-big">
           <img src="../assets/img/logo-big.png">
         </div> -->
                </a>
            </div>
            <div class="sidebar-wrapper" style="overflow-x: hidden; overflow-y: hidden">
                <ul class="nav">
                    <li>
                        <a id="team_list_store_href_id" style="font-weight: bold">
                            <i class="nc-icon nc-shop"></i>
                            <p>가게조회</p>
                        </a>
                    </li>
                    <li class="active">
                        <a id="team_list_info_href_id" style="font-weight: bold">
                            <i class="nc-icon nc-bullet-list-67"></i>
                            <p>정보조회</p>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="main-panel">
            <!-- Navbar -->
            <nav class="navbar navbar-expand-lg navbar-absolute fixed-top navbar-transparent">
                <div class="container-fluid">
                    <div class="navbar-wrapper">
                        <div class="navbar-toggle">
                            <button type="button" class="navbar-toggler">
                                <span class="navbar-toggler-bar bar1"></span>
                                <span class="navbar-toggler-bar bar2"></span>
                                <span class="navbar-toggler-bar bar3"></span>
                            </button>
                        </div>
                        <a id="list_title_id" class="navbar-brand" style="font-weight: bold"></a>
                    </div>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation"
                        aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-bar navbar-kebab"></span>
                        <span class="navbar-toggler-bar navbar-kebab"></span>
                        <span class="navbar-toggler-bar navbar-kebab"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-end" id="navigation">

                        <ul class="navbar-nav">
                            <li class="nav-item d-none">
                                <a class="nav-link btn-magnify" href="#pablo">
                                    <i class="nc-icon nc-layout-11"></i>
                                    <p>
                                        <span class="d-lg-none d-md-block">Stats</span>
                                    </p>
                                </a>
                            </li>
                            <li class="nav-item btn-rotate dropdown d-none">
                                <a class="nav-link dropdown-toggle" href="http://example.com"
                                    id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true"
                                    aria-expanded="false">
                                    <i class="nc-icon nc-bell-55"></i>
                                    <p>
                                        <span class="d-lg-none d-md-block">Some Actions</span>
                                    </p>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                                    <a class="dropdown-item" href="#">Action</a>
                                    <a class="dropdown-item" href="#">Another action</a>
                                    <a class="dropdown-item" href="#">Something else here</a>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link btn-rotate" href="login.html" style="font-weight: bold">
                                    로그아웃&nbsp;
                                    <i class="fa fa-sign-out"></i>
                                    <p>
                                        <span class="d-lg-none d-md-block">Account</span>
                                    </p>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <!-- End Navbar -->
            <!-- <div class="panel-header panel-header-sm">
 
 
</div> -->
            <div class="content">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">선불 잔액 조회</h4>
                                <hr class="one">
                            </div>
                            <div class="card-body">

                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">과거 내역 조회</h4>
                                <hr class="one">
                            </div>
                            <div class="card-body">

                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <div class="content">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">과거 내역 조회</h4>
                                <hr class="one">
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="card">
                                            <div class="card-header">
                                                <h4 class="card-title">
                                                    과거 내역
                                                </h4>
                                                <div class="row">
                                                    <div class="col-md-3">
                                                        <div class="form-group">
                                                            <label>시작일</label>
                                                            <input id="pick_start" type="text" class="form-control"
                                                                autocomplete="off">

                                                            <script>
                                                                // Create start date
                                                                var start = new Date(),
                                                                    prevDay,
                                                                    startHours = 0;

                                                                // 09:00 AM
                                                                start.setHours(9);
                                                                start.setMinutes(0);

                                                                // If today is Saturday or Sunday set 10:00 AM
                                                                if ([6, 0].indexOf(start.getDay()) != -1) {
                                                                    start.setHours(10);
                                                                    startHours = 10
                                                                }

                                                                $('#pick_start').datepicker({
                                                                    timepicker: true,
                                                                    language: 'en',
                                                                    startDate: start,
                                                                    minHours: startHours,
                                                                    maxHours: 24,
                                                                    todayButton: new Date(),
                                                                    clearButton: true,
                                                                    autoClose: true,
                                                                    onSelect: function (fd, d, picker) {
                                                                        // Do nothing if selection was cleared
                                                                        if (!d) return;

                                                                        var day = d.getDay();

                                                                        // Trigger only if date is changed
                                                                        if (prevDay != undefined && prevDay == day) return;
                                                                        prevDay = day;

                                                                        // If chosen day is Saturday or Sunday when set
                                                                        // hour value for weekends, else restore defaults
                                                                        if (day == 6 || day == 0) {
                                                                            picker.update({
                                                                                minHours: 10,
                                                                                maxHours: 16
                                                                            })
                                                                        } else {
                                                                            picker.update({
                                                                                minHours: 0,
                                                                                maxHours: 24
                                                                            })
                                                                        }
                                                                    }
                                                                })
                                                            </script>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3">
                                                        <div class="form-group">
                                                            <label>종료일</label>
                                                            <input id="pick_end" type="text" class="form-control"
                                                                autocomplete="off">

                                                            <script>
                                                                // Create start date
                                                                var start = new Date(),
                                                                    prevDay,
                                                                    startHours = 0;

                                                                // 09:00 AM
                                                                start.setHours(9);
                                                                start.setMinutes(0);

                                                                // If today is Saturday or Sunday set 10:00 AM
                                                                if ([6, 0].indexOf(start.getDay()) != -1) {
                                                                    start.setHours(10);
                                                                    startHours = 10
                                                                }

                                                                $('#pick_end').datepicker({
                                                                    timepicker: true,
                                                                    language: 'en',
                                                                    startDate: start,
                                                                    minHours: startHours,
                                                                    maxHours: 24,
                                                                    todayButton: new Date(),
                                                                    clearButton: true,
                                                                    autoClose: true,
                                                                    onSelect: function (fd, d, picker) {
                                                                        // Do nothing if selection was cleared
                                                                        if (!d) return;

                                                                        var day = d.getDay();

                                                                        // Trigger only if date is changed
                                                                        if (prevDay != undefined && prevDay == day) return;
                                                                        prevDay = day;

                                                                        //chosen day is Saturday or Sunday when set
                                                                        // hour value for weekends, else restore defaults
                                                                        if (day == 6 || day == 0) {
                                                                            picker.update({
                                                                                minHours: 10,
                                                                                maxHours: 16
                                                                            })
                                                                        } else {
                                                                            picker.update({
                                                                                minHours: 0,
                                                                                maxHours: 24
                                                                            })
                                                                        }
                                                                    }
                                                                })
                                                            </script>
                                                        </div>
                                                    </div>

                                                    <div class="col-md-2 align-self-end">
                                                        <button type='button' class='btn btn-outline-danger'
                                                            onclick="choose_datetime()"> 조회하기 </button>
                                                    </div>
                                                </div>
                                            </div>


                                            <div class="card-body">


                                                <ul class="nav nav-tabs mr-auto nav-justified" id="myHistoryTab"
                                                    role="tablist">
                                                    <li class="nav-item active">
                                                        <a class="nav-link active text-danger"
                                                            style="font-weight: bold; font-size: medium" id="entire-tab"
                                                            data-toggle="tab" href="#entire" role="tab"
                                                            aria-controls="entire" aria-selected="true">전체</a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a class="nav-link text-danger"
                                                            style="font-weight: bold; font-size: medium" id="charge-tab"
                                                            data-toggle="tab" href="#charge" role="tab"
                                                            aria-controls="charge" aria-selected="false">충전</a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a class="nav-link text-danger"
                                                            style="font-weight: bold; font-size: medium" id="use-tab"
                                                            data-toggle="tab" href="#use" role="tab" aria-controls="use"
                                                            aria-selected="false">결제</a>
                                                    </li>
                                                </ul>
                                                <br>
                                            </div>

                                            <div class="tab-content" id="myHistoryTabContent">
                                                <!-------------------------------전체 메뉴 보기------------------------------------------------->
                                                <div class="tab-pane fade show active" id="entire" role="tabpanel"
                                                    aria-labelledby="entire-tab">
                                                    <div class="col-md-12" id="entire_detail">
                                                        <div class="table-responsive"
                                                            style="overflow-x: hidden; overflow-y: hidden">
                                                            <table class="table">
                                                                <thead class="text-danger">
                                                                    <th>
                                                                        팀 이름
                                                                    </th>
                                                                    <th>
                                                                        가게 이름
                                                                    </th>
                                                                    <th>
                                                                        금액
                                                                    </th>
                                                                    <th>
                                                                        날짜
                                                                    </th>
                                                                    <th>
                                                                        남은 금액
                                                                    </th>
                                                                </thead>
                                                                <tbody id="customer_entire_list">
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>

                                                <!------------------------------메인 메뉴 보기------------------------------------------------->

                                                <div class="tab-pane fade" id="charge" role="tabpanel"
                                                    aria-labelledby="charge-tab">
                                                    <div class="col-md-12" id="charge_detail">
                                                        <div class="table-responsive"
                                                            style="overflow-x: hidden; overflow-y: hidden">
                                                            <table class="table">
                                                                <thead class="text-danger">
                                                                    <th>
                                                                        팀 이름
                                                                    </th>
                                                                    <th>
                                                                        가게 이름
                                                                    </th>
                                                                    <th>
                                                                        금액
                                                                    </th>
                                                                    <th>
                                                                        날짜
                                                                    </th>
                                                                    <th>
                                                                        남은 금액
                                                                    </th>
                                                                </thead>
                                                                <tbody id="customer_charge_list">
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>

                                                <!-------------------------------사이드 메뉴 보기------------------------------------------------->

                                                <div class="tab-pane fade" id="use" role="tabpanel"
                                                    aria-labelledby="use-tab">
                                                    <div class="col-md-12" id="use_detail">
                                                        <div class="table-responsive"
                                                            style="overflow-x: hidden; overflow-y: hidden">
                                                            <table class="table">
                                                                <thead class="text-danger">
                                                                    <th>
                                                                        팀 이름
                                                                    </th>
                                                                    <th>
                                                                        가게 이름
                                                                    </th>
                                                                    <th>
                                                                        금액
                                                                    </th>
                                                                    <th>
                                                                        날짜
                                                                    </th>
                                                                    <th>
                                                                        남은 금액
                                                                    </th>
                                                                </thead>
                                                                <tbody id="customer_use_list">
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <footer class="footer footer-black  footer-white ">
                <div class="container-fluid">
                    <div class="row">
                        <!------------------------->
                        <nav class="footer-nav">
                            <ul>
                                <li>
                                    <a href="https://github.com/tjdgnsalswhr/svc_project_bff/" target="_blank">PyramidTop's
                                        Github</a>

                                </li>

                            </ul>

                        </nav>

                        <div class="credits ml-auto">

                            <span class="copyright">

                                ©

                                <script>

                                    document.write(new Date().getFullYear())

                                </script>, made with <i class="fa fa-star"></i> by Digital Poc Intern
                            </span>
                        </div>
                    </div>
                </div>
            </footer>
        </div>
    </div>
    </div>
    </div>
    <!--   Core JS Files   -->

    <script>
        var cid = "<%=cid%>";
        alert(cid);
        
        function init_team_list_info_page()
        {
            get_team_list_store_page();
            get_team_list_information_page();
            datepick();
	        event.preventDefault();
        }

        function get_team_list_store_page() {
            document.getElementById("team_list_store_href_id").href = "../list-store/"+cid;
        }

        function get_team_list_information_page() {
            document.getElementById("team_list_info_href_id").href = "../list-info/" + cid;
        }
    </script>


    <!--  Notifications Plugin    -->
    <script src="/resources/assets/js/core/popper.min.js"></script>
    <script src="/resources/js/plugins/bootstrap-notify.js"></script>
    <!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
    <script src="/resources/assets/js/paper-dashboard.min.js?v=2.0.0" type="text/javascript"></script>
</body>

</html>