<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LookupPW</title>
<link rel="shortcut icon" type="image/x-icon"
	href="resources/img/tree.ico">
<link rel="stylesheet" href="resources/css/common.css">
<link type="text/css" rel="stylesheet" href="resources/css/join.css">
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
	margin-bottom:70px;
}
.btn{
	background: #fff;
	color: #7CADB6;
	border: 1px solid #7CADB6;
	padding: 4px 10px;
	margin-top:10px;
	margin-bottom:50px;
}
</style>
<script type="text/javascript" src="resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="resources/js/gnb.js"></script>
   <script type="text/javascript">
    $(function(){
    	$("form").submit(function(){
    	    var getIDCheck= RegExp(/^[0-9]{6}$/);
    	    var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
    	
    		//에러 초기화
    		$("p.error").remove();
    		$("dl dd").removeClass("error");
    		
    		//필수 항목 체크
    		$(":text,:password").filter(".validate").each(function(){
    			$(this).filter(".required").each(function(){
    				if($(this).val()==""){
    					$(this).parent().append("<p class='error'>필수항목입니다</p>");
    				}
    			});
    		});
    		
    		//에러일 경우 처리
    		if($("p.error").length > 0){
    				$('html,body').animate({ scrollTop: $("p.error:first").offset().top-40 }, 'slow');
    				$("p.error").parent().addClass("error");
    				return false;
    
				}

			if (!getIDCheck.test($("#id").val())) {
				alert("ID를 확인해주세요.");
				$("#id").val("");
				$("#id").focus();
				return false;
			}

			if (!getMail.test($("#email").val())) {
				alert("이메일 형식이 올바르지 않습니다.")
				$("#email").val("");
				$("#email").focus();
				return false;
			}
		});
	});
    $(function(){
    	$("#id").focus(function(){
    		$("#idEl").css("display","none");
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
			</div>
		</header>

    <section>
    	<img id="top-img" src="resources/img/board/visual.jpg" alt="">
		<div id="content">
			<h1>PW 찾기</h1>
			<form action="lookupPW" method="post">
				<dl>
					<dt>ID 입력<span> ※ </span></dt>
					<dd><input type="text" name="id" id="id" size="35" class="validate required" placeholder="  ID는 사원번호입니다." />
					<span id="idEl" style="font-style:italic; color:red;">&nbsp;&nbsp;${idNE }</span></dd>
				</dl>
				<dl>
					<dt>회원가입시 입력한 이메일<span> ※ </span></dt>
					<dd><input type="text" name="email" id="email" size="35" class="validate required" /></dd>
				</dl>
				<p style="text-align:center; margin-bottom:20px;"><input class="btn" type="submit" value="확인" />
				<input class="btn" type="button" value="취소" onclick="location.href='/hhh/'"/></p>
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