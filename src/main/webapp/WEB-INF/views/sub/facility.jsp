<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Facility</title>
<link rel="shortcut icon" type="image/x-icon" href="resources/img/tree.ico">
<link rel="stylesheet" href="resources/css/common.css">
<link rel="stylesheet" href="resources/css/sub/floating-totop-button.css" >
<link rel="stylesheet" href="http://www.jqueryscript.net/css/jquerysctipttop.css" type="text/css">
<link rel="stylesheet" href="resources/css/sub/base.css" />
<link rel="stylesheet" href="resources/css/sub/photo-viewer.css" />
<link rel="stylesheet" href="resources/css/sub/albery.css" type="text/css">
<link rel="stylesheet" href="resources/css/sub/photopile.css" >
<link rel="stylesheet" href="resources/css/sub/demo.css" >
<link rel="stylesheet" href="resources/css/sub/style.css">

<style>
section {margin-top: 240px;}
.space{height:200px}

.menu{text-align: center;}
.menu ul{overflow: hidden; float: left; list-style:none; position:relative; margin-left: 50%; left:-350px;}
.menu ul li{list-style:none}
.menu ul li a {display: block;height:45px; text-indent:-9999px; overflow:hidden;}
.menu .menu1{width: 178px; background: url(resources/img/sub/fa/dormitory1.png); margin-top: 15px; float: left}
.menu .menu2{width: 178px; background: url(resources/img/sub/fa/health1.png); margin-top: 15px; float: left}
.menu .menu3{width: 178px; background: url(resources/img/sub/fa/cafe1.png); margin-top: 15px; float: left}  
.menu .menu4{width: 178px; background: url(resources/img/sub/fa/park11.png); margin-top: 15px; float: left}  

.menu .menu1 a:hover{background: url(resources/img/sub/fa/dormitory2.png);}
.menu .menu2 a:hover{background: url(resources/img/sub/fa/health2.png);}
.menu .menu3 a:hover{background: url(resources/img/sub/fa/cafe2.png);}
.menu .menu4 a:hover{background: url(resources/img/sub/fa/park22.png);}
</style>

<script type="text/javascript" src="resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="resources/js/gnb.js"></script>
<script src="resources/js/floating-totop-button.js"></script>
<script src="resources/js/slides.js"></script>
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
    	
<article id="content">
<script>
    $(document).ready(function($) {
        $(".scroll").click(function(event){		
            event.preventDefault();
            $('html,body').animate({scrollTop:$(this.hash).offset().top},1200);
        });
    });
</script>


