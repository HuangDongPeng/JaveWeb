<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="css/anothSearch.css"/>
		<script type="text/javascript" src="js/anotherMain.js" ></script>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
		<link rel="stylesheet" type="text/css" href="css/default.css" />
		<link rel="stylesheet" type="text/css" href="css/component.css" />
		<script src="js/modernizr.custom.js"></script>
		
	</head>
	<body>
	<form action="/studentSearch"  method="post">
		<img id="img" src="img/4.jpg"/>
		<div id="background"></div>
		<div id="upper">
			<h2 class="title">学生信息管理系统</h2>
			<input name="studentName" id="input" type="text" placeholder="&nbsp;输入查询的姓名" />
			<div id="btn">
				<input id="btn1" type="submit" value="搜索" />
				<input id="btn2" type="button" onclick=window.location.href='Add.jsp' value="添加" />
			</div>
		</div>
	</body>
</html>
