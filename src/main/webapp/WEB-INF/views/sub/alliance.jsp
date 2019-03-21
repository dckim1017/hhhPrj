<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Alliance</title>
<link rel="shortcut icon" type="image/x-icon"
	href="resources/img/tree.ico">
<link rel="stylesheet" href="resources/css/common.css">
<link rel="stylesheet" href="resources/css/sub/floating-totop-button.css" >
<link rel="stylesheet" href="resources/css/sub/albery.css" type="text/css">
<link rel="stylesheet" href="resources/css/sub/photopile.css" >
<link rel="stylesheet" href="resources/css/sub/base.css" />
<link rel="stylesheet" href="resources/css/sub/demo.css" >
<style>
section {margin-top: 240px;}
.space{height:200px; text-align:center; padding-top:25px; font-size:1.2em; }
.space a{color:#609bf2}

.menu{text-align: center;}
.menu ul{overflow: hidden; float: left; list-style:none; position:relative; margin-left: 50%; left:-225px;}
.menu ul li{list-style:none; padding-right:3px;}
.menu ul li a {display: block;height:50px; text-indent:-9999px; overflow:hidden;}
.menu .menu1{width: 156px; background: url(resources/img/sub/al/health1.png) no-repeat; margin-top: 15px; float: left}
.menu .menu2{width: 156px; background: url(resources/img/sub/al/language1.png) no-repeat; margin-top: 15px; float: left}
.menu .menu3{width: 156px; background: url(resources/img/sub/al/pension1.png) no-repeat; margin-top: 15px; float: left}  

.menu .menu1 a:hover{background: url(resources/img/sub/al/health2.png) no-repeat;}
.menu .menu2 a:hover{background: url(resources/img/sub/al/language2.png) no-repeat;}
.menu .menu3 a:hover{background: url(resources/img/sub/al/pension2.png) no-repeat;}

#content {width: 100%; position: relative;}
#content .duo{width: 80%; margin: 0 auto; padding-bottom: 20px}
#content .duo h3{font-size: 38px; padding-top: 5px; padding-bottom: 15px; width: 100%; text-align:center}

#content .duo h3:after{
    display: inline-block;
    margin: 0 0 8px 20px;
    height: 1px;
    content: " ";
    text-shadow: none;
    background-color: #999;
    width: 250px;
}

