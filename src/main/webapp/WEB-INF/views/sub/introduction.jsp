<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Introduction</title>
<link rel="shortcut icon" type="image/x-icon" href="resources/img/tree.ico">
<link rel="stylesheet" href="resources/css/common.css">
<link rel="stylesheet" href="resources/css/sub/floating-totop-button.css" >

<style>
section {margin-top: 240px;}
.space{height:200px}

.menu{text-align: center;}
.menu ul{overflow: hidden; float: left; list-style:none; position:relative; margin-left: 50%; left:-225px;}
.menu ul li{list-style:none}
.menu ul li a {display: block;height:45px; text-indent:-9999px; overflow:hidden;}
.menu .menu1{width: 150px; background: url(resources/img/sub/introduction/r1.png); margin-top: 15px; float: left}
.menu .menu2{width: 150px; background: url(resources/img/sub/introduction/p1.png); margin-top: 15px; float: left}
.menu .menu3{width: 150px; background: url(resources/img/sub/introduction/h1.png); margin-top: 15px; float: left}  

.menu .menu1 a:hover{background: url(resources/img/sub/introduction/r2.png);}
.menu .menu2 a:hover{background: url(resources/img/sub/introduction/p2.png);}
.menu .menu3 a:hover{background: url(resources/img/sub/introduction/h2.png);}

#cj{
	position:relative;
	animation: 2s cjani;
	animation-iteration-count:infinite;
}

@keyframes cjani{
	0%{transform:rotate(0deg)}
	25%{transform:rotate(45deg) }
	50%{transform:rotate(0deg)}
	75%{transform:rotate(-45deg)}
	100%{transform:rotate(0deg)}
}
</style>

<script type="text/javascript" src="resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="resources/js/gnb.js"></script>
<script src="resources/js/floating-totop-button.js"></script>


