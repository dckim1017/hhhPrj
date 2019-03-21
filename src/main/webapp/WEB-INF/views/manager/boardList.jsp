<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 전체</title>
<link rel="stylesheet" href="resources/css/manager/list_style.css" type="text/css" media="print, projection, screen" />
<script type="text/javascript" src="resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="resources/js/jquery.tablesorter.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#myTable").tablesorter({
		headers: {
			1: { sorter: false } , 
			3: { sorter: false }
		}
	}); 
});
</script>
</head>
<body>
	${result }
</body>
</html>