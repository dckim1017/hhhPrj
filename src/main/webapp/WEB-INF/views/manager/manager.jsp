<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Manager</title>
<link rel="shortcut icon" type="image/x-icon"
	href="resources/img/tree.ico">
<link rel="stylesheet" href="resources/css/manager/manager.css">
<style>
section {
	margin-top: 200px;
	margin-bottom:20px;
}
h3{
	clear:both;
	font-family: "FontAwesome";
	font-size:1.2em;
	font-weight:600;
	color:#000;
}
.btn1{
	background: #fff;
	color: #7CADB6;
	border: 1px solid #7CADB6;
	padding: 4px 10px;
	margin-top:2px;
	margin-bottom:5px;
}
.btn2{
	background: #fff;
	color: #888;
	border: 1px solid #888;
	padding: 4px 10px;
}
.right{
	padding-left:10px;
}
</style>
<script type="text/javascript" src="resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="resources/js/gnb.js"></script>
<script>
$(function() {
	$('#memberList').on('click', function() {
		$.ajax({
			url : 'memberList',  
			type : 'get', 
			success : function(t) {
				$("#memberListField").html(t);
			},
			error : function() {
				alert('실패 ㅠㅠ');
			}
		});
	});
	$('#boardList').on('click', function() {
		$.ajax({
			url : 'boardList',  
			type : 'get', 
			success : function(t) {
				$("#boardListField").html(t);
			},
			error : function() {
				alert('실패 ㅠㅠ');
			}
		});
	});
	$('#regAlliance').on('click', function() {
		$.ajax({
			url : 'regAlliance',  
			type : 'get', 
			data : {
				id : $('#al-id').val(),
				name : $('#al-name').val(),
				email : $('#al-email').val(),
				service : $('#al-service').val(),
				note : $('#al-note').val()
			},
			success : function(t) {
				alert('입력 완료');
				$('#al-id').val("");
				$('#al-name').val("");
				$('#al-email').val("");
				$('#al-service').val("");
				$('#al-note').val("");
			},
			error : function() {
				alert('실패 ㅠㅠ');
			}
		});
	});
	$('#allianceList').on('click', function() {
		$.ajax({
			url : 'allianceList',  
			type : 'get', 
			success : function(t) {
				$("#allianceListField").html(t);
			},
			error : function() {
				alert('실패 ㅠㅠ');
			}
		});
	});
	$('#reportList').on('click', function() {
		$.ajax({
			url : 'reportList',  
			type : 'get', 
			success : function(t) {
				$("#reportListField").html(t);
			},
			error : function() {
				alert('실패 ㅠㅠ');
			}
		});
	});
});
</script>
</head>
<body style="background:#e8f7f4">
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
		<div style="background: #fff; width: 800px; margin-left: auto; margin-right: auto; padding-left:10px;">
			<div id="memberList-block">
				<h3>회원 정보</h3>
				<button id="memberList" class="btn1">조회</button>
				<div id="memberListField"></div>
			</div>
			<div id="allianceList-block">
				<h3>제휴 서비스</h3>
				<div>
					<table>
						<tr>
							<td>아이디</td>
							<td class="right"><input type="text" id="al-id" size="25"></td>
						</tr>
						<tr>
							<td>닉네임</td>
							<td class="right"><input type="text" id="al-name" size="25"></td>
						</tr>
						<tr>
							<td>메일</td>
							<td class="right"><input type="text" id="al-email" size="25"></td>
						</tr>
						<tr>
							<td>서비스</td>
							<td class="right"><input type="text" id="al-service" size="25"></td>
						</tr>
						<tr>
							<td>비고</td>
							<td class="right"><input type="text" id="al-note" size="25"></td>
						</tr>
					</table>
					<button id="allianceList" class="btn1">조회</button>
					<button id="regAlliance" class="btn2">등록</button>
				</div>
				<div id="allianceListField"></div>
			</div>
			<div id="boardList-block">
				<h3>게시 글 전체</h3>
				<button id="boardList" class="btn1">조회</button>
				<div id="boardListField"></div>
			</div>
			<div id="reportList-block">
				<h3>신고 관리</h3>
				<button id="reportList" class="btn1">조회</button>
				<div id="reportListField"></div>
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