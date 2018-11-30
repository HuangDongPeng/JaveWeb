package com.example.demo.controller;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteServlet")
public class deleteStudent {
    protected void doPost(HttpServletRequest request, HttpServletResponse response){
        System.out.println("delete");
    }

}
