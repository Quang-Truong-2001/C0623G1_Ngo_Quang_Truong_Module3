package com.example.user.controller;

import com.example.user.model.User;
import com.example.user.service.IServiceUser;
import com.example.user.service.impl.ServiceUserImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "servlet", value = "/servlet-user")
public class ServletUser extends HttpServlet {
    private final static IServiceUser service=new ServiceUserImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action=request.getParameter("action");
        if(action==null){
            action="";
        }
        switch (action){
            case "save":
                showFormSave(request,response);
                break;
            case "update":
                showFormUpdate(request,response);
                break;
            case "delete":
                try {
                    delete(request,response);
                } catch (Exception e) {
                    throw new RuntimeException(e);
                }
                break;
            default:
                getlist(request,response);
        }
    }
    private void getlist(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("list",service.getList());
        RequestDispatcher requestDispatcher=request.getRequestDispatcher("/list.jsp");
        requestDispatcher.forward(request,response);
    }
    private void showFormSave(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher=request.getRequestDispatcher("/save.jsp");
        requestDispatcher.forward(request,response);
    }
    private void showFormUpdate(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        User user = service.detail(id);
        if(user==null){
            RequestDispatcher requestDispatcher=request.getRequestDispatcher("/error.jsp");
            requestDispatcher.forward(request,response);
        }
        request.setAttribute("user", user);
        RequestDispatcher requestDispatcher=request.getRequestDispatcher("/update.jsp");
        requestDispatcher.forward(request,response);
    }
    private void delete(HttpServletRequest request,HttpServletResponse response) throws Exception {
        int id= Integer.parseInt(request.getParameter("id"));
        if(service.detail(id)==null){
            RequestDispatcher requestDispatcher=request.getRequestDispatcher("/error.jsp");
            requestDispatcher.forward(request,response);
        } else {
            service.delete(id);
            response.sendRedirect("/servlet-user");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action=request.getParameter("action");
        if(action==null){
            action="";
        }
        switch (action){
            case "save":
                save(request,response);
                break;
            case "update":
                try {
                    update(request,response);
                } catch (Exception e) {
                    throw new RuntimeException(e);
                }
                break;
            case "find":
                find(request,response);
                break;
        }
    }
    private void save(HttpServletRequest request,HttpServletResponse response) throws IOException {
        String name=request.getParameter("name");
        String email=request.getParameter("email");
        String country=request.getParameter("country");
        User user=new User(name,email,country);
        service.save(user);
        response.sendRedirect("/servlet-user");
    }
    private void find(HttpServletRequest request,HttpServletResponse response) throws IOException {
        String country=request.getParameter("country");
        request.setAttribute("list",service.find(country));
        RequestDispatcher requestDispatcher=request.getRequestDispatcher("/list.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        }
    }
    private void update(HttpServletRequest request,HttpServletResponse response) throws Exception {
        int id= Integer.parseInt(request.getParameter("id"));
        String name=request.getParameter("name");
        String email=request.getParameter("email");
        String country=request.getParameter("country");
        User user=new User(id, name, email, country);
        service.update(user);
        response.sendRedirect("/servlet-user");
    }
}
