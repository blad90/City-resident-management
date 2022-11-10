package com.bladbaez.web;

import java.io.*;
import java.sql.SQLException;
import java.util.List;

import com.bladbaez.web.db.ResidentDbUtil;
import com.bladbaez.web.domain.Resident;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import javax.annotation.Resource;
import javax.sql.DataSource;

@WebServlet(name = "residentControllerServlet", value = "/ResidentControllerServlet")
public class ResidentControllerServlet extends HttpServlet {
    private ResidentDbUtil residentDbUtil;

    @Resource(name="jdbc/City-resident management")
    private DataSource dataSource;

    public void init() throws ServletException {
        super.init();

        // create the resident db util ... and pass in the connection pool / datasource
        try {
            residentDbUtil = new ResidentDbUtil(dataSource);
        } catch (Exception e){
            throw new ServletException(e);
        }
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
       // read the "command" parameter
        try {
            String theCommand = request.getParameter("command");
            if(theCommand == null){
                theCommand = "LIST";
            }

            // route to the appropriate method
            switch (theCommand){
                case "LIST":
                    listResidents(request,response);
                    break;
            }
        } catch (ServletException | SQLException e) {
            throw new RuntimeException(e);
        }
    }

    private void listResidents(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        // get residents from the db util
        List<Resident> residents = residentDbUtil.getResidents();

        // add residents to the request
        request.setAttribute("RESIDENT_LIST", residents);

        // send to JSP page (view)
        RequestDispatcher dispatcher = request.getRequestDispatcher("list-residents.jsp");
        dispatcher.forward(request,response);
    }

    public void destroy() {
    }
}