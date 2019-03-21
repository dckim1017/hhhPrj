<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#report-ta").hide();
		$("#etc").click(function(){
			$("#report-ta").show();
		});
		$(".rbtn").click(function(){
			$("#report-ta").hide();
		});
	});
	function report(){
		var rep=confirm("신고하시겠습니까?");
		if(rep==true){	
			var f=document.form;
			f.action = "report";
			f.submit();
		}
	}
</script>
<style>
body{background-color:#f8f8f8}
form{padding-left:10px}
#reason{font-size:.8em; font-style:italic}
div{text-align:center; margin-top:5px}
</style>
</head>
<body>
	<form name="form" action="report">
		<input type="hidden" name="hNo" value="${hNo }">
		<input type="hidden" name="hName" value="${hName }">
		<input type="hidden" name="memberNickname" value="${memberNickname }">
		<h1>신고하기</h1>
		<label>제 목 : </label><span>${hTitle }</span><br>
		<label>글쓴이 : </label><span>${hName }</span><br>
		<label>신고 제목 : </label><input type="text" name="rTitle" size="55"><br>
		<label>신고 사유 : </label><span id="reason">대표적인 사유 1개를 선택해 주세요</span><br>
		<input type="radio" name="report" value="r1" id="r1" class="rbtn"><label for="r1">부적절한 홍보 게시글</label><br>
		<input type="radio" name="report" value="r2" id="r2" class="rbtn"><label for="r2">음란성 또는 도박성 유해 게시글</label><br>
		<input type="radio" name="report" value="r3" id="r3" class="rbtn"><label for="r3">명예훼손/사생활 침해 및 저작권 침해 등</label><br>
		<input type="radio" name="report" value="etc" id="etc"><label for="etc">기타</label><br>
		<textarea id="report-ta" rows="9" cols="70" name="report-ta"></textarea><br>
	</form>
	<div>
		<button onclick="report();">신고하기</button>
		<button onclick="self.close()">취소</button>
	</div>
</body>
</html>