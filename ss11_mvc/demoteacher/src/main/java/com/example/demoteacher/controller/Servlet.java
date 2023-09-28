package com.example.demoteacher.controller;

import com.example.demoteacher.model.Student;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "Servlet", value = "/student-servlet")
public class Servlet extends HttpServlet {
    private static List<Student> studentList;
    static {
        studentList = new ArrayList<>();
        studentList.add(new Student(6,"<p style='color:red'>Trường</p>", true, 5));
        studentList.add(new Student(7,"Duy", true, 6));
        studentList.add(new Student(8,"Ly", false, 7));
        studentList.add(new Student(9,"Loan", false, 8));
        studentList.add(new Student(10,"Công", true, 4));
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action=request.getParameter("action");
        if(action==null){
            action="";
        }
        switch (action){
            case "create":
                showFormCreate(request,response);
                break;
            default:
                showListStudent(request,response);

        }
    }
    private void showListStudent(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("studentList",studentList);
        RequestDispatcher requestDispatcher
                = request.getRequestDispatcher("/list.jsp");
        requestDispatcher.forward(request, response);
    }

    private void showFormCreate(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher requestDispatcher1
                = request.getRequestDispatcher("/create.jsp");
        requestDispatcher1.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action=request.getParameter("action");
        if(action==null){
            action="";
        }
        switch (action){
            case "create":
                create(request,response);

        }
    }
    private void create(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        boolean gender = "male".equals(request.getParameter("gender"));
        double point = Double.parseDouble(request.getParameter("point"));
        Student student = new Student(id, name, gender, point);
        studentList.add(student);
        response.sendRedirect("/student-servlet");
    }
}
