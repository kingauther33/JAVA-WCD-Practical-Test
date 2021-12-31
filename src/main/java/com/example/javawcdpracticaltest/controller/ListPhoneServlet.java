package com.example.javawcdpracticaltest.controller;

import com.example.javawcdpracticaltest.entity.Phone;
import com.example.javawcdpracticaltest.repository.JpaRepository;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class ListPhoneServlet extends HttpServlet {
    private JpaRepository<Phone> phoneJpaRepository = new JpaRepository<>(Phone.class);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Phone> listByPage = phoneJpaRepository.findAll();

        req.setAttribute("list", listByPage);
        req.getRequestDispatcher("/admin/phone/listphone.jsp").forward(req, resp);
    }

}
