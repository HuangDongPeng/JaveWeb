<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="userpackage.UserDA,userpackage.User" %>

	<!DOCTYPE html>
<html>
	<head>
<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="css/anotherDisplay.css"/>
		<script type="text/javascript" src="js/anotherMain.js" ></script>
		<script type="text/javascript" src="js/anotherMain.js" ></script>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
		<link rel="stylesheet" type="text/css" href="css/default.css" />
		<link rel="stylesheet" type="text/css" href="css/component.css" />
		<script src="js/modernizr.custom.js"></script>
	</head>
	<body>
	
	<div class="container">	
			
			<div class="main clearfix">
				<nav id="menu" class="nav">					
					<ul>
						<li>
							<a href="/oop/Search.jsp">
								<span class="icon">
									<i aria-hidden="true" class="icon-home"></i>
								</span>
								<span>Search</span>
							</a>
						</li>
						<li>
							<a href="/oop/Add.jsp">
								<span class="icon"> 
									<i aria-hidden="true" class="icon-services"></i>
								</span>
								<span>Update</span>
							</a>
						</li>
						<li>
							<a href="/oop/Title.jsp">
								<span class="icon">
									<i aria-hidden="true" class="icon-portfolio"></i>
								</span>
								<span>Members</span>
							</a>
						</li>
						<li>
							<a href="/oop/Expense.jsp">
								<span class="icon">
									<i aria-hidden="true" class="icon-blog"></i>
								</span>
								<span>Display</span>
							</a>
						</li>
						
					</ul>
				</nav>
           </div>
        </div>
	
	
	<img id="img" src="img/4.jpg"/>
		<div id="background"></div>
		<div id="upper">
			<h2 class="title">软件工程人员管理系统</h2>

		<table border='2' align="left">
       <tr>
          
           	<th>ID</th>
			<th>姓名</th>
			<th>密码</th>
		
           
      </tr>
        <%
          
            UserDA.getUser();  
            for(User tl:UserDA.list)
            {%>
           <tr>
               <td><%=tl.getUserID() %></td>
               <td><%=tl.getUserName() %></td>
               <td><%=tl.getPassword() %></td>
		     	<td><a href="#" id=<%=tl.getUserID()%> onclick="deleteThis(this.id,this.name)" />删除</a></td>
           
             
           <script>
           function deleteThis(value,value2)
           {
          //  alert(value);
           // alert(value2);
            window.location.href="UnknownUser.jsp?id="+value;
           }
           </script>
          
           </tr>
             <%}
             
            UserDA.list=new ArrayList<User>();
        %>
         
               	<td><a href="#"  onclick="window.location.href='/oop/Choose.jsp'" />返回</a></td>
          
   </table>
	
			
			
			
			
			
		</div>
		
	</body>
</html>
