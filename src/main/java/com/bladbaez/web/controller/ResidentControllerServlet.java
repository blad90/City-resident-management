package com.bladbaez.web.controller;

import com.bladbaez.web.db.ResidentDbUtil;
import com.bladbaez.web.domain.Resident;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
@WebServlet(name = "ResidentServlet",urlPatterns = {"/"})
public class ResidentControllerServlet extends HttpServlet {
    ResidentDbUtil residentDbUtil;
    @Override
    public void init() throws ServletException {
        super.init();
        residentDbUtil = new ResidentDbUtil();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            try {
                List<Resident> residents = residentDbUtil.getResidents();

                request.getSession().setAttribute("RESIDENT_LIST", residents);

                RequestDispatcher dispatcher = request.getRequestDispatcher("list-residents.jsp");

                dispatcher.forward(request, response);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            System.out.println("Fetching list of residents...");
    }

    private void listResidents(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<Resident> residents = residentDbUtil.getResidents();

        request.getSession().setAttribute("RESIDENT_LIST", residents);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/list-residents.jsp");

        dispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
