<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FAQ</title>
<link rel="shortcut icon" type="image/x-icon"
	href="resources/img/tree.ico">
<link rel="stylesheet" href="resources/css/common.css">
<style>
section {margin-top: 240px; position:relative;}

.sidemenu{text-align: center; width:200px;	height: 450px; backgroud:#0ff;  position:fixed; top:290; margin-left: 50%; left:-650px;}
.sidemenu ul{overflow: hidden; list-style:none;}
.sidemenu ul li{list-style:none}
.sidemenu ul li a {display: block; height:50px; text-indent:-9999px; overflow:hidden;}
.sidemenu .menu1{width: 200px; background: url(resources/img/sub/center/a1.png); margin-top: 15px; }
.sidemenu .menu2{width: 200px; background: url(resources/img/sub/center/f1.png); margin-top: 15px; }
.sidemenu .menu3{width: 200px; background: url(resources/img/sub/center/p1.png); margin-top: 15px; }  

.sidemenu .menu1 a:hover{background: url(resources/img/sub/center/a2.png);}
.sidemenu .menu2 a:hover{background: url(resources/img/sub/center/f2.png);}
.sidemenu .menu3 a:hover{background: url(resources/img/sub/center/p2.png);}

#aco{
	margin-top:50px;
	margin-bottom:165px;
}
dl{
	width:800px;
	margin:50px auto;
}
dt{
	line-height:35px;
	font-size:large;
	text-indent:3em;
	font-weight:bold;
	color:white;
	height:35px;
	background:url("resources/img/sub/center/background.jpg")
}
dt.over{
	background:url("resources/img/sub/center/background-over.jpg");
	cursor:pointer;
}
dt.selected{
	background:url("resources/img/sub/center/background_selected.jpg");
	cursor:default;
	color:black;
}
dd{
	height:270px;
	background:#D4D0C8;
}
dd p{
	text-indent:1em;
	padding:20px;
}
</style>
<script type="text/javascript" src="resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="resources/js/gnb.js"></script>
<script>
$(function(){
	$("dd:not(:first)").css("display","none");
	$("dt:first").addClass("selected");
	$("dl dt").click(function(){
		if($("+dd",this).css("display")=="none"){
			$("dd").slideUp("slow");
			$("+dd",this).slideDown("slow");
			$("dt").removeClass("selected");
			$(this).addClass("selected");
		}
	}).mouseover(function(){
		$(this).addClass("over");
	}).mouseout(function(){
		$(this).removeClass("over");
	});
});
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
    	<div class="sidemenu">
	        <ul>
	            <li class="menu1"><a href="address">Address</a></li>
	            <li class="menu2"><a href="FAQ">FAQ</a></li>
	            <li class="menu3"><a href="pp">Privacy Policy</a></li>
	        </ul>
	    </div>
	    <div id="aco">
	    	<dl>
				<dt>Q1. 질문1 - 제휴서비스 신청 방법</dt>
				<dd><p style="font-size:1.1em;">제휴 서비스 신청은 공지사항(Notice)에서 양식을 다운 받아 작성하시어 메일로 전송하시거나 센터로 직접 방문하여 신청해주시기 바랍니다. 작성시 조건과 주의사항을 반드시 확인하시어 불이익이 발생하지 않도록 사전에 주의하시기 바랍니다.<br><br>
				&nbsp;&nbsp;관리자 메일 : airenmj@gmail.com<br>
				&nbsp;&nbsp;센터 위치 : 찾아오시는 길 참고
				</p></dd>
				<dt>Q2. 질문2</dt>
				<dd><p>Integer rhoncus felis mauris. Donec massa nisi, posuere vel posuere vel, suscipit sed magna. Sed congue scelerisque odio, faucibus tempor nisl posuere condimentum. In eu tellus vitae elit consequat pretium. Maecenas nec ultrices dolor. Curabitur eu pulvinar turpis. Aenean vel tortor justo, id dapibus velit. Mauris pulvinar massa sit amet erat mollis sit amet ornare tellus aliquet. Quisque ullamcorper elementum libero, ut vehicula neque placerat nec. In hac habitasse platea dictumst. In hac habitasse platea dictumst. Morbi et ante turpis, et fringilla tortor. In hac habitasse platea dictumst. Proin eros urna, sagittis vitae tristique et, ullamcorper ac leo. Donec elementum arcu tortor. Praesent tincidunt dui in est adipiscing ac lobortis lorem porttitor. Nullam et dui elit. Vivamus hendrerit vestibulum enim, quis lobortis erat viverra vitae. Donec at pellentesque mi. Mauris lobortis libero ac metus ultricies accumsan. </p></dd>
				<dt>Q3. 질문3</dt>
				<dd><p>Integer pretium porttitor lectus at tempor. Donec nec cursus elit. Maecenas ornare malesuada urna vitae lobortis. Sed vulputate sapien quis purus cursus consectetur. Aenean nulla neque, egestas ut accumsan nec, convallis vel enim. Vestibulum vehicula interdum diam nec condimentum. Etiam in condimentum justo. Fusce a tortor metus, id pellentesque orci. Sed facilisis, tellus quis tempus faucibus, justo elit sodales lorem, eget placerat lectus risus bibendum ipsum. Donec varius mattis quam eu consequat. Praesent ut metus nec nibh tincidunt suscipit. Nam vulputate sodales egestas. Sed orci lectus, vestibulum ac gravida eget, congue non velit. Morbi rutrum convallis orci, in hendrerit arcu vulputate a. Aliquam aliquam facilisis libero, sit amet facilisis lacus tincidunt ac. Sed viverra nulla sit amet turpis egestas nec molestie justo congue. Vivamus a lacinia sem. Aenean ut metus arcu, non ornare orci. Praesent feugiat est eu tellus dictum ac imperdiet nisi imperdiet. </p></dd>
			</dl>
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