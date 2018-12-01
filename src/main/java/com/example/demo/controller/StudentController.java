package com.example.demo.controller;

import com.example.demo.entity.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Controller
public class StudentController  {
    @Autowired
    JdbcTemplate jdbcTemplate;

    @RequestMapping(value = "/studentSearch",method = {RequestMethod.POST,RequestMethod.GET})
    public String SearchStudent(HttpServletRequest request, HttpServletResponse response){
        String studentName = request.getParameter("studentName");
        String string=String.format("select * from students where name = '%s'",studentName);
        System.out.println("sql: "+string);
        try{
            Student student = jdbcTemplate.queryForObject(string, new RowMapper<Student>() {
                @Override
                public Student mapRow(ResultSet resultSet, int i) throws SQLException {
                    Student result = new Student();
                    if(resultSet.wasNull())
                        return null;
                    result.name=resultSet.getString("name");
                    result.ID=resultSet.getString("ID");
                    return result;
                }

            });
            if(student!=null){
                System.out.println(student.ID);
                Student.studentArrayList.add(student);
            }
        }
        catch (Exception e){

        }
        return "SearchResult";
    }

    @RequestMapping(value = "/studentAdd",method = {RequestMethod.POST,RequestMethod.GET})
    public String AddStudent(HttpServletRequest request,HttpServletResponse response){
        String studentName=request.getParameter("studentName");
        String studentID =request.getParameter("studentID");

        System.out.println("新名"+studentName);
        System.out.println("新ID"+studentID);

        String sql=String.format("insert into students values('%s','%s')",studentName,studentID);
        jdbcTemplate.update(sql);
        try{
            response.sendRedirect("Delete.jsp?operationType=add");
        }catch (Exception e){}
        return "Delete";
    }

    @RequestMapping(value = "/studentDelete/{ID}",method = {RequestMethod.POST,RequestMethod.GET})
    public String DeleleStudent(@PathVariable("ID") String key,HttpServletRequest request,HttpServletResponse response){
        try{
            String sql=String.format("delete from students where ID='%s'",key);
            jdbcTemplate.update(sql);
            response.sendRedirect("../Delete.jsp?operationType=delete");
        }catch (Exception e){}
        return "Delete";
    }

    //获取选择的学生信息，并传输到更新页面
    @RequestMapping(value = "/studentUpdate/{ID}",method = {RequestMethod.POST,RequestMethod.GET})
    public String UpdateStudent(@PathVariable("ID") String key,HttpServletResponse response)
    {
        String studentID = key;
        System.out.println("update ID: "+studentID);
        String string=String.format("select * from students where ID='%s'",studentID);
        try{
            Student student = jdbcTemplate.queryForObject(string, new RowMapper<Student>() {
                @Override
                public Student mapRow(ResultSet resultSet, int i) throws SQLException {
                    Student result = new Student();
                    if(resultSet.wasNull())
                        return null;
                    result.name=resultSet.getString("name");
                    result.ID=resultSet.getString("ID");
                    return result;
                }
            });
            System.out.println("update student name: "+student.name);
            response.sendRedirect(String.format("../Update.jsp?studentName=%s&studentID=%s",student.name,student.ID));
        }
        catch (Exception e){

        }
        return "Update";
    }

    //更改信息页面点击提交后的响应
    @RequestMapping(value = "/studentUpdateDetail",method = {RequestMethod.POST,RequestMethod.GET})
    public String UpdateStudentDetail(HttpServletRequest request,HttpServletResponse response)
    {
        try{
            String studentName=request.getParameter("studentName");
            String studentID=request.getParameter("studentID");
            System.out.println("更新后的名字: "+studentName);
            String sql=String.format("update students set name='%s' where ID='%s'",studentName,studentID);
            jdbcTemplate.update(sql);
            response.sendRedirect("Delete.jsp?operationType=update");

        }
        catch (Exception e){}
        return "Delete";
    }

    //获取多条数据
    @RequestMapping("/test")
    public String SearchStudents(){
        String sql=String.format("select * from students");
        List<Student> studentList = jdbcTemplate.query(sql, new RowMapper<Student>() {
            @Override
            public Student mapRow(ResultSet resultSet, int i) throws SQLException {
                Student student = new Student();
                student.name = resultSet.getString("name");
                student.ID = resultSet.getString("ID");
                return student;
            }
        });

        for (int i = 0; i < studentList.size(); i++) {
             Student.studentArrayList.add(studentList.get(i));
        }
        return "SearchResult";
    }



}
