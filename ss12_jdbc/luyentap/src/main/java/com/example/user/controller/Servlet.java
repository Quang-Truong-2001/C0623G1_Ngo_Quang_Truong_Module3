package com.example.user.controller;

import com.example.user.model.User;
import com.example.user.service.IServiceUser;
import com.example.user.service.impl.ServiceUserImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Servlet", value = "/servlet")
public class Servlet extends HttpServlet {
    private static final IServiceUser service=new ServiceUserImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action=request.getParameter("action");
        if(action==null){
            action="";
        }
        switch (action){
            case "save":
                showFormSave(request,response);
                break;
            case "edit":
                showFormEdit(request,response);
                break;
            case "delete":
                delete(request,response);
                break;
            default:
                getList(request,response);

        }
    }
    private void delete(HttpServletRequest request,HttpServletResponse response) throws IOException {
        int id= Integer.parseInt(request.getParameter("id"));
        service.delete(id);
        response.sendRedirect("/servlet");
    }
    private void getList(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("list",service.getList());
        RequestDispatcher requestDispatcher=request.getRequestDispatcher("/list.jsp");
        requestDispatcher.forward(request,response);
    }
    private void showFormSave(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher=request.getRequestDispatcher("/save.jsp");
        requestDispatcher.forward(request,response);
    }
    private void showFormEdit(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        int id= Integer.parseInt(request.getParameter("id"));
        request.setAttribute("user",service.detail(id));
        RequestDispatcher requestDispatcher=request.getRequestDispatcher("/edit.jsp");
        requestDispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action=request.getParameter("action");
        if(action==null){
            action="";
        }
        switch (action){
            case "save":
                save(request,response);
                break;
            case "edit":
                edit(request,response);
                break;
        }
    }
    private void edit(HttpServletRequest request,HttpServletResponse response) throws IOException {
        int id= Integer.parseInt(request.getParameter("id"));
        String name=request.getParameter("name");
        String email=request.getParameter("email");
        String country=request.getParameter("country");
        User user=new User(id, name, email, country);
        service.update(user);
        response.sendRedirect("/servlet");
    }
    private void save(HttpServletRequest request,HttpServletResponse response) throws IOException {
        String name=request.getParameter("name");
        String email=request.getParameter("email");
        String country=request.getParameter("country");
        User user=new User(name,email,country);
        service.save(user);
        response.sendRedirect("/servlet");
    }
}
