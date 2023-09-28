package com.example.product_manager.controller;

import com.example.product_manager.model.Product;
import com.example.product_manager.service.IProductService;
import com.example.product_manager.service.impl.ProductServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Servlet", value = "/servlet")
public class Servlet extends HttpServlet {
    private static final IProductService service = new ProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "view":
                getListProduct(request, response);
                break;
            case "save":
                showFormCreate(request, response);
                break;
            case "edit":
                showFormEdit(request, response);
                break;
            case "delete":
                delete(request, response);
                break;


        }
    }

    private void getListProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("list", service.getList());
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/list.jsp");
        requestDispatcher.forward(request, response);
    }

    private void showFormCreate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/save.jsp");
        requestDispatcher.forward(request, response);
    }

    private void showFormEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = service.detail(id);
        request.setAttribute("product", product);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/edit.jsp");
        requestDispatcher.forward(request, response);
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        service.delete(id);
        response.sendRedirect("/servlet?action=view");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "save":
                saveProduct(request, response);
                break;
            case "edit":
                editProduct(request, response);
                break;
            case "find":
                findProduct(request, response);
                break;


        }
    }

    private void saveProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("name");
        Double price = Double.valueOf(request.getParameter("price"));
        String description = request.getParameter("description");
        String producer = request.getParameter("producer");
        Product product = new Product(name, price, description, producer);
        service.save(product);
        response.sendRedirect("/servlet?action=view");
    }

    private void editProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        Double price = Double.valueOf(request.getParameter("price"));
        String description = request.getParameter("description");
        String producer = request.getParameter("producer");

        Product product = service.detail(id);

        product.setName(name);
        product.setPrice(price);
        product.setDescription(description);
        product.setProducer(producer);

        service.update(id, product);
        response.sendRedirect("/servlet?action=view");
    }

    private void findProduct(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String find = request.getParameter("find");
        request.setAttribute("find", service.find(find));
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/find.jsp");
        requestDispatcher.forward(request, response);
    }
}
