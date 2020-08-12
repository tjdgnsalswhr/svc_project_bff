<%--<%@ page import="java.util.HashMap" %>--%>
<%@ page import="java.util.List" %>
<%@ page import="com.skcc.svc.application.login.vo.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%-- <% request.setAttribute("webUrl", "/resources"); %> --%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>

<head>


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
      List<CustomerResponseDTO> teamList = (List<CustomerResponseDTO>) request.getAttribute("TeamList");
      String cid = (String)request.getAttribute("cid");
      String sid = (String)request.getAttribute("sid");
	  String sname = (String)request.getAttribute("sname");
      response.addHeader("Access-Control-Allow-Origin", "*");
      response.setHeader("Access-Control-Allow-Headers", "origin, x-requested-with, content-type, accept");

      CustomerResponseDTO ownerInfo = (CustomerResponseDTO) request.getAttribute("owner");
      List<String> customerNameList = (List<String>) request.getAttribute("customerNameList");
      List<BalanceInfoResponseDTO> balanceInfoList = (List<BalanceInfoResponseDTO>) request.getAttribute("balanceInfoList");
    %>

</head>

<body class="" onLoad="init_owner_list_team_page();">
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
                    <li class="active">
                        <a id="owner_list_team_href_id" style="font-weight: bold">
                            <i class="nc-icon nc-shop"></i>
                            <p>고객조회</p>
                        </a>
                    </li>
                    <li>
                        <a id="owner_list_info_href_id" style="font-weight: bold">
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
                        <a id="list_title_id" class="navbar-brand text-danger" style="font-weight: bold">환영합니다. "<%=ownerInfo.getCname()%>님!</a>
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
                                <a class="nav-link btn-rotate" href="../../login/home" style="font-weight: bold">
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
                                <h4 class="card-title">팀 목록</h4>
                                <hr class="one">
                                <div class="row">
                                	<div class="col-md-12 align-self-center pull-right">
                    					<form class="col-md-12 form-inline align-self-center">
                      						<input id="serching_team" onkeypress="if(event.keyCode==13){search_team_list();}" class="form-control mr-lg-2" type="text" placeholder="Search" aria-label="Search">
                      						<button id="search_button" class="btn btn-outline-success btn-round btn-sm my-0" type="button" onclick="search_team_list();">Search</button>
                    					</form>
                  					</div>
                                 
                                    <div class="col-md-4 align-self-end d-none">
                                       <button type='button' class='btn btn-outline-success'> 팀 추가 </button>
                                    </div>
                                </div>
                                
                            </div>
                            <div class="card-body">
                            	<div class="table-responsive" style="overflow-x: hidden; overflow-y: hidden">
                  					<table class="table">
                    					<thead class="text-danger">
                      						<th class="text-center">
                        						팀이름
                      						</th>
                      						<th class="text-center">
                        						잔여선불금액
                      						</th>
                      						<th class="text-center">
                        						총선불금액
                      						</th>
                      						<th class="text-center">
                        						잔액충전
                     						</th>
                     						<th class="text-center">
                     							잔액사용
                     						</th>
                    					</thead>		
                      					<tbody id="balanceInfoTable">
                      
           
                    					</tbody>

                  					</table>
                				</div>

                            </div>
                        </div>
                    </div>
                </div>

            </div>
            
             <!--------------잔액 충전 모달창--------------------->


                <div class="modal fade" id="Balance_Charge_Modal" tabindex="-1" role="dialog" aria-labelledby="ChargeModalLabel" aria-hidden="true">
                  <div class="modal-dialog">
                    <div class="modal-content">
                    
                   	  <div class="modal-header">
                        <h4 class="pull-right modal-title text-primary" style="font-weight: bold">잔액 충전</h4>
                      </div>
                      <div class="modal-body">
                        <div class="col-md-12">
                          <div class="form-group">
                            <label class="text-primary" style="font-weight: bold">충전 금액 입력</label>
                            <input id="modal_charge_balance_amount" type="text" class="form-control">
                          </div>
                          <br>
                        </div>
                        
                        <div class="col-md-12 d-none">
                            <div class="form-group">
                              <label class="text-primary" style="font-weight: bold">메뉴가격</label>
                              <input id="cid_for_charge" type="text" class="form-control">
                            </div>
                        </div>
                          
                        <div class="col-md-12">
                          <br>
                          <h6 style="font-weight: bold">해당 가격을 충전하시겠습니까?</h6>
                        </div>
                      </div>
                      <div class="modal-footer" style="height: 60px;">
                        <button style="font-weight: bold" type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                        <button id="charge_button" style="font-weight: bold" type="button" class="btn btn-primary" onclick="balance_charge();">확인</button>
                      </div>
                    </div>
                  </div>
                </div>

                <!------------------------------------>
                
                <div class="modal fade" id="Balance_Use_Modal" tabindex="-1" role="dialog" aria-labelledby="UseModalLabel" aria-hidden="true">
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h4 class="pull-right modal-title text-danger" style="font-weight: bold">잔액 사용</h4>
                      </div>
                      <div class="modal-body">
                        <div class="col-md-12">
                          <div class="form-group">
                            <label class="text-danger" style="font-weight: bold">사용 금액 입력</label>
                            <input id="modal_use_balance_amount" type="text" class="form-control">
                          </div>
                          <br>
                        </div>
                        <div class="col-md-12 d-none">
                            <div class="form-group">
                              <label class="text-primary" style="font-weight: bold">메뉴가격</label>
                              <input id="cid_for_use" type="text" class="form-control">
                            </div>
                        </div>
                        
                        <div class="col-md-12">
                          <br>
                          <h6 style="font-weight: bold">해당 가격을 사용하시겠습니까?</h6>
                        </div>
                      </div>
                      <div class="modal-footer" style="height: 60px;">
                        <button style="font-weight: bold" type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                        <button style="font-weight: bold" type="button" class="btn btn-primary" onclick="balance_use();">확인</button>
                      </div>
                    </div>
                  </div>
                </div>
                
