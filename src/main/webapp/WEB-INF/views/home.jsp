<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome HHH</title>
<link rel="shortcut icon" type="image/x-icon"
	href="resources/img/tree.ico">
<link rel="stylesheet" href="resources/css/common.css">
<style>
.main {
	margin-top: 169px;
	width: 2000px;
	position: relative;
	left: 50%;
	top: 0;
	margin-left: -840px;
}

#welcome {
	position: absolute;
	top: 331px;
	left: 900px;
}

input {
	border: none;
	height: 40px;
	color: #5ebb46;
	font-weight: 600;
	font-size: 13pt;
	position: absolute;
	top: 507px;
	left: 930px;
	background-color: rgb(255, 255, 255, 0.1);
}
</style>
<script type="text/javascript" src="resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="resources/js/gnb.js"></script>
<script>
	var str = "이용을 위해선 로그인이 필요합니다";
	var i = 0;
	function play() {
		if (i < str.length) {
			document.form1.text1.value = str.substring(0, i);
			i++;
			setTimeout("play()", 120);
		} else if (i = str.length) {
			document.form1.text1.value = str.substring(0, i);
			i = 0;
			setTimeout("play()", 1000);
		}
	}
</script>
<script type="text/javascript">
	$(document).ready(function() {
		var mc = ${mailChecked};
		if (mc == 0) {
			alert("메일 인증 후 이용이 가능합니다. 확인을 누르시면 인증 메일이 발송됩니다.");
			location.href = "mailConfirm";
		}
	});
</script>
</head>
<body onload="play()">
	<div id="wrap">
		<header id="headerArea">
			<div class="headerInner">
				<h1 class="logo">
					<a href="/hhh/"><img src="resources/img/logo_h.PNG" alt="HHH로고"></a>
				</h1>
				<c:if test="${empty memberNickname }">
					<div class="headerRight">
						<div class="topMenu">
							<ul>
								<li><a href="login-view">LogIn</a></li>
								<li><a href="join-view">Join</a></li>
							</ul>
						</div>

						<div class="menu_box"></div>

						<nav id="navArea">
							<h2 class="hidden">글로벌네비게이션영역</h2>

							<ul class="dropdownmenu">
								<li class="m1 gnbmenu">
									<h3>
										<a class="depth1" href="login-view"><img src="resources/img/hm_introduction.png"/></a>
									</h3>
									<ul>
										<li><a href="login-view">Representative's words</a></li>
										<li><a href="login-view">About us</a></li>
										<li><a href="login-view">History</a></li>
									</ul>
								</li>
								<li class="m2 gnbmenu">
									<h3>
										<a class="depth1" href="login-view"><img src="resources/img/hm_facility.png"/></a>
									</h3>
									<ul>
										<li><a href="login-view">Dormitory</a></li>
										<li><a href="login-view">Restaurant &amp; Cafeteria</a></li>
										<li><a href="login-view">Lounge</a></li>
										<li><a href="login-view">Fitness Club</a></li>
										<li><a href="login-view">Park &amp; Stadium</a></li>
									</ul>
								</li>
								<li class="m3 gnbmenu">
									<h3>
										<a class="depth1" href="login-view"><img src="resources/img/hm_activity.png"/></a>
									</h3>
									<ul>
										<li><a href="login-view">Sports</a></li>
										<li><a href="login-view">Entertainment</a></li>
									</ul>
								</li>
								<li class="m4 gnbmenu">
									<h3>
										<a class="depth1" href="login-view"><img src="resources/img/hm_alliance.png"/></a>
									</h3>
									<ul>
										<li><a href="login-view">Health</a></li>
										<li><a href="login-view">Language</a></li>
										<li><a href="login-view">Recreation</a></li>
									</ul>
								</li>
								<li class="m5 gnbmenu">
									<h3>
										<a class="depth1" href="login-view"><img src="resources/img/hm_center.png"/></a>
									</h3>
									<ul>
										<li><a href="login-view">Address</a></li>
										<li><a href="login-view">Notice</a></li>
										<li><a href="login-view">Board</a></li>
										<li><a href="login-view">FAQ</a></li>
										<li><a href="login-view">Privacy Policy</a></li>
									</ul>
								</li>
							</ul>
						</nav>
					</div>
				</c:if>
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
										<li><a href="introduction#">Representative's words</a></li>
										<li><a href="introduction#">About us</a></li>
										<li><a href="introduction#">History</a></li>
									</ul>
								</li>
								<li class="m2 gnbmenu">
									<h3>
										<a class="depth1" href="facility"><img src="resources/img/hm_facility.png"/></a>
									</h3>
									<ul>
										<li><a href="facility#">Dormitory</a></li>
										<li><a href="facility#">Restaurant &amp; Cafeteria</a></li>
										<li><a href="facility#">Lounge</a></li>
										<li><a href="facility#">Fitness Club</a></li>
										<li><a href="facility#">Park &amp; Stadium</a></li>
									</ul>
								</li>
								<li class="m3 gnbmenu">
									<h3>
										<a class="depth1" href="activity"><img src="resources/img/hm_activity.png"/></a>
									</h3>
									<ul>
										<li><a href="activity#">Sports</a></li>
										<li><a href="activity#">Entertainment</a></li>
									</ul>
								</li>
								<li class="m4 gnbmenu">
									<h3>
										<a class="depth1" href="alliance"><img src="resources/img/hm_alliance.png"/></a>
									</h3>
									<ul>
										<li><a href="alliance#">Health</a></li>
										<li><a href="alliance#">Language</a></li>
										<li><a href="alliance#">Recreation</a></li>
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


		<section class="main">
			<img src="resources/img/main.jpg" alt="" onclick="location.href='login-view'">
			<div id="welcome">
				<img src="resources/img/welcome.png" alt="welcome">
			</div>
			<div>
				<form name="form1">
					<input type="text" name="text1" size="40">
				</form>
			</div>
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
