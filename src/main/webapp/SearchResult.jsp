<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.example.demo.entity.Student" %>
<!DOCTYPE html>
<html>
	<head>
<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="css/anotherDisplay.css"/>
		<script type="text/javascript" src="js/anotherMain.js" ></script>
	</head>
	<body>
	<img id="img" src="img/4.jpg"/>
		<div id="background"></div>
		<div id="upper">
			<h2 class="title">学生信息管理系统</h2>
		<table  border='2'>
		<tr>
			<th>姓名</th>
			<th>学号</th>

		</tr>
		<%
            for(Student tl:Student.studentArrayList)
            {%>
           <tr>
               <td><%=tl.name %></td>
               <td><%=tl.ID %></td>

			   <div id="btn">
				   <td>
					   <form action="/studentUpdate/<%=tl.ID%>" >
						   <button  type="submit">修改</button>
					   </form>
				   </td>
				   <td>
					   <form action="/studentDelete">
						   <button  type="submit">删除</button>
					   </form>
				   </td>
			   </div>
           </tr>

             <%}%>
		</table>
		</div>
	</body>
</html>
<script>
	function Update(value) {
		alert("修改"+value);
    }
    function Delete(value) {
		alert("删除"+value);
    }
</script>