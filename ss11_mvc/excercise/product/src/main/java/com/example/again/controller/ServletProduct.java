package com.example.again.controller;

import com.example.again.model.Product;
import com.example.again.service.IServiceProduct;
import com.example.again.service.impl.ServiceProductImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "servlet", value = "/servlet-product")
public class ServletProduct extends HttpServlet {
    private static IServiceProduct serviceProduct = new ServiceProductImpl();
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
            case "edit":
                showFormEdit(request,response);
                break;
            case "delete":
                delete(request,response);
                break;
            default:
                showList(request,response);

        }
    }
    private void showList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("list", serviceProduct.getList());
        RequestDispatcher requestDispatcher=request.getRequestDispatcher("/list.jsp");
        requestDispatcher.forward(request,response);
    }
    private void showFormCreate(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher=request.getRequestDispatcher("/create.jsp");
        requestDispatcher.forward(request,response);
    }
    private void showFormEdit(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        int id= Integer.parseInt(request.getParameter("id"));
        request.setAttribute("product", serviceProduct.detail(id));
        RequestDispatcher requestDispatcher=request.getRequestDispatcher("/edit.jsp");
        requestDispatcher.forward(request,response);
    }
    private void delete(HttpServletRequest request,HttpServletResponse response) throws IOException {
        int id= Integer.parseInt(request.getParameter("id"));
        serviceProduct.delete(id);
        response.sendRedirect("/servlet-product");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action=request.getParameter("action");
        switch (action){
            case "create":
                create(request,response);
                break;
            case "edit":
                edit(request,response);
                break;
            case "find":
                findProduct(request,response);
                break;
            default:
                break;

        }
    }
    private void create(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id= Integer.parseInt(request.getParameter("id"));
        String name=request.getParameter("name");
        double price= Double.parseDouble(request.getParameter("price"));
        String description=request.getParameter("description");
        String producer=request.getParameter("producer");
        Product product=new Product(id,name,price,description,producer);
        serviceProduct.save(product);
        response.sendRedirect("/servlet-product");
    }
    private void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id= Integer.parseInt(request.getParameter("id"));
        String name=request.getParameter("name");
        double price= Double.parseDouble(request.getParameter("price"));
        String description=request.getParameter("description");
        String producer=request.getParameter("producer");
        Product product=new Product(id,name,price,description,producer);
        serviceProduct.update(id,product);
        response.sendRedirect("/servlet-product");
    }
    private void findProduct(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String find = request.getParameter("find");
        request.setAttribute("find", serviceProduct.find(find));
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/find.jsp");
        requestDispatcher.forward(request, response);
    }
}