<div class="contentArea">
    <div class="menu">
        <ul>
            <li class="menu1"><a class="scroll" href="#a">Dormitory</a></li>
            <li class="menu2"><a class="scroll" href="#b">Health</a></li>
            <li class="menu3"><a class="scroll" href="#c">Cafe</a></li>
            <li class="menu4"><a class="scroll" href="#d">Park / Stardium</a></li>
        </ul>
    </div>

	<div class="space" id="a"></div>


    <!--=======================start_top==========================-->
    <a href="#" class="to-top-button op-20 sh-10 bp-br bm-2 sz-4 bw-0w bs-2 hide filter" style="display: none;"><img src="resources/img/arrow.svg" class="arrow-img is-4 arrow-img"></a>
    <script>
        $("body").toTopButton({});

    </script>
    <script type="text/javascript">
        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-36251023-1']);
        _gaq.push(['_setDomainName', 'jqueryscript.net']);
        _gaq.push(['_trackPageview']);

        (function() {
            var ga = document.createElement('script');
            ga.type = 'text/javascript';
            ga.async = true;
            var s = document.getElementsByTagName('script')[0];
            s.parentNode.insertBefore(ga, s);
        })();

    </script>


    <!--=======================end_top==========================-->


    <h1 id="Dormitory">Dormitory</h1>
    <div class="slider_box">
        <!-- slide & description -->
        <div class="silder_con" >
            <div class="silder_panel">
                <a href="#" class="silder_panel_item">
                    <img src="resources/img/sub/fa/do1.PNG">
                </a>
                <a href="#" target="_blank" class="silder_intro">
                    <div class="silder_intro_content">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iusto error, voluptatum expedita, ipsum tenetur doloremque
                        doloribus rem, dolores ut molestias illum ea voluptate ex maxime. Amet repudiandae libero, error delectus?</div>
                </a>
            </div>
            <div class="silder_panel">
                <a href="#" class="silder_panel_item">
                    <img src="resources/img/sub/fa/do2.PNG">
                </a>
                <a href="#" target="_blank" class="silder_intro">
                    <div class="silder_intro_content">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minus quia laudantium temporibus odit, modi similique
                        possimus, iusto enim corporis quaerat dolor debitis, doloribus. Quibusdam illum, ipsam earum consectetur minus,
                        iure!
                    </div>
                </a>
            </div>
            <div class="silder_panel">
                <a href="#" class="silder_panel_item">
                    <img src="resources/img/sub/fa/do3.PNG">
                </a>
                <a href="#" target="_blank" class="silder_intro">
                    <div class="silder_intro_content">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque asperiores est doloremque inventore, provident
                        adipisci dolore consequuntur obcaecati, tempore libero necessitatibus facere totam? Quidem porro sequi, illo
                        labore et cum.</div>
                </a>
            </div>
            <div class="silder_panel">
                <a href="#" class="silder_panel_item">
                    <img src="resources/img/sub/fa/do4.PNG">
                </a>
                <a href="#" target="_blank" class="silder_intro">
                    <div class="silder_intro_content">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quod expedita necessitatibus incidunt atque cumque dolorum
                        vel minus, provident ipsam nobis adipisci natus at commodi dicta dolor perferendis hic cum, voluptatem.</div>
                </a>
            </div>
            <div class="silder_panel">
                <a href="#" class="silder_panel_item">
                    <img src="resources/img/sub/fa/do5.PNG">
                </a>
                <a href="#" target="_blank" class="silder_intro">
                    <div class="silder_intro_content">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Incidunt dicta enim placeat culpa, consequatur vitae
                        odio ex. Numquam sequi iste culpa repellendus et, fugit ipsa itaque beatae accusantium, maxime odit.</div>
                </a>
            </div>

        </div>
        <!-- contorl nav (created by JS)-->
        <div class="silder_nav_mask"></div>
        <div class="silder_nav"></div>
    </div>
    <script type="text/javascript">
        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-36251023-1']);
        _gaq.push(['_setDomainName', 'jqueryscript.net']);
        _gaq.push(['_trackPageview']);

        (function() {
            var ga = document.createElement('script');
            ga.type = 'text/javascript';
            ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0];
            s.parentNode.insertBefore(ga, s);
        })();

    </script>

	<div class="space" id="b"></div>

    <h1 id="Health">Fitness Club</h1>
    <section class="page panel">
        <div class="gallery">
            <div id="photo-viewer"></div>
            <div id="thumbnails">
                <a href="resources/img/sub/fa/health-1.PNG" class="thumb active2" ><img src="resources/img/sub/fa/button_heart_red.png" alt="Elderberry Marshmallow2" /></a>
                <a href="resources/img/sub/fa/health-2.PNG" class="thumb" ><img src="resources/img/sub/fa/button_heart_blue.png" alt="Rose Marshmallow" /></a>
                <a href="resources/img/sub/fa/health-3.PNG" class="thumb" ><img src="resources/img/sub/fa/button_heart_pink.png" alt="Crysanthemum Marshmallow" /></a>
                <a href="resources/img/sub/fa/health-4.PNG" class="thumb" ><img src="resources/img/sub/fa/button_heart_green.png" alt="Crysanthemum Marshmallow" /></a>
            </div>
        </div>
        <div class="description" style="font-size:1.1em;">
            <p class="standfirst"><strong>HHH</strong> 직원들을 위한 피트니스센터! 최신식 헬스기구로 사옥 한층이 가득 채워져 있다.</p>
            <p>체력 단련이 필요한 직원들은 누구든지 자유롭게 이용가능하다.<strong>근무시간</strong>에도 이용할 수 있어 업무 중 지칠 때는 운동을 하며 피로를 회복 할 수 있다. <strong>신입사원</strong>도 눈치 보지 않고 이용할 수 있는 PT까지 마련되어 있다. 기본 헬스 기구를 포함해 <strong>요가</strong>,<strong>필라테스</strong>까지 즐겁게 운동할 수 있는 쾌적한 사내 헬스장 이다.</p>
            <p><strong>$5.75</strong> / 3.5 oz packet</p>
        </div>
    </section>
    <script src="resources/js/photo-viewer.js"></script>

    <!--=======================================================================-->
	<div class="space" id="c"></div>

    <div class="container">
        <h1 id="Cafe">Cafe</h1>
        <center>
            <div class="albery-container">

                <div class="albery-wrapper">

                    <div class="albery-item">
                        <img src="resources/img/sub/fa/cafe-1.PNG" alt="">
                    </div>
                    <div class="albery-item">
                        <img src="resources/img/sub/fa/cafe-2.PNG" alt="">
                    </div>
                    <div class="albery-item">
                        <img src="resources/img/sub/fa/cafe-3.PNG" alt="">
                    </div>
                    <div class="albery-item">
                        <img src="resources/img/sub/fa/cafe-4.PNG" alt="">
                    </div>
                    <div class="albery-item">
                        <img src="resources/img/sub/fa/cafe-5.PNG" alt="">
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
                        <img src="resources/img/sub/fa/cafe-1.PNG" alt="">
                    </div>
                    <div class="pagination-item" data-item="2">
                        <img src="resources/img/sub/fa/cafe-2.PNG" alt="">
                    </div>
                    <div class="pagination-item" data-item="3">
                        <img src="resources/img/sub/fa/cafe-3.PNG" alt="">
                    </div>
                    <div class="pagination-item" data-item="4">
                        <img src="resources/img/sub/fa/cafe-4.PNG" alt="">
                    </div>
                    <div class="pagination-item" data-item="5">
                        <img src="resources/img/sub/fa/cafe-5.PNG" alt="">
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

	<div class="space" id="d"></div>

    <center>
        <h1 id="Pension">Park &amp; Stadium</h1>
    </center>

    <div class="photopile-wrapper">
        <ul class="photopile">
            <li>
                <a href="resources/img/sub/fa/park1.PNG">
                    <img src="resources/img/sub/fa/park1.PNG" alt="회사 인근 공원" width="133" height="100" />
                </a>
            </li>
            <li>
                <a href="resources/img/sub/fa/park2.PNG">
                    <img src="resources/img/sub/fa/park2.PNG" alt="공원 분수" width="133" height="100" />
                </a>
            </li>
            <li>
                <a href="resources/img/sub/fa/park3.PNG">
                    <img src="resources/img/sub/fa/park3.PNG" alt="공원에서 바라보는 회사" width="133" height="100" />
                </a>
            </li>
            <li>
                <a href="resources/img/sub/fa/park4.PNG">
                    <img src="resources/img/sub/fa/park4.PNG" alt="예쁜 우리회사 인근공원" width="100" height="133" />
                </a>
            </li>
            <li>
                <a href="resources/img/sub/fa/park5.PNG">
                    <img src="resources/img/sub/fa/park5.PNG" alt="공원 안내도" width="100" height="134" />
                </a>
            </li>
            <li>
                <a href="resources/img/sub/fa/park6.PNG">
                    <img src="resources/img/sub/fa/park6.PNG" alt="공원 야경" width="100" height="137" />
                </a>
            </li>
            <li>
                <a href="resources/img/sub/fa/sd1.PNG">
                    <img src="resources/img/sub/fa/sd1.PNG" alt="신축 체육관1" width="120" height="120" />
                </a>
            </li>
            <li>
                <a href="resources/img/sub/fa/sd2.PNG">
                    <img src="resources/img/sub/fa/sd2.PNG" alt="신축 체육관2" width="140" height="100" />
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
    </div>
    </article>
    
    <div class="space" id="e"></div>
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