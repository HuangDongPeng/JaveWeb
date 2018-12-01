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
                      <a class="button" onclick=window.location.href='Update.jsp?studentName=<%=tl.name%>&studentID=<%=tl.ID%>'>修改</a>
                   </td>

				   <td>
					   <form action="/studentDelete/<%=tl.ID%>">
						   <button  type="submit">删除</button>
					   </form>
				   </td>
			   </div>
           </tr>
             <%}
             Student.studentArrayList.clear();
             %>
		</table>
        <td>
            <input class="btn" type="submit" onclick=window.location.href='Search.jsp' value="返回" />
        </td>
	</body>
</html>