#content .duo h3:before{
    display: inline-block;
    margin: 0 20px 8px 0;
    height: 1px;
    content: " ";
    text-shadow: none;
    background-color: #999;
    width: 250px;
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
				<li class="menu1"><a class="scroll" href="#a">Health</a></li>
				<li class="menu2"><a class="scroll" href="#b">Language</a></li>
				<li class="menu3"><a class="scroll" href="#c">Recreation</a></li>
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
		</script>
		<!--=======================탑 버 튼==========================-->
		<a href="#"
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
					ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
					var s = document.getElementsByTagName('script')[0];
					s.parentNode.insertBefore(ga, s);
				})();
			</script> <!--=======================탑 버 튼==========================-->

		<div class="space" id="a"></div>
		
		<h1 id="Health">Health</h1>
		<div id="content" class="content container">

			<div class="duo example page panel">
				<br><h3>건강검진</h3>
				<div>
					<img src="resources/img/sub/al/h1.png" width="800px">
				</div>
				<br><br><h3>피부관리</h3>
				<div>
					<img src="resources/img/sub/al/h2.png" width="800px">
				</div>
				<br><br><h3>마 사 지</h3>
				<div>
					<img src="resources/img/sub/al/h3.png" width="800px">
				</div>
			</div>
		</div>
    	
    	<div class="space" id="b">
    		<span>회원들의 건강을 우선시하여 인근의 건강검진센터, 에스테틱, 마사지샵과 제휴를 관계를 맺어<br> 건강 증진, 피로 회복을 위한 서비스를 제공하고 있습니다.</span><br><br>
    		<a href="#a">건강검진센터 바로 가기</a><br>
    		<a href="#a">에스테틱 바로 가기</a><br>
    		<a href="#a">마사지샵 바로 가기</a>
    	</div>
    	
    	<div class="container">
        <h1 id="Cafe">Language</h1>
        <center>
            <div class="albery-container">

                <div class="albery-wrapper">

                    <div class="albery-item">
                    	<img src="resources/img/sub/al/la1.jpg" alt="">
                    </div>
                    <div class="albery-item">
                        <img src="resources/img/sub/al/la4.jpg" alt="">
                    </div>
                    <div class="albery-item">
                        <img src="resources/img/sub/al/la2.jpg" alt="">
                    </div>
                    <div class="albery-item">
                        <img src="resources/img/sub/al/la3.JPG" alt="">
                    </div>
                    <div class="albery-item">
                        <img src="resources/img/sub/al/la5.jpg" alt="">
                    </div>
                    <div class="albery-item">
                        <img src="resources/img/sub/al/la6.jpg" alt="">
                    </div>
                </div>

                <div class="move-right">
                    <a href="#" id="rightArrow"></a>
                </div>
                <div class="move-left">
                    <a href="#" id="leftArrow"></a>
                </div>

            </div>
        </center>

        <center>
            <div class="pagination-container">
                <div class="pagination-wrapper">
                    <div class="pagination-item" data-item="1">
                        <img src="resources/img/sub/al/la1.jpg" alt="">
                    </div>
                    <div class="pagination-item" data-item="2">
                        <img src="resources/img/sub/al/la4.jpg" alt="">
                    </div>
                    <div class="pagination-item" data-item="3">
                        <img src="resources/img/sub/al/la2.jpg" alt="">
                    </div>
                    <div class="pagination-item" data-item="4">
                        <img src="resources/img/sub/al/la3.JPG" alt="">
                    </div>
                    <div class="pagination-item" data-item="5">
                        <img src="resources/img/sub/al/la5.jpg" alt="">
                    </div>
                    <div class="pagination-item" data-item="6">
                        <img src="resources/img/sub/al/la6.jpg" alt="">
                    </div>
                </div>
            </div>
        </center>
    </div>

    <script src="resources/js/albery.js"></script>
    <script>
        $(".albery-container").albery({
            speed: 500,
            imgWidth: 600,
        });
    </script>
    
    	<div class="space" id="c">
    		<span>글로벌 인재 육성을 위한 배움의 기회를 제공합니다.</span><br><br>
    		<a href="#b">어학원 바로 가기</a>
    	</div>
    	
    	<center>
	        <h1 id="Pension">Pension</h1>
	    </center>
	
	    <div class="photopile-wrapper">
	        <ul class="photopile">
	            <li>
	                <a href="resources/img/sub/al/p1.jpg">
	                    <img src="resources/img/sub/al/p1.jpg" alt="1호실-1" width="133" height="100" />
	                </a>
	            </li>
	            <li>
	                <a href="resources/img/sub/al/p2.jpg">
	                    <img src="resources/img/sub/al/p2.jpg" alt="1호실-2" width="133" height="100" />
	                </a>
	            </li>
	            <li>
            	    <a href="resources/img/sub/al/p3.jpg">
	                    <img src="resources/img/sub/al/p3.jpg" alt="1호실-3" width="133" height="100" />
	                </a>
	            </li>
	            <li>
	                <a href="resources/img/sub/al/p4.jpg">
	                    <img src="resources/img/sub/al/p4.jpg" alt="1호실-4" width="100" height="133" />
	                </a>
	            </li>
	            <li>
	                <a href="resources/img/sub/al/p5.jpg">
	                    <img src="resources/img/sub/al/p5.jpg" alt="2호실-1" width="100" height="134" />
	                </a>
	            </li>
	            <li>
	                <a href="resources/img/sub/al/p6.jpg">
	                    <img src="resources/img/sub/al/p6.jpg" alt="2호실-2" width="100" height="137" />
	                </a>
	            </li>
	            <li>
	                <a href="resources/img/sub/al/p7.jpg">
	                    <img src="resources/img/sub/al/p7.jpg" alt="2호실-3" width="120" height="120" />
	                </a>
	            </li>
	            <li>
	                <a href="resources/img/sub/al/p8.jpg">
	                    <img src="resources/img/sub/al/p8.jpg" alt="2호실-4" width="140" height="100" />
	                </a>
	            </li>
	            <li>
	                <a href="resources/img/sub/al/p9.jpg">
	                    <img src="resources/img/sub/al/p9.jpg" alt="3호실-1" width="133" height="100" />
	                </a>
	            </li>
	            <li>
	                <a href="resources/img/sub/al/p10.jpg">
	                    <img src="resources/img/sub/al/p10.jpg" alt="3호실-2" width="133" height="100" />
	                </a>
	            </li>
	            <li>
	                <a href="resources/img/sub/al/p11.jpg">
	                    <img src="resources/img/sub/al/p11.jpg" alt="3호실-3" width="133" height="100" />
	                </a>
	            </li>
	            <li>
	                <a href="resources/img/sub/al/p12.jpg">
	                    <img src="resources/img/sub/al/p12.jpg" alt="3호실-4" width="100" height="133" />
	                </a>
	            </li>
	            <li>
	                <a href="resources/img/sub/al/p13.jpg">
	                    <img src="resources/img/sub/al/p13.jpg" alt="4호실-1" width="100" height="134" />
	                </a>
	            </li>
	            <li>
	                <a href="resources/img/sub/al/p14.jpg">
	                    <img src="resources/img/sub/al/p14.jpg" alt="4호실-2" width="100" height="137" />
	                </a>
	            </li>
	            <li>
	                <a href="resources/img/sub/al/p15.jpg">
	                    <img src="resources/img/sub/al/p15.jpg" alt="4호실-3 width="120" height="120" />
	                </a>
	            </li>
	            <li>
	                <a href="resources/img/sub/al/p16.jpg">
	                    <img src="resources/img/sub/al/p16.jpg" alt="5호실-1" width="140" height="100" />
	                </a>
	            </li>
	            <li>
	                <a href="resources/img/sub/al/p17.jpg">
	                    <img src="resources/img/sub/al/p17.jpg" alt="5호실-2" width="133" height="100" />
	                </a>
	            </li>
	            <li>
	                <a href="resources/img/sub/al/p18.jpg">
	                    <img src="resources/img/sub/al/p18.jpg" alt="5호실-3" width="133" height="100" />
	                </a>
	            </li>
	            <li>
	                <a href="resources/img/sub/al/p19.jpg">
	                    <img src="resources/img/sub/al/p19.jpg" alt="6호실-1" width="133" height="100" />
	                </a>
	            </li>
	            <li>
	                <a href="resources/img/sub/al/p20.jpg">
	                    <img src="resources/img/sub/al/p20.jpg" alt="6호실-2" width="100" height="133" />
	                </a>
	            </li>
	        </ul>
	    </div>
	
	
	    <!-- .photopile-wrapper -->
	
	    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js" integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU=" crossorigin="anonymous"></script>
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui-touch-punch/0.2.3/jquery.ui.touch-punch.min.js"></script>
	    <script src="resources/js/photopile.js"></script>
	    <script>
	        PhotoPile().scatter();
	
	    </script>
    	<div class="space" id="d">
    		<span>가족 또는 연인과 자연 속에서 힐링하며 쉴 수 있도록 제공되는 서비스입니다.</span><br><br>
    		<a href="#c">펜션사이트 바로 가기</a>
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