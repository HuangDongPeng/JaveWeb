package com.example.demo.controller;

import com.example.demo.DataBaseController;
import com.example.demo.entity.Student;
import com.mysql.cj.protocol.Resultset;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.ResultSet;
import java.sql.SQLException;

@Controller
public class StudentController  {
    @Autowired
    JdbcTemplate jdbcTemplate;

    @RequestMapping(value = "/studentSearch",method = {RequestMethod.POST,RequestMethod.GET})
    public String SearchStudent(HttpServletRequest request, HttpServletResponse response){
        String studentName = request.getParameter("studentName");
        String string=String.format("select * from students where name = '%s'",studentName);
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
        return "Search";
    }

    @RequestMapping(value = "/studentDelete",method = {RequestMethod.POST,RequestMethod.GET})
    public String DeleleStudent(HttpServletRequest request,HttpServletResponse response){
        String key = request.getParameter("name");
        String sql=String.format("delete from students where ID='%s'",key);
        jdbcTemplate.update(sql);
        return "Delete";
    }


    //获取选择的学生信息，并传输到更新页面
    @RequestMapping(value = "/studentUpdate/{name}",method = {RequestMethod.POST,RequestMethod.GET})
    public String UpdateStudent(@PathVariable("name") String key,HttpServletResponse response)
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
    @RequestMapping(value = "/studentUpdateDetail}",method = {RequestMethod.POST,RequestMethod.GET})
    public String UpdateStudentDetail(HttpServletRequest request)
    {
        String studentName=request.getParameter("studentName");
        String studentID=request.getParameter("studentID");
        System.out.println("更新后的名字: "+studentName);
        String sql=String.format("update students set name='%s' where ID='%s'",studentName,studentID);
        jdbcTemplate.update(sql);
        return "Search";
    }



}
