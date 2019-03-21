<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>nContent</title>
<link rel="shortcut icon" type="image/x-icon"
	href="resources/img/tree.ico">
<link rel="stylesheet" href="resources/css/common.css">
<style>
section {
	margin-top: 169px;
}

section #top-img {
	width: 2000px;
	position: relative;
	left: 50%;
	top: 0;
	margin-left: -840px;
}
#sect{
	width: 800px;
	position: relative;
	left: 50%;
	top: 0;
	margin-left: -350px;
	font-size:1.1em;
}
.btn_c{
	background : #fff;
	color : #21a4ef;
	border : 1px solid #21a4ef;
	padding : 3px 5px;
}
/* 목록 버튼 */
#btn_c{
	background : #fff;
	color : #21a4ef;
	border : 1px solid #21a4ef;
	padding : 7px 10px;
	position: relative;
	left: 50%;
	top: 0;
	margin-left: -30px;
}
#ctitle{
	margin:30px 0 10px 5px;
	font-size:1.1em;	
}
#cinfo{
	margin:0 0 10px 5px;
	font-size:1.1em;
}
#ccontent{
	margin:0 0 20px 5px;
	padding:0 30px 0 0;
	font-size:1em;
}
#cfile{
	padding-left:20px;
}
#cfile a{
	color:#1970fc;
}
</style>
<script type="text/javascript" src="resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="resources/js/gnb.js"></script>
<script type="text/javascript">
	function del(){
		var del=confirm("삭제하시겠습니까?");
		if(del==true){	
			var f=document.cform;
			f.action = "ndelete";
			f.submit();
		}
	}
</script>
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
			<img id="top-img" src="resources/img/board/visual.jpg" alt="">
			<div id="sect">
			<form name="cform" action="nmodify-view" method="post">
				<input type="hidden" name="nNo" value="${contentView.nno }">
				<div id="ctitle">
					<span><strong>${contentView.ntitle }</strong></span>
				</div>
				<div id="cinfo">
					<span class="left">글쓴이</span> <span>${contentView.nwriter }</span>
					<span>${contentView.nregdate }</span> <span class="left">조회</span>
					<span>${contentView.ncount }회</span>
					<c:if test="${memberNickname eq contentView.nwriter }">
						<input class="btn_c" type="submit" value="수정">
						<input class="btn_c" type="button" onclick="del();" value="삭제" />
					</c:if>
				</div>
				<p id="ccontent">
					<span>${contentView.ncontent }</span>
				</p>
				<p id="cfile">
					<a href="download?f=${contentView.nfile }&nNo=${contentView.nno }">${contentView.nfile }</a>
				</p>
			</form>
			<div style="padding-bottom:20px;">
				<a id="btn_c" href="notice">목록</a>
			</div>
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