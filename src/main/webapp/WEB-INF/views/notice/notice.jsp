<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Notice</title>
<link rel="shortcut icon" type="image/x-icon"
	href="resources/img/tree.ico">
<link rel="stylesheet" href="resources/css/common.css">
<style>
section {
	margin-top: 169px;
}
section #top-img{
	width: 2000px;
	position: relative;
	left: 50%;
	top: 0;
	margin-left: -840px;
}
table{
	margin : 20px auto;
}
table thead tr th{
	padding:10px 0;
	border-top: 2px solid #21a4ef;
	border-bottom : 1px solid #58d7f4;
}
table tbody tr td{
	padding:5px 0;
	border-bottom : 1px solid #71b4c4;
}
table tbody tr td.td{
	text-align:center;
}
table tbody tr td.title{
	padding-left:30px;
}
#ul_w{
	width:1000px;
	list-style:none;
	position: relative;
	left: 50%;
	top: -10px;
	margin-left: 430px;
}
#ul_w li{
	margin-left:5px;
}
#btn_01{
	background : #21a4ef;
	color : #fff;
	border : 1px solid #21a4ef;
	padding : 7px 10px;
	position : relative;
	right: 0;
}
form#search{
	width:1000px;
	position: relative;
	left: 50%;
	top: 0;
	margin-left: -100px;
	margin-bottom: 25px;
}
#btn_s{
	padding :4px 8px;
	border : 0;
	background : #21a4ef;
	color : #fff;
	letter-spacing:-0.1em;
	cursor : pointer;
}
</style>
<script type="text/javascript" src="resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="resources/js/gnb.js"></script>
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
        <table width="1000">
        	<colgroup>
        		<col width="8%" />
        		<col width="55%" />
        		<col width="10%" />
        		<col width="20%" />
        		<col width="7%" />
        	</colgroup>
            <thead>
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>글쓴이</th>
                    <th>날짜</th>
                    <th>조회</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${list }" var="dto">
                    <tr>
                        <td class="td">${dto.nno }</td>
                        <td class="title"><a href="ncontent-view?nNo=${dto.nno }"><strong>${dto.ntitle }</strong>&nbsp;
	                        <c:if test="${not empty dto.nfile }"><img src="resources/img/board/icon_file.gif"></c:if>
                        </a></td>
                        <td class="td">${dto.nwriter }</td>
                        <td class="td">${dto.nregdate }</td>
                        <td class="td">${dto.ncount }</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <c:if test="${(not empty memberNickname) && (memberNickname eq '관리자')}">
	        <ul id="ul_w">
	        	<li><a id="btn_01" href="nwrite-view">글쓰기</a></li>
			</ul>
		</c:if>
        <form id="search" name="searchform" action="notice">
            <select name="searchField">
                <option value="ntitle" selected>제목
                <option value="ncontent">내용
                <option value="both">제목+내용
            </select>
            <input type="text" name="searchWord">
            <input id="btn_s" type="submit" value="검색">
        </form>
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