<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My Page</title>
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
#mypagePW{
	width : 250px;
	margin : 50px auto;
}
#mypageNN{
	width : 300px;
	margin : 50px auto;
}
h4{
	font-size:1.4em;
	color:#7CADB6;
	margin-bottom:10px;
	text-align:center;
}
#rule{
	text-align:center;
	color:#aaa;
	margin-bottom:10px;
}
.left{
	background: #ccc;
	padding:2px 5px 2px 20px;
	width:80px;
}
.left2{
	background: #ccc;
	padding:2px 8px 2px 20px;
	width:80px;
}
#setPW, #setNickname{
	background: #fff;
	color: #aaa;
	border: 1px solid #aaa;
	padding: 4px 10px;
	margin-top:5px;
}
#checkNickname{
	background: #aaa;
	color: #fff;
	border: 1px solid #fff;
	padding: 2px 5px;
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
		<div id="mypagePW">
		<h4><strong>비밀번호 변경</strong></h4>
		<table >
            <colgroup>
                <col width="50%">
                <col width="50%">
            </colgroup>
            <tr>
			    <th colspan="2" id="rule">영문(대,소구별),숫자,특수문자 조합 8~12자</th>
            </tr>
            <tr>
                <td class="left">변경할 비밀번호</td>
                <td><input type="password" id="changedPW" size="20"></td>
            </tr>
            <tr>
                <td class="left">비밀번호 확인</td>
                <td><input type="password" id="checkPW" size="20"></td>
            </tr>
            <tr>
           <th colspan="2"><input type="hidden" id="hID" name="hID" value="${memberID }">
           <button id="setPW">변경</button>
			</th></tr>
			</table>
		</div>
		
		<div id="mypageNN">
		<h4><strong>닉네임 변경</strong></h4>
		<table>
		    <colgroup>
                <col width="45%">
                <col width="30%">
                <col width="25%">
            </colgroup>
            <tr>
                <td class="left2">현재 닉네임</td>
                <td colspan="2">&nbsp;&nbsp;${memberNickname }</td>
            </tr>
			<tr>
                <td class="left2">변경할 닉네임</td>
                <td><input type="text" id="changeName" placeholder="  2~8자로 입력"></td>
                <td><button id="checkNickname">중복확인</button></td>
            </tr>
            <tr>
           <th colspan="3"><input type="hidden" id="hNick" name="hNick" value="${memberNickname }">
           <button id="setNickname">변경</button>
			</th></tr>
			
        </table>
		<div style="text-align:center; padding-top:10px;" id="resultCNN"></div>
		</div>

		<script>
		$(function() {
			$("#changeName").focus(function(){
				$("#changeName").val("");
				$("#resultCNN").html("");
			});
			$('#setNickname').on('click', function() {
				$.ajax({
					url : 'setNickname',  
					type : 'post', 
					data : {
						hID : $('#hID').val(),
						changeName : $('#changeName').val(), 
						hNick : $('#hNick').val(),
					},
					success : function(t) {
						alert('닉네임이 변경되었습니다. 다시 로그인해주세요.');
						location.href="reLogin";
					},
					error : function() {
						alert('실패 ㅠㅠ');
					}
				});
			});
			$('#checkNickname').on('click', function() {
				var getNickName= RegExp(/^[A-Za-z0-9가-힣]{2,8}$/);
				
				if (!getNickName.test($("#changeName").val())) {
					alert("닉네임은 2~8자로 입력해주세요");
					$("#changeName").val("");
					$("#changeName").focus();
					return false;
				}
				
				$.ajax({
					url : 'checkNickname',  
					type : 'post', 
					data : {
						changeName : $('#changeName').val(), 
					},
					success : function(t) {
						$("#resultCNN").html(t);
					},
					error : function() {
						alert('실패 ㅠㅠ');
					}
				});
			});
			$('#setPW').on('click', function() {
				var getPWCheck= RegExp(/^[A-Za-z0-9_\.\-]{8,12}$/);
				
				if (!getPWCheck.test($("#changedPW").val())) {
					alert("비밀번호 형식이 올바르지 않습니다.");
					$("#changedPW").val("");
					$("#changedPW").focus();
					return false;
				}
				if ($("#changedPW").val() != ($("#checkPW").val())) {
					alert("비밀번호가 일치하지 않습니다.");
					$("#checkPW").val("");
					$("#checkPW").focus();
					return false;
				}
				
				$.ajax({
					url : 'setPW',  
					type : 'post', 
					data : {
						hID : $('#hID').val(), 
						changedPW : $('#changedPW').val(), 
					},
					success : function(t) {
						alert('비밀번호가 변경되었습니다. 다시 로그인해주세요.');
						location.href="reLogin";
					},
					error : function() {
						alert('실패 ㅠㅠ');
					}
				});
			});
		});
		</script>
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