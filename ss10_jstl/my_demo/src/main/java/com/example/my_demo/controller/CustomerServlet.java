package com.example.my_demo.controller;

import com.example.my_demo.model.Customer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "")
public class CustomerServlet extends HttpServlet {
    private static List<Customer> listCustomer;
    static {
        listCustomer =new ArrayList<>();
        listCustomer.add(new Customer("Mai Văn Hoàn","1983-08-20","Hà Nội","https://i.pinimg.com/236x/31/82/d5/3182d53b9a5b1932a3108de4338c951b.jpg"));
        listCustomer.add(new Customer("Nguyễn Văn Nam","1983-08-20","Hà Nội","https://i.pinimg.com/236x/b0/1a/4d/b01a4dbca41100e90a188eed6fc25890.jpg"));
        listCustomer.add(new Customer("Nguyễn thái hòa","1983-08-20","Hà Nội","https://i.pinimg.com/236x/a8/19/96/a81996c6ccf887bcb2be207eef454f07.jpg"));
        listCustomer.add(new Customer("Trần Đăng Khoa","1983-08-20","Hà Nội","https://i.pinimg.com/236x/f1/43/64/f1436415a2a208043bdef80c73d66b4a.jpg"));
        listCustomer.add(new Customer("Nguyễn Đình Thi","1983-08-20","Hà Nội","https://i.pinimg.com/236x/1a/c3/44/1ac34432d05de58663dd21adaecff7fb.jpg"));
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("listCustomer",listCustomer);
        RequestDispatcher requestDispatcher=request.getRequestDispatcher("/index.jsp");
        requestDispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
