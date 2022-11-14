package com.bladbaez.web.db;

import com.bladbaez.web.controller.ResidentControllerServlet;
import com.bladbaez.web.domain.Resident;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ResidentDbUtil {
    private static final String JDBC_DRIVER = "org.h2.Driver";
    private static final String JDBC_URL = "jdbc:h2:C:/Users/bbaez/IdeaProjects/City-resident-management/default";
    private static final String USER = "test";
    private static final String PASSWORD = "test";

    public ResidentDbUtil(){}
    public static void main(String[] args) throws Exception {
        ResidentDbUtil residentDbUtil = new ResidentDbUtil();

        System.out.println(residentDbUtil.getResidents());
        ResidentControllerServlet residentControllerServlet = new ResidentControllerServlet();
        residentControllerServlet.init();
    }

    public List<Resident> getResidents() throws SQLException {
        List<Resident> residents = new ArrayList<>();

        // Step 1: Establish a connection
        System.out.println("Connecting...");
        Connection connection = DriverManager.getConnection(JDBC_URL,USER,PASSWORD);
        Statement stmt = connection.createStatement();
        String sql = "SELECT * FROM crschema.residents";
        ResultSet rs = stmt.executeQuery(sql);

        // process result set
        while(rs.next()) {
            // retrieve data from result set row
            int id = rs.getInt("id");
            String firstName = rs.getString("first_name");
            String lastName = rs.getString("last_name");
            Date dateOfBirth = rs.getDate("date_of_birth");
            String town = rs.getString("town");
            String province = rs.getString("province");
            String country = rs.getString("country");
            System.out.println(id + " -- " + firstName + " -- " + lastName + " -- " + dateOfBirth + " -- " + town + " -- " + province + " -- " + country);

            // create new resident object
            Resident tempResident = new Resident(id, firstName, lastName, dateOfBirth, town, province, country);

            // add it to the list of students
            residents.add(tempResident);
        }
        stmt.close();
        connection.close();
        System.out.println("# of Residents: " + residents.size());
        return residents;
    }
}
