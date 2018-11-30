<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}css/anotherUpdate.css"/>
		<script type="text/javascript" src="js/anotherMain.js" ></script>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}css/default.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}css/component.css" />
		<script src="js/modernizr.custom.js"></script>
	</head>
	<body>
	    <form action="/studentAdd"  method="post">
		<img id="img" src="img/4.jpg"/>
		<div id="background"></div>
		<div id="upper">
			<h2 class="title">软件工程班费管理系统</h2>
			<div id="input">
				<div id="name">
					<label>姓名:&nbsp;&nbsp;&nbsp;</label><input font style="color:black" class="input" type="text" name="studentName" placeholder="如张三"/>
				</div>
				<div id="ID">
					<label>学号:&nbsp;&nbsp;&nbsp;</label><input font style="color:black" class="input" type="text" name="studentID"placeholder="如U201514151" />
				</div>
			</div>
			<div id="btn">
				<input class="btn" type="submit" value="添加" />
				<input class="btn" type="submit" onclick=window.location.href='Search.jsp' value="返回" />
			</div>
		</div>
		</form>
	</body>
</html>
<script>
var error1='<%=request.getParameter("emptyTime")%>';
var error2='<%=request.getParameter("emptyMoney")%>';
var error3='<%=request.getParameter("emptyPerson")%>';
var error4='<%=request.getParameter("emptyExplain")%>';
var error5='<%=request.getParameter("Success")%>';

if(error1=='yes')
{
alert("请输入时间！");
}
if(error2=='yes')
{
alert("请输入金额!");
}
if(error3=='yes')
{
alert("请输入使用人！");
}
if(error4=='yes')
{
 alert("请输入备注！");
}
if(error5=='yes')
{
 alert("添加成功！");
 window.location.href="/oop/Add.jsp";
}

</script>
