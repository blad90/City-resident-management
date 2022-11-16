package com.bladbaez.web.controller;

import com.bladbaez.web.db.ResidentDbUtil;
import com.bladbaez.web.model.Resident;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
            try {
                String theCommand = request.getParameter("command");
                if(theCommand == null){
                    theCommand = "LIST";
                }
                switch (theCommand){
                    case "ADD":
                        addResident(request,response);
                        break;
                    case "LOAD":
                        loadResident(request,response);
                        break;
                    case "UPDATE":
                        updateResident(request,response);
                        break;
                    case "DELETE":
                        deleteResident(request,response);
                        break;
                    default:
                        listResidents(request,response);
                }
            }catch (Exception e) {
                throw new RuntimeException(e);
            }
    }

    private void deleteResident(HttpServletRequest request, HttpServletResponse response) throws ServletException, SQLException, IOException{
        String theResidentId = request.getParameter("residentId");
        residentDbUtil.deleteResident(theResidentId);
        listResidents(request,response);
        response.sendRedirect("list-residents.jsp");
    }
    private void loadResident(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String theResidentId = request.getParameter("residentId");

        Resident resident = residentDbUtil.getResident(theResidentId);

        request.setAttribute("THE_RESIDENT", resident);

        RequestDispatcher dispatcher = request.getRequestDispatcher("update-resident-form.jsp");
        dispatcher.forward(request,response);
    }

    private void updateResident(HttpServletRequest request, HttpServletResponse response) throws ServletException, SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("residentId"));
        String name = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
//        String dateOfBirth = request.getDateHeader("dateOfBirth");
        String town = request.getParameter("town");
        String province = request.getParameter("province");
        String country = request.getParameter("country");

        Resident resident = new Resident(id,name,lastName,town,province,country);
        residentDbUtil.updateResident(resident);

        listResidents(request,response);
    }

    private void listResidents(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<Resident> residents = residentDbUtil.getResidents();

        request.getSession().setAttribute("RESIDENT_LIST", residents);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/list-residents.jsp");

        dispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    private void addResident(HttpServletRequest request, HttpServletResponse response)  {
//        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
//        String dateOfBirth = request.getDateHeader("dateOfBirth");
        String town = request.getParameter("town");
        String province = request.getParameter("province");
        String country = request.getParameter("country");

        Resident theResident = new Resident((int) (Math.random() * 1000), name,lastName,town,province,country);
        residentDbUtil.addResident(theResident);
    }
}
