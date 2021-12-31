package com.example.javawcdpracticaltest.controller;

import com.example.javawcdpracticaltest.entity.Phone;
import com.example.javawcdpracticaltest.repository.JpaRepository;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;

public class CreatePhoneServlet extends HttpServlet {
    private JpaRepository<Phone> phoneJpaRepository = new JpaRepository<>(Phone.class);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/admin/phone/addphone.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            req.setCharacterEncoding("UTF-8");
            String name = req.getParameter("name");
            String brand = req.getParameter("brand");
            Double price = Double.parseDouble(req.getParameter("price"));
            String description = req.getParameter("description");

            // tạo ra đối tượng của lớp category.
            Phone phone = new Phone(name, brand, price, description);
            if (phone.isValid()) {
                phoneJpaRepository.save(phone);
                resp.sendRedirect("/admin/phone/list");
            } else {
                HashMap<String, String> errors = phone.getErrors();

                req.setAttribute("errors", errors);
                req.setAttribute("phone", phone);
                req.getRequestDispatcher("/admin/phone/addphone.jsp").forward(req, resp);

            }
        } catch (Exception ex) {
            resp.getWriter().println("Bad Request");
            System.out.println(ex.getMessage());
        }
    }
}