</head>
<body>
<div id="wrap">
    <header id="headerArea">
        <div class="headerInner">
            <h1 class="logo">
                <a href="/hhh/"><img src="resources/img/logo_h.PNG" alt="HHH로고"></a>
            </h1>
            <c:if test="${not empty memberNickname }">
                <div class="headerRight">
                    <div class="topMenu">
                        <c:if test="${memberNickname ne '관리자' }">
                            <ul>
                                <li><span><strong>${memberNickname }</strong>님 접속중</span></li>
                                <li><a href="mypage">My Page</a></li>
                                <li><a href="logout">LogOut</a></li>
                            </ul>
                        </c:if>
                        <c:if test="${memberNickname eq '관리자' }">
                            <ul>
                                <li><span><strong>${memberNickname }</strong> 계정</span></li>
                                <li><a href="manager">Manager</a></li>
                                <li><a href="logout">LogOut</a></li>
                            </ul>
                        </c:if>
                    </div>

                    <div class="menu_box"></div>

                    <nav id="navArea">
                        <h2 class="hidden">글로벌네비게이션영역</h2>

                       <ul class="dropdownmenu">
							<li class="m1 gnbmenu">
								<h3>
									<a class="depth1" href="introduction"><img src="resources/img/hm_introduction.png"/></a>
								</h3>
								<ul>
									<li><a href="introduction#a">Representative's words</a></li>
									<li><a href="introduction#b">About us</a></li>
									<li><a href="introduction#c">History</a></li>
								</ul>
							</li>
							<li class="m2 gnbmenu">
								<h3>
									<a class="depth1" href="facility"><img src="resources/img/hm_facility.png"/></a>
								</h3>
								<ul>
									<li><a href="facility#a">Dormitory</a></li>
									<li><a href="facility#c">Restaurant &amp; Cafeteria</a></li>
									<li><a href="facility">Lounge</a></li>
									<li><a href="facility#b">Fitness Club</a></li>
									<li><a href="facility#d">Park &amp; Stadium</a></li>
								</ul>
							</li>
							<li class="m3 gnbmenu">
								<h3>
									<a class="depth1" href="activity"><img src="resources/img/hm_activity.png"/></a>
								</h3>
								<ul>
									<li><a href="activity#a">Sports</a></li>
									<li><a href="activity#e">Entertainment</a></li>
								</ul>
							</li>
							<li class="m4 gnbmenu">
								<h3>
									<a class="depth1" href="alliance"><img src="resources/img/hm_alliance.png"/></a>
								</h3>
								<ul>
									<li><a href="alliance#a">Health</a></li>
									<li><a href="alliance#b">Language</a></li>
									<li><a href="alliance#c">Recreation</a></li>
								</ul>
							</li>
							<li class="m5 gnbmenu">
								<h3>
									<a class="depth1" href="#"><img src="resources/img/hm_center.png"/></a>
								</h3>
								<ul>
									<li><a href="address">Address</a></li>
									<li><a href="notice">Notice</a></li>
									<li><a href="board">Board</a></li>
									<li><a href="FAQ">FAQ</a></li>
									<li><a href="pp">Privacy Policy</a></li>
								</ul>
							</li>
						</ul>
                    </nav>
                </div>
            </c:if>
        </div>
    </header>

    <section>
		<div class="menu">
			<ul>
				<li class="menu1"><a class="scroll" href="#a">Dormitory</a></li>
				<li class="menu2"><a class="scroll" href="#b">Health</a></li>
				<li class="menu3"><a class="scroll" href="#c">Cafe</a></li>
			</ul>
		</div>
		<script>
			$(document).ready(function($) {
				$(".scroll").click(function(event) {
					event.preventDefault();
					$('html,body').animate({
						scrollTop : $(this.hash).offset().top
					}, 1200);
				});
			});
		</script> <!--=======================탑 버 튼==========================--> <a href="#"
			class="to-top-button op-20 sh-10 bp-br bm-2 sz-4 bw-0w bs-2 hide filter"
			style="display: none;"> <img src="resources/img/arrow.svg"
			class="arrow-img is-4 arrow-img"></a> <script>
				$("body").toTopButton({});
			</script> <script type="text/javascript">
				var _gaq = _gaq || [];
				_gaq.push([ '_setAccount', 'UA-36251023-1' ]);
				_gaq.push([ '_setDomainName', 'jqueryscript.net' ]);
				_gaq.push([ '_trackPageview' ]);

				(function() {
					var ga = document.createElement('script');
					ga.type = 'text/javascript';
					ga.async = true;
					var s = document.getElementsByTagName('script')[0];
					s.parentNode.insertBefore(ga, s);
				})();
			</script> <!--=======================탑 버 튼==========================-->

		<div class="space" id="a"></div>
		
		<center>
			<img alt="" src="resources/img/sub/introduction/rw.png" ><br>
			<img id="cj" alt="" src="resources/img/sub/introduction/cjcjcj3.png" width="160px" height="240px">
			<img alt="" src="resources/img/sub/introduction/intro2.PNG">
		</center>
    	
    	<div class="space" id="b"></div>
    	
    	<center>
			<img alt="" src="resources/img/sub/introduction/p.png" ><br>
			<img alt="" src="resources/img/sub/introduction/intro3.PNG">
		</center>
    	
    	<div class="space" id="c"></div>
    	
    	<center>
			<img alt="" src="resources/img/sub/introduction/h.png" ><br>
			<img alt="" src="resources/img/sub/introduction/intro4.jpg">
		</center>
    	
    	<div class="space" id="d"></div>
    
	</section>
    
    <footer id="footerArea">
        <div class="footerTop">
            <center>
                <strong>회사소개</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <strong>이용약관</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <strong>개인정보처리방침</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <strong>고객센터</strong>
            </center>
        </div>
        <div class="footerInner">
            <div class="footerLogo">
                <img src="resources/img/logo_f.png" alt="하단로고">
            </div>
            <ul class="footerBottom">
                <li><span>서울시 강동구 천호대로 1095 현대코아 3층</span></li>
                <li><span>Tel:02-***-**** / Fax:02-428-9694</span></li>
                <li><span>관리자 E-mail : airenmj@gmail.com</span></li>
            </ul>
        </div>
        <div id="footerCS">
            <div class="copyright">
                <p>COPYRIGHT(C) 2019 HHH. ALL RIGHTS RESERVED.</p>
                <ul class="sns">
                    <li><img src="resources/img/footer/SNS_youtube.png" alt="">
                    </li>
                    <li><img src="resources/img/footer/SNS_instar.png" alt="">
                    </li>
                    <li><img src="resources/img/footer/SNS_facebook.png" alt="">
                    </li>
                    <li><img src="resources/img/footer/SNS_twiter.png" alt="">
                    </li>
                    <li><img src="resources/img/footer/SNS_kakaostory.png" alt="">
                    </li>
                </ul>
            </div>
        </div>
    </footer>
</div>
</body>
</html>