<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Address</title>
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

#map {
	width:800px;
	height: 500px;
	margin: 50px auto 5px;
}
#map2{
	width:720px;
	height: 740px;
	margin: 5px auto 50px;
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
		<div class="sidemenu">
	        <ul>
	            <li class="menu1"><a href="address">Address</a></li>
	            <li class="menu2"><a href="FAQ">FAQ</a></li>
	            <li class="menu3"><a href="pp">Privacy Policy</a></li>
	        </ul>
	    </div>
	    <div id="map"></div>
	    <script>
	
	      // The following example creates complex markers to indicate beaches near
	      // Sydney, NSW, Australia. Note that the anchor is set to (0,32) to correspond
	      // to the base of the flagpole.
	
	      function initMap() {
	        var map = new google.maps.Map(document.getElementById('map'), {
	          zoom: 17,
	          center: {lat: 37.5349, lng: 127.1335}
	        });
	
	        setMarkers(map);
	      }
	
	      // Data for the markers consisting of a name, a LatLng and a zIndex for the
	      // order in which these markers should display on top of each other.
	      var beaches = [
	        ['HHH', 37.535617, 127.133586, 1]
	      ];
	
	      function setMarkers(map) {
	        // Adds markers to the map.
	
	        // Marker sizes are expressed as a Size of X,Y where the origin of the image
	        // (0,0) is located in the top left of the image.
	
	        // Origins, anchor positions and coordinates of the marker increase in the X
	        // direction to the right and in the Y direction down.
	        var image = {
	//          url: 'https://developers.google.com/maps/documentation/javascript/examples/full/images/beachflag.png',
	            url:"resources/img/sub/center/mark.PNG",
	          // This marker is 20 pixels wide by 32 pixels high.
	          size: new google.maps.Size(20, 32),
	          // The origin for this image is (0, 0).
	          origin: new google.maps.Point(0, 0),
	          // The anchor for this image is the base of the flagpole at (0, 32).
	          anchor: new google.maps.Point(0, 32)
	        };
	        // Shapes define the clickable region of the icon. The type defines an HTML
	        // <area> element 'poly' which traces out a polygon as a series of X,Y points.
	        // The final coordinate closes the poly by connecting to the first coordinate.
	        var shape = {
	          coords: [1, 1, 1, 20, 18, 20, 18, 1],
	          type: 'poly'
	        };
	        for (var i = 0; i < beaches.length; i++) {
	          var beach = beaches[i];
	          var marker = new google.maps.Marker({
	            position: {lat: beach[1], lng: beach[2]},
	            map: map,
	            icon: image,
	            shape: shape,
	            title: beach[0],
	            zIndex: beach[3]
	          });
	        }
	      }
	    </script>
	    <script async defer
	    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAUrouQuymkFDDwNPGgbLKXTVXvwGPsiO8&callback=initMap">
	    </script>
	    
	    <div id="map2">
	    	<img alt="" src="resources/img/sub/center/address.png">
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