<!-- ------------------------------------------------------------- -->

            
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
        var sid = "<%=sid%>";
        var storename = "<%=sname%>";
        
        function cid_setting_charge(teamid)
        {
        	$("#cid_for_charge").val(teamid);
        }
        
        
        function cid_setting_use(teamid)
        {
        	$("#cid_for_use").val(teamid);
        }
        
        function balance_charge()
        {
        	///balance/info/charge/{cid}/{sid}/{amount}
        	var teamid = $("#cid_for_charge").val();
        	var amount = parseInt($("#modal_charge_balance_amount").val());
        	$.ajax({
    			url:"http://localhost:8183/balance/info/charge/" + teamid + "/" + sid + "/" +  amount,
                type:"PUT",
                contentType: "application/json",
                success: function(result)
                {
                	
                	get_balance_info();
                	alert("충전이 완료되었습니다.");
                	
                }
    		});
        	
        	$.ajax({
    			url:"http://localhost:8182/store/info/earnings/" + sid + "/" + amount,
                type:"PUT",
                contentType: "application/json",
                success: function(result)
                {
                	
                }
    		});
        	
        	
        	var today = new Date();
        	var year = today.getFullYear();
        	var month = today.getMonth()+1;
        	var day = today.getDate();
        	var sec = today.getSeconds();
        	
        	var data = {        			
        		"id" : "orderid" + year + month + day + sec,
        		"ordertype" : "1",
        		"storeid" : sid,
        		"teamid" : teamid,
        		"money" : amount,
        		"orderdate" : ""
        	};
        	
        	$.ajax({
    			url:"http://localhost:8183/order/info",
                type:"POST",
                data: JSON.stringify(data),
                contentType: "application/json",
                success: function(result)
                {
                	
                }
    		});
        	
        	
        	location.reload();
        	
        	
        	
        }
        
        function balance_use()
        {
        	///balance/info/charge/{cid}/{sid}/{amount}
        	var teamid = $("#cid_for_use").val();
        	var amount = parseInt($("#modal_use_balance_amount").val());
        	$.ajax({
    			url:"http://localhost:8183/balance/info/use/" + teamid + "/" + sid + "/" + amount,
                type:"PUT",
                contentType: "application/json",
                success: function(result)
                {
                	get_balance_info();
                	alert("결제가 완료되었습니다.");
          
                }
    		});
        	
        	var today = new Date();
        	var year = today.getFullYear();
        	var month = today.getMonth()+1;
        	var day = today.getDate();
        	var sec = today.getSeconds();
        	
        	var data = {        			
        		"id" : "orderid" + year + month + day + sec,
        		"ordertype" : "2",
        		"storeid" : sid,
        		"teamid" : teamid,
        		"money" : amount,
        		"orderdate" : ""
        	};
        	
        	$.ajax({
    			url:"http://localhost:8183/order/info",
                type:"POST",
                data: JSON.stringify(data),
                contentType: "application/json",
                success: function(result)
                {
                	
                }
    		});
        	location.reload();
        	event.preventDefault();
        }
        
        function get_balance_info()
        {
        	$("#balanceInfoTable").empty();
        	$.ajax({
                url:"http://localhost:8183/balance/info/store/" + sid,
                type:"GET",
                contentType: "application/json",
                success: function(result) {
                    if (result)
                    {
                    	$.each(result, function(key,value)
                    	{
                    		var teamid = value.cid;
                    		var totalmoney = value.totalmoney;
                    		var remainmoney = value.remainmoney;
                    		var balanceid = value.bid;
                    		var teamname='';
                    		$.ajax({
                    			url:"http://localhost:8181/customer/info/" + teamid,
                                type:"GET",
                                contentType: "application/json",
                                success: function(result)
                                {
                                	if(result)
                                	{
                                		teamname = result.cname;
                                		//alert(teamname);
                                		//alert(storename);
                                		//alert(money);
                                		//alert(type);
                                		//alert(date);
                                		var temp = "<tr id=\"";
                                		temp = temp + balanceid + "\"" + ">";
                                		temp = temp + "<td class=\"text-center\" style=\"font-weight: bold\">"+ teamname +"</td>";
                                		temp = temp + "<td class=\"text-success text-center\" style=\"font-weight: bold\">"+ remainmoney +"</td>";
                                		temp = temp + "<td class=\"text-center\" style=\"font-weight: bold\">"+ totalmoney +"</td>";
                                		temp = temp + "<td class=\"text-center\"><button id=\""+ teamid + "\" type=\"button\" class=\"btn btn-primary btn-sm\" onclick=\"cid_setting_charge(" + "this.id" + ");\" data-toggle=\"modal\" data-target=\"#Balance_Charge_Modal\">충전하기</button></td>";
                                		temp = temp + "<td class=\"text-center\"><button id=\""+ teamid + "\" type=\"button\" class=\"btn btn-danger btn-sm\" onclick=\"cid_setting_use(" + "this.id" + ");\" data-toggle=\"modal\" data-target=\"#Balance_Use_Modal\">결제하기</button></td>";
                                		temp = temp + "</tr>"
                                		$("#balanceInfoTable").append(temp);
                                	}
                                }
                    		});
                    	});

                    } else {
                        alert("아이디 또는 비밀번호가 맞지 않습니다.")
                    }
                },
                error: function(error){
                    alert(error);
                }

            });
            event.preventDefault();
        }
        

        function init_owner_list_team_page()
        {
            get_owner_list_team_page();
            get_owner_list_information_page();
            get_balance_info();
	        event.preventDefault();
        }
        
        function search_team_list()
        {
        	var target = $("#serching_team").val();
        	if(target=="")
        		get_balance_info();
        	else
        	{
        		$("#balanceInfoTable").empty();
            	$.ajax({
                    url:"http://localhost:8183/balance/info/store/" + sid,
                    type:"GET",
                    contentType: "application/json",
                    success: function(result) {
                        if (result)
                        {
                        	$.each(result, function(key,value)
                        	{
                        		var teamid = value.cid;
                        		var totalmoney = value.totalmoney;
                        		var remainmoney = value.remainmoney;
                        		var balanceid = value.bid;
                        		var teamname='';
                        		$.ajax({
                        			url:"http://localhost:8181/customer/info/" + teamid,
                                    type:"GET",
                                    contentType: "application/json",
                                    success: function(result)
                                    {
                                    	if(result)
                                    	{
                                    		teamname = result.cname;
                                    		//alert(teamname);
                                    		//alert(storename);
                                    		//alert(money);
                                    		//alert(type);
                                    		//alert(date);
                                    		if(teamname.search(target)!=-1)
                                    		{
	                                    		var temp = "<tr id=\"";
	                                    		temp = temp + balanceid + "\"" + ">";
	                                    		temp = temp + "<td class=\"text-center\" style=\"font-weight: bold\">"+ teamname +"</td>";
	                                    		temp = temp + "<td class=\"text-success text-center\" style=\"font-weight: bold\">"+ remainmoney +"</td>";
	                                    		temp = temp + "<td class=\"text-center\" style=\"font-weight: bold\">"+ totalmoney +"</td>";
	                                    		temp = temp + "<td class=\"text-center\"><button id=\""+ teamid + "\" type=\"button\" class=\"btn btn-primary btn-sm\" onclick=\"cid_setting_charge(" + "this.id" + ");\" data-toggle=\"modal\" data-target=\"#Balance_Charge_Modal\">충전하기</button></td>";
	                                    		temp = temp + "<td class=\"text-center\"><button id=\""+ teamid + "\" type=\"button\" class=\"btn btn-danger btn-sm\" onclick=\"cid_setting_use(" + "this.id" + ");\" data-toggle=\"modal\" data-target=\"#Balance_Use_Modal\">결제하기</button></td>";
	                                    		temp = temp + "</tr>"
	                                    		$("#balanceInfoTable").append(temp);
                                    		}
                                    	}
                                    }
                        		});
                        	});

                        } else {
                            alert("아이디 또는 비밀번호가 맞지 않습니다.")
                        }
                    },
                    error: function(error){
                        alert(error);
                    }

                });
                event.preventDefault();
        	}
        		
        }
        

        function get_owner_list_team_page() {
            document.getElementById("owner_list_team_href_id").href = "../list-store/"+cid;
        }

        function get_owner_list_information_page() {
            document.getElementById("owner_list_info_href_id").href = "../list-info/" + cid;
        }
    </script>


    <!--  Notifications Plugin    -->
    <script src="/resources/assets/js/core/popper.min.js"></script>
    <script src="/resources/js/plugins/bootstrap-notify.js"></script>
    <!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
    <script src="/resources/assets/js/paper-dashboard.min.js?v=2.0.0" type="text/javascript"></script>
</body>

</html>