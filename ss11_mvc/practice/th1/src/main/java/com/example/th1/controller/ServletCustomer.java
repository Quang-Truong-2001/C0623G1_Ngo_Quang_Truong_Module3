package com.example.th1.controller;

import com.example.th1.model.Customer;
import com.example.th1.service.impl.CustomerServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "servletCustomer", value = "/servlet-customer")
public class ServletCustomer extends HttpServlet {
    private final CustomerServiceImpl customerService=new CustomerServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action=request.getParameter("action");

        if(action==null){
            action="";
        }
        switch (action){
            case "get":
                getCustomer(request,response);
                break;
            case "create":
                createCustomer(request,response);
                break;

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    private void getCustomer(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        List<Customer> list=this.customerService.findAll();
        RequestDispatcher requestDispatcher=request.getRequestDispatcher("/index.jsp");
        request.setAttribute("list",list);
        requestDispatcher.forward(request,response);
    }
    private void createCustomer(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        String name=request.getParameter("name");
        String email=request.getParameter("email");
        String address=request.getParameter("address");
        int id=(int) (Math.random()*1000);

        Customer customer=new Customer(id, name, email, address);
        this.customerService.addOne(customer);
        RequestDispatcher requestDispatcher=request.getRequestDispatcher("/create.jsp");
        request.setAttribute("message","New customer was created");
        requestDispatcher.forward(request,response);
    }
}
