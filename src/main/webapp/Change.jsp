<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="userpackage.Expense,userpackage.ExpenseDA" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/anotherUpdate.css"/>
		<script type="text/javascript" src="js/anotherMain.js" ></script>
	</head>
	<body>
	<form action="./servlet/MoneyController"  method="post">
	<img id="img" src="img/4.jpg"/>
		<div id="background"></div>
		<div id="upper">
	<%
	int detail= Integer.parseInt(request.getParameter("detail"));
	Expense ae=null;
    ae=ExpenseDA.find(detail);
	 %>
	<h2 class="title">软件工程班费管理系统</h2>
			<div id="radio" style="margin-left:180px">
			<input font style="color:black" name="identity" type="radio" value="in" checked="checked"/><lable>收入</lable>
			<input font style="color:black" name="identity" type="radio" value="out" /><lable>支出</label>
		    </div>
			<div id="input">
			<div id="date">
			<label>日期:&nbsp;&nbsp;&nbsp;</label><input font style="color:black" class="input" type="text" value= <%=ae.getTime() %>  name="time"/>
			</div>
			<div id="money">
				<label>金额:&nbsp;&nbsp;&nbsp;</label><input font style="color:black"class="input" type="text"value=<%=ae.getMoney()%>  name="money" />
			</div>
			<div id="people">
				<label>使用者:</label><input  font style="color:black" class="input"type="text" value=<%=ae.getPerson() %> name="person" />
			</div>
			<div id="common">
				<label>备注：&nbsp;</label><input font style="color:black" class="input" type="text" value=<%=ae.getExplain() %>  name="explain" />
			</div>
			</div>
			<div id="btn">
				<input class="btn" type="button"value="返回" onclick="window.location.href='/oop/Expense.jsp'" />
				<input class="btn" type="submit" value="完成" />
			</div>
	        <div id="aaa">
				<input type="text"  value=1 style="display: none;"  name="detail"/></br>
			    <input type="text"  value=<%=ae.getID()%> style="display: none;"  name="origin"/></br>
			</div>
			
		</div>
		<script>
	
		</script>
	
	</body>
</html>
<script>
var error1='<%=request.getParameter("emptyTime")%>';
var error2='<%=request.getParameter("emptyMoney")%>';
var error3='<%=request.getParameter("emptyPerson")%>';
var error4='<%=request.getParameter("emptyExplain")%>';
var error5='<%=request.getParameter("Success")%>';
var error6='<%=request.getParameter("changeSuccess")%>'
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
 alert("修改成功！");
 window.location.href="/oop/Expense.jsp";
}


</script>

