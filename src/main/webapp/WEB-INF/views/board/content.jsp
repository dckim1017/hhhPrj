<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>content</title>
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
	width: 700px;
	position: relative;
	left: 50%;
	top: 0;
	margin-left: -300px;
	font-size:1.1em;
}
/* 댓글 입력 버튼*/
.btn_01{
	background : #41c64c;
	color : #fff;
	border : 1px solid #41c64c;
	padding : 14px 10px;
	margin-bottom: 20px;
	vertical-align:top;
}
.btn_c{
	background : #fff;
	color : #41c64c;
	border : 1px solid #41c64c;
	padding : 3px 5px;
}
/* 목록 버튼 */
#btn_c{
	background : #fff;
	color : #41c64c;
	border : 1px solid #41c64c;
	padding : 7px 10px;
	position: relative;
	left: 50%;
	top: 0;
	margin-left: -30px;
}
#likereport{
	position: relative;
	left: 50%;
	top: 0;
	margin-left: -55px;
}
/* 좋아요 카운트 */
#likecnt{
	vertical-align: bottom;
	font-size:1.2em;
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
</style>
<script type="text/javascript" src="resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="resources/js/gnb.js"></script>
<script type="text/javascript">
	function del(){
		var del=confirm("삭제하시겠습니까?");
		if(del==true){	
			var f=document.cform;
			f.action = "delete";
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
			<form name="cform" action="modify-view" method="post">
				<input type="hidden" id="hNo" name="hNo" value="${contentView.hhhno }">
				<div id="ctitle">
					<span><strong>${contentView.hhhtitle }</strong></span>
				</div>
				<div id="cinfo">
					<span class="left">글쓴이</span> <span>${contentView.hhhnickname }</span>
					<span>${contentView.hhhregdate }</span> <span class="left">조회</span>
					<span>${contentView.hhhcount }회</span>
					<c:if test="${memberNickname eq contentView.hhhnickname }">
						<input class="btn_c" type="submit" value="수정">
						<input class="btn_c" type="button" onclick="del();" value="삭제" />
					</c:if>
				</div>
				<p id="ccontent">
					<span>${contentView.hhhcontent }</span>
				</p>
			</form>
			<div id="likereport">
				<a href="likey?hNo=${contentView.hhhno }&hName=${memberNickname }"
					target="_blank"><img alt="" src="resources/img/board/like.png"></a>
				<span id="likecnt">: ${contentView.hhhlikecount}</span>
				<%-- <a href="report-view?hNo=${contentView.hhhno }&hName=${contentView.hhhnickname }&hTitle=${contentView.hhhtitle }"
					target="_blank" width="500px" height="400px"><img alt="" src="resources/img/board/report.png"></a> --%>
				<img alt="" src="resources/img/board/report.png" onclick="window.open('report-view?hNo=${contentView.hhhno }&hName=${contentView.hhhnickname }&hTitle=${contentView.hhhtitle }', '_blank', 'width=550, height=450, left=350, top=100', true)">
			</div>
			<div>
				<h5><b>댓글 목록</b></h5>
				<div style="margin-top:10px">
					<table width="666px">
						<c:forEach items="${reply }" var="re">
							<c:if test="${contentView.hhhgroup eq re.hhhgroup}">
								<tr style="padding:5px 0; border-top:1px solid #ccc">
									<td>${re.hhhnickname }
										<input type="hidden" id="reid" name="reid" value="${re.hhhreid }">
										<input type="hidden" id="regroup" name="regroup" value="${re.hhhgroup }">
										<c:if test="${re.hhhnickname eq memberNickname}">
											<img style="margin-bottom:2px" id="deleteReply" src="resources/img/board/close.png">
										</c:if>
									</td>
								</tr>
								<tr>
									<td>&nbsp;<img src="resources/img/board/re.gif">&nbsp;&nbsp;${re.hhhcontent }
									</td>
								</tr>
							</c:if>
						</c:forEach>
					</table>
				</div>
			<input type="hidden" id="hGroup" name="hGroup" value="${contentView.hhhgroup }">
			<input type="hidden" id="hName" name="hName" value="${memberNickname }">
			<textarea id="reply-ta" name="reply-ta" rows="3" cols="100" maxlength="100"></textarea>
			<script>
				$(document).on( "keyup change", "textarea#reply-ta[maxlength]", function(){
					var str = $(this).val()
					var mx = parseInt($(this).attr("maxlength"))
					if (str.length > mx) {
					$(this).val(str.substr(0, mx));
						return false;
					}
				});
			</script>
			<button id="inputReply" class="btn_01">댓글입력</button>
			</div>
			<div style="padding-bottom:20px;">
				<a id="btn_c" href="board">목록</a>
			</div>
			<script>
			$(function() {
				$('#deleteReply').on('click', function() {
					$.ajax({
						url : 'deleteReply',  
						type : 'get', 
						data : {
							reid : $('#reid').val(),
							regroup : $('#regroup').val(), 
						},
						success : function(t) {
							alert('삭제 완료.');
							location.reload()
						},
						error : function() {
							alert('실패 ㅠㅠ');
						}
					});
				});
				$('#inputReply').on('click', function() {
					$.ajax({
						url : 'reply',  
						type : 'post', 
						data : {
							hGroup : $('#hGroup').val(), 
							hNickname : $('#hName').val(),
							hContent : $('#reply-ta').val()
						},
						success : function(t) {
							alert('댓글이 입력되었습니다.');
							location.reload()
						},
						error : function() {
							alert('실패 ㅠㅠ');
						}
					});
				});
			});
			</script>
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