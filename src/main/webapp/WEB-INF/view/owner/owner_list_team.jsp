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
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <%
        //String tmbrCustDomain= (String)request.getAttribute("tmbrCustDomain");
        response.addHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Access-Control-Allow-Headers", "origin, x-requested-with, content-type, accept");
        //List customerList = (List) request.getAttribute("custList");

    %>

</head>


<body onload="document.init.email.focus(); initial();">
<div class="lowin lowin-red">
    <div class="lowin-brand">
        <img src="/resources//assets/img/SVC로고4.png" alt="logo">
    </div>
    <div class="lowin-wrapper">
        <div class="lowin-box lowin-login">
            <div class="lowin-box-inner">
                <form name="init">
                    <p>SVC With SK</p>
                    <div class="lowin-group">
                        <label>아이디 <a href="#" class="login-back-link">로그인?</a></label>
                        <input type="text" name="email" class="lowin-input" id="customer_id" autocomplete="off">
                    </div>
                    <div class="lowin-group password-group">
                        <label>비밀번호 <a href="#" class="forgot-link">비밀번호를 잊으셨나요?</a></label>
                        <input type="password" name="password" class="lowin-input" id="customer_password"
                               autocomplete="off">
                    </div>
                    <button class="lowin-btn login-btn" id="btn_login" onclick="auth_login();">
                        로그인
                    </button>

                    <div class="text-foot">
                        계정이 없나요? <a href="" class="register-link">회원가입</a>
                    </div>

                </form>
            </div>
        </div>

        <div class="lowin-box lowin-register">
            <div class="lowin-box-inner">
                <form>
                    <p>회원가입</p>
                    <div class="lowin-group">
                        <label>아이디</label>
                        <input type="text" name="name" autocomplete="name" class="lowin-input">
                    </div>
                    <div class="lowin-group">
                        <label>이메일</label>
                        <input type="email" autocomplete="email" name="email" class="lowin-input">
                    </div>
                    <div class="lowin-group">
                        <label>비밀번호</label>
                        <input type="password" name="password" autocomplete="current-password" class="lowin-input">
                    </div>
                    <button class="lowin-btn">
                        가입하기
                    </button>

                    <div class="text-foot">
                        이미 계정이 있나요? <a href="" class="login-link">로그인</a>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <footer class="lowin-footer">
        Design By <a href="http://fb.me/itskodinger">@PyramidTop</a>
    </footer>
</div>

<script src="/resources/assets/js/login.js"></script>

<script>
	Auth.init({
		login_url: '#login',
		forgot_url: '#forgot'
	});
    console.log("tt");
    const customerList = "<%=customerList%>";
    console.log(customerList);
</script>

</body>

</html>