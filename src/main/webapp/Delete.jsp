<%@ page language="java" pageEncoding="UTF-8" %>
<html>
  <head>
   <title>propting inforemation</title>
  </head>
  <body>
   <script>
       var operationType = '<%=request.getParameter("operationType")%>';
           if(operationType==='delete')
           {
               alert("删除成功");
           }
           else if(operationType==='add'){
               alert("添加成功");
           }
           else if(operationType==='update')
           {
               alert("修改成功");
           }
       window.location.href="../Search.jsp";

   </script>
  </body>
</html>
