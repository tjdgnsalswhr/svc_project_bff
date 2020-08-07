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
    <link href="/resources/assets/css/paper-dashboard.css?v=2.0.0" rel="stylesheet" />
    <link href="/resources/assets/css/menu.css" rel="stylesheet" />
    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css"
        integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
    <script src="/resources/assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
    <script src="/resources/assets/js/core/jquery.min.js"></script>
    <script src="/resources/assets/js/core/popper.min.js"></script>
    <script src="/resources/assets/js/core/bootstrap.min.js"></script>
    <script src="/resources/assets/js/team_list_store.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <%
        //String tmbrCustDomain= (String)request.getAttribute("tmbrCustDomain");
        response.addHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Access-Control-Allow-Headers", "origin, x-requested-with, content-type, accept");
        String cid = (String)request.getAttribute("cid");
    %>

</head>


<body class="" onLoad="init_team_list_store_page();">
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
              <a id="team_list_store_href_id" style="font-weight: bold">
                <i class="nc-icon nc-shop"></i>
                <p>가게조회</p>
              </a>
            </li>
            <li>
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
              <a id="menu_title_id" class="navbar-brand" style="font-weight: bold"></a>
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
                  <a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink"
                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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
                    <i class="fa fa-sign-out-alt align-baseline"></i>
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
          <div class="row" id="manage_menu">
            <div class="col-md-12">
              <div class="card">
                <div class="card-header">
  
                  <h4 class="card-title">
                    가게 목록 조회
                  </h4>
                  <div class="row">
                    <div class="col-md-2 align-self-center invisible pr-5">
                      <form class="form-inline align-self-center">
                        <input class="form-control mr-lg-2" type="text" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success btn-round btn-sm my-0" type="button">Search</button>
                      </form>
                    </div>
  
                    <div class="col-md-4 align-self-center invisible pull-right">
                      <form class="form-inline align-self-center">
                        <input class="form-control mr-lg-2" type="text" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success btn-round btn-sm my-0" type="button">Search</button>
                      </form>
                    </div>
  
  
                    <div class="col-md-4 align-self-center invisible pr-0 pl-5 pull-right">
                      <form class="form-inline mr-auto invisible">
                        <input class="form-control mr-sm-2 invisible" type="text" placeholder="Search"
                          aria-label="Search">
                        <button class="btn btn-outline-success btn-round btn-sm my-0 invisible"
                          type="button">Search</button>
                      </form>
                    </div>
  
                    <div class="col-md-2 align-self-center text-right pl-0">
                      <div class="button">
                        <button type='button' class="btn btn-round btn-outline-success btn-sm" data-toggle="modal"
                          data-target="#Menu_create_Modal"> 메뉴추가 </button>
                      </div>
                    </div>
  
                  </div>
                </div>
                <div class="card-body">
  
  
                  <ul class="nav nav-tabs mr-auto nav-justified" id="myTab" role="tablist">
                    <li class="nav-item active">
                      <a class="nav-link active text-danger" style="font-weight: bold; font-size: medium" id="entire-tab"
                        data-toggle="tab" href="#entire" role="tab" aria-controls="entire" aria-selected="true">전체</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link text-danger" style="font-weight: bold; font-size: medium" id="koreanmenu-tab"
                        data-toggle="tab" href="#korean" role="tab" aria-controls="mainmenu" aria-selected="false">한식</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link text-danger" style="font-weight: bold; font-size: medium" id="chinesemenu-tab"
                        data-toggle="tab" href="#chinese" role="tab" aria-controls="sidemenu" aria-selected="false">중식</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link text-danger" style="font-weight: bold; font-size: medium" id="japanesemenu-tab"
                        data-toggle="tab" href="#japanese" role="tab" aria-controls="drinkmenu"
                        aria-selected="false">일식</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link text-danger" style="font-weight: bold; font-size: medium" id="etcmenu-tab"
                        data-toggle="tab" href="#etc" role="tab" aria-controls="etcmenu" aria-selected="false">기타</a>
                    </li>
                  </ul>
  
                  <br>


                  <!-------------------------------------가게 상세보기 모달------------------------------------>
                  <div class="modal fade" id="StoreModal" tabindex="-1" role="dialog" aria-labelledby="StoreModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                      <div class="modal-content">
                        <div class="modal-header">
                          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">
                            </span>
                          </button>
                            <h4 class="pull-left modal-title text-info" style="font-weight: bold" id="StoreModalLabel">
                              가게 상세보기
                            </h4>
                        </div>
                        <div class="modal-body">
                            <p id="myModal_text">

                            </p>
                        </div>
                          <div class="modal-footer">
                          <button type="button" class="btn btn-secondary" data-dismiss="modal">
                            닫기
                          </button>
                          </div>
                      </div>
                    </div>
                  </div>


  
                  <!---------------------------------------------------------- 모달 팝업창 -------------------------------------------------------->
  
  
                  <div class="modal fade" id="Menu_Modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                    aria-hidden="true">
                    <div class="modal-dialog">
                      <div class="modal-content">
                        <div class="modal-header">
                          <h4 class="modal-title text-success" style="font-weight: bold" id="exampleModalLabel">메뉴 수정</h4>
                        </div>
                        <div class="modal-body">
                          <div class="col-md-12">
                            <label class="text-primary" style="font-weight: bold">메뉴사진<br></label>
                            <hr>
                            <div class="image text-center" style="height: auto; width: auto">
                              <img src="../assets/img/피자마루.jpg" class="img-thumbnail" id="modal_menu_picture">
                            </div>
                            <hr>
                          </div>
  
                          <div class="col-md-12 d-none">
                            <div class="form-group">
                              <label class="text-primary" style="font-weight: bold">가게시리얼</label>
                              <input id="modal_store_serial" type="text" class="form-control">
                            </div>
                          </div>
  
                          <div class="col-md-12">
                            <div class="form-group">
                              <label class="text-primary" style="font-weight: bold">메뉴이름</label>
                              <input id="modal_menu_name" type="text" class="form-control">
                            </div>
                          </div>
                          <div class="col-md-12">
                            <div class="form-group">
                              <label class="text-primary" style="font-weight: bold">메뉴가격</label>
                              <input id="modal_menu_price" type="text" class="form-control">
                            </div>
                          </div>
                          <div class="col-md-12">
                            <div class="form-group">
                              <label class="text-primary" style="font-weight: bold">메뉴코드</label>
                              <input id="modal_menu_code" type="text" class="form-control" disabled="">
                            </div>
                            <br>
                          </div>
  
                          <div class="col-md-12">
                            <div class="form-group">
                              <label>사진변경</label>
                              <input type="file" class="custom-file-input" id="FILE_TAG_modal" name="FILE_TAG_modal">
                              <label class="custom-file-label text-info" style="font-weight: bold" for="FILE_TAG_modal">사진
                                바꾸기 / jpg 확장자만 가능</label>
                            </div>
                          </div>
                        </div>
                        <div class="modal-footer">
                          <button style="font-weight: bold" type="button" class="btn btn-default"
                            data-dismiss="modal">취소하기</button>
                          <button style="font-weight: bold" type="button" class="btn btn-primary"
                            onclick="menu_modify_submit();">저장하기</button>
                        </div>
                      </div>
                    </div>
                  </div>
  
                  <!----------------메뉴 삭제 모달창--------------------->
  
  
                  <div class="modal fade" id="Menu_delete_Modal" tabindex="-1" role="dialog"
                    aria-labelledby="DeleteModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                      <div class="modal-content">
                        <div class="modal-body">
                          <div class="col-md-12 d-none">
                            <div class="form-group">
                              <label class="text-primary" style="font-weight: bold">메뉴코드</label>
                              <input id="modal_delete_menu_code" type="text" class="form-control" disabled="">
                            </div>
                            <br>
                          </div>
                          <div class="col-md-12">
                            <br>
                            <h5 style="font-weight: bold">정말 해당 주문을 삭제하시겠습니까?</h5>
                          </div>
                        </div>
                        <div class="modal-footer" style="height: 60px;">
                          <button style="font-weight: bold" type="button" class="btn btn-default"
                            data-dismiss="modal">취소</button>
                          <button style="font-weight: bold" type="button" class="btn btn-primary"
                            onclick="menu_delete_submit();">확인</button>
                        </div>
                      </div>
                    </div>
                  </div>
  
  
  
  
                  <!------------------------------------>
  
                  <div class="modal fade" id="Menu_create_Modal" tabindex="-1" role="dialog"
                    aria-labelledby="CreateModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                      <div class="modal-content">
                        <div class="modal-header">
                          <h4 class="modal-title text-success" style="font-weight: bold" id="CreateModalLabel">메뉴 추가</h4>
                        </div>
                        <div class="modal-body">
                          <div class="col-md-12">
                            <label class="text-primary" style="font-weight: bold">메뉴사진<br></label>
                            <hr>
                            <div class="image text-center" style="height: auto; width: auto">
                              <img src="../assets/img/noimg.gif" class="img-thumbnail" id="modal_create_menu_picture">
                            </div>
                            <hr>
                          </div>
  
                          <div class="col-md-12 d-none">
                            <div class="form-group">
                              <label class="text-primary" style="font-weight: bold">가게시리얼</label>
                              <input id="modal_create_store_serial" type="text" class="form-control">
                            </div>
                          </div>
  
                          <div class="col-md-12">
                            <div class="form-group">
                              <label class="text-primary" style="font-weight: bold">메뉴이름</label>
                              <input id="modal_create_menu_name" type="text" class="form-control">
                            </div>
                          </div>
                          <div class="col-md-12">
                            <div class="form-group">
                              <label class="text-primary" style="font-weight: bold">메뉴가격</label>
                              <input id="modal_create_menu_price" type="text" class="form-control">
                            </div>
                          </div>
                          <div class="col-md-12">
                            <div class="form-group">
                              <label class="text-primary" style="font-weight: bold">메뉴종류</label>
                              <select id="modal_create_menu_kind" type="text" class="form-control bootstrap-select">
                                <option>메인메뉴</option>
                                <option>사이드메뉴</option>
                                <option>주류</option>
                              </select>
                            </div>
                            <br>
                          </div>
  
                          <div class="col-md-12">
                            <div class="form-group">
                              <label>사진변경</label>
                              <input type="file" class="custom-file-input" id="FILE_TAG_modal_createmenu"
                                name="FILE_TAG_modal_createmenu">
                              <label class="custom-file-label text-info" style="font-weight: bold"
                                for="FILE_TAG_modal_createmenu">사진 바꾸기 / jpg 확장자만 가능</label>
                            </div>
                          </div>
                        </div>
                        <div class="modal-footer">
                          <button style="font-weight: bold" type="button" class="btn btn-default"
                            data-dismiss="modal">취소하기</button>
                          <button style="font-weight: bold" type="button" class="btn btn-primary"
                            onclick="menu_create();">저장하기</button>
                        </div>
                      </div>
                    </div>
                  </div>
  
                  <!--------------------------------------------------------------------------------------->
  
                  <div class="tab-content" id="myTabContent">
  
                    <!-------------------------------전체 메뉴 보기------------------------------------------------->
                    <div class="tab-pane fade show active" id="entire" role="tabpanel" aria-labelledby="entire-tab">
                      <div class="row" id="store_list_entrire_detail">

                        <!-------------------------------스토어카드, 재활용 가능 코드------------------------>
                        <div id='store_code' class="col-md-3">
                          <div class='box9'>
                            <div class='card card-user'>
                              
                              <div class='card-header'>
                                <div class="image">
                                  <img class='embed-responsive' src="/resources/assets/img/SVC로고4.png" alt='...'>
                                </div>
                              </div>

                              <div class="card-body">

                                <div class="row">
                                  <div class="col-md-12 text-left">
                                    <div class="form-group">
                                      <label class='text-danger' style="font-weight: bold;">
                                        &nbsp;&nbsp;가게이름
                                      </label>
                                      <input id="store_code_name" type="text" class="form-control">
                                    </div>
                                  </div>
                                </div>
                                
                                <div class="row">
                                  <div class="col-md-12 text-left">
                                    <div class="form-group">
                                      <label class="text-danger" style="font-weight: bold;">
                                        &nbsp;&nbsp;가게주소
                                      </label>
                                      <input id="store_code_address" type="text" class="form-control">
                                    </div>
                                  </div>
                                </div>

                                <div class="row">
                                  <div class="col-md-12 text-left">
                                    <div class="form-group">
                                      <label class="text-danger" style="font-weight: bold;">
                                        &nbsp;&nbsp;가게코드
                                      </label>
                                      <input id="store_code_code" type="text" class="form-control" disabled=''>
                                    </div>
                                  </div>
                                </div>

                              </div>

                            </div>
                            
                            <div class="box-content">
                              <div class="inner-content">
                                <h3 class="title" style="font-weight: bold;">
                                  상세보기
                                </h3>
                                
                                
                                <ui class='icon' style="display: table; margin-left: auto; margin-right: auto;">
                                  <li style="cursor:pointer">
                                    <i class="fa fa-list-alt" onclick="" data-toggle="modal" data-target='#StoreModal'>
                                    </i>
                                  </li>
                                  &nbsp;&nbsp;
                                  <li style="cursor: pointer;">
                                    <i class="fa fa-trash-alt" onclick="detail_modal();" data-toggle="modal" date-target="#Menu_delete_Modal">
                                    </i>
                                  </li>
                                </ui>


                              </div>
                            </div>
                          </div>
                        </div>
                        <!------------------------------스토어 카드------------------>
  
                      </div>
                    </div>
  
                    <!------------------------------메인 메뉴 보기------------------------------------------------->
  
                    <div class="tab-pane fade" id="koreanmenu" role="tabpanel" aria-labelledby="koreanmenu-tab">
                      <div class="row" id="store_list_korean_detail">
                      </div>
                    </div>
  
                    <!-------------------------------사이드 메뉴 보기------------------------------------------------->
  
                    <div class="tab-pane fade" id="chinesemenu" role="tabpanel" aria-labelledby="chinesemenu-tab">
                      <div class="row" id="store_list_chinese_detail">
                      </div>
                    </div>
  
                    <!-------------------------------중식 메뉴 보기 -------------------------------------------------->
  
                    <div class="tab-pane fade" id="japanesemenu" role="tabpanel" aria-labelledby="japanesemenu-tab">
                      <div class="row" id="store_list_japanese_detail">
                      </div>
                    </div>
  
  
                    <div class="tab-pane fade" id="etcmenu" role="tabpanel" aria-labelledby="etcmenu-tab">
                      <div class="row" id="store_list_etc_detail">
                      </div>
                    </div>
                  </div>
  
                </div>
  
              </div>
            </div>
  
  
  
            <footer class="footer footer-black  footer-white ">
              <div class="container-fluid">
                <div class="row">
                  <nav class="footer-nav">
                    <ul>
                      <li>
                        <a href="https://github.com/jmingrove21/PyramidTop/" target="_blank">PyramidTop's Github</a>
                      </li>
                    </ul>
                  </nav>
                  <div class="credits ml-auto">
                    <span class="copyright">
                      ©
                      <script>
                        document.write(new Date().getFullYear())
                      </script>, made with <i class="fa fa-star"></i> by pyramidTop
                    </span>
                  </div>
                </div>
              </div>
            </footer>
          </div>
        </div>
        <!--   Core JS Files   -->
        <script>
            var cid = "<%=cid%>";
            alert(cid);


            function init_team_list_store_page() {
            //var tmptmp = location.href.split("html")[1];
            /*
            if(tmptmp.length==0)
            {
              alert("로그인이 필요합니다.")
              location.href = "login.html";
            }
            
            var tmp = location.href.split("?")[1].split("=")[1];
            store_name = decodeURIComponent(tmp.split("&")[0]);
            store_serial = tmp.split("&")[1]; //시리얼 넘버
            document.getElementById("menu_title_id").innerHTML=store_name;
            */
            get_team_list_store_page();
            get_team_list_information_page();
            //menu_list();
            event.preventDefault();
            }
            function get_team_list_store_page() {
              document.getElementById("team_list_store_href_id").href = "../list-store/"+cid;
            }

            function get_team_list_information_page() {
              document.getElementById("team_list_info_href_id").href = "../list-info/" + cid;
            }

            function detail_modal()
            {
              $("#StoreModal").modal('show');
            }

            //console.log("tt");

        </script>


        <script src="/resources/assets/js/plugins/bootstrap-notify.js"></script>
        <!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
        <script src="/resources/assets/js/paper-dashboard.min.js?v=2.0.0" type="text/javascript"></script>
  </body>
  

</html>