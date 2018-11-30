package com.example.demo;

import com.example.demo.entity.Student;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import sun.security.krb5.internal.PAForUserEnc;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public class DataBaseController {

    public static JdbcTemplate jdbcTemplate;
    public static Student Find(String studentName){
        System.out.println("search student name: "+studentName);
        String sql = "select * from students where name='asdasd'";
        Student student = jdbcTemplate.queryForObject(sql, new RowMapper<Student>() {
            @Override
            public Student mapRow(ResultSet resultSet, int i) throws SQLException {
                Student Result = new Student();
                Result.name = resultSet.getString("name");
                Result.ID = resultSet.getString("ID");
                return Result;
            }
        });
        return student;
    }

    public void Add(){

    }

    public void Delete(){

    }

    public void Set()
    {

    }

}
