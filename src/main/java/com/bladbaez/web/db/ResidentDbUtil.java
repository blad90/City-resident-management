package com.bladbaez.web.db;

import com.bladbaez.web.controller.ResidentControllerServlet;
import com.bladbaez.web.model.Resident;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ResidentDbUtil {
    private static final String JDBC_DRIVER = "org.h2.Driver";
    private static final String JDBC_URL = "jdbc:h2:C:/Users/bbaez/IdeaProjects/City-resident-management/default";
    private static final String USER = "test";
    private static final String PASSWORD = "test";

    public ResidentDbUtil() {
    }

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
        Connection connection = DriverManager.getConnection(JDBC_URL, USER, PASSWORD);
        Statement stmt = connection.createStatement();
        String sql = "SELECT * FROM crschema.residents";
        ResultSet rs = stmt.executeQuery(sql);

        // process result set
        while (rs.next()) {
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
        close(connection,stmt,null);
        System.out.println("# of Residents: " + residents.size());
        return residents;
    }

    public void addResident(Resident theResident) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            connection = DriverManager.getConnection(JDBC_URL, USER, PASSWORD);

            String sql = "INSERT INTO crschema.residents "
                    + "(id, first_name, last_name, date_of_birth, town, province, country) "
                    + "values(?, ?, ?, ?, ?, ?, ?)";
            preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setInt(1, (int) (Math.random() * 1000));
            preparedStatement.setString(2, theResident.getFirstName());
            preparedStatement.setString(3, theResident.getLastName());
            preparedStatement.setDate(4, (Date) theResident.getDateOfBirth());
            preparedStatement.setString(5, theResident.getTown());
            preparedStatement.setString(6, theResident.getProvince());
            preparedStatement.setString(7, theResident.getCountry());

            preparedStatement.execute();

            close(connection, preparedStatement, null);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    private void close(Connection myConn, Statement myStmt, ResultSet myRs) {
        try {
            if (myRs != null) {
                myRs.close();
            }

            if (myStmt != null) {
                myStmt.close();
            }

            if (myConn != null) {
                myConn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateResident(Resident resident) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            connection = DriverManager.getConnection(JDBC_URL, USER, PASSWORD);

            String sql = "UPDATE crschema.residents "
                    + "SET first_name = ?, last_name = ?, date_of_birth=?, "
                    + "town=?, province=?, country=? "
                    + "WHERE id=?";
            preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setString(1, resident.getFirstName());
            preparedStatement.setString(2, resident.getLastName());
            preparedStatement.setDate(3, (Date) resident.getDateOfBirth());
            preparedStatement.setString(4, resident.getTown());
            preparedStatement.setString(5, resident.getProvince());
            preparedStatement.setString(6, resident.getCountry());
            preparedStatement.setInt(7, resident.getId());

            preparedStatement.execute();

            close(connection, preparedStatement, null);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public Resident getResident(String theResidentId) throws Exception {
        Resident theResident = null;
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        int residentId;

        try {
            residentId = Integer.parseInt(theResidentId);
            connection = DriverManager.getConnection(JDBC_URL, USER, PASSWORD);
            String sql = "SELECT * FROM crschema.residents WHERE id=?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, residentId);
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                int id = resultSet.getInt("id");
                String firstName = resultSet.getString("first_name");
                String lastName = resultSet.getString("last_name");
                Date dateOfBirth = resultSet.getDate("date_of_birth");
                String town = resultSet.getString("town");
                String province = resultSet.getString("province");
                String country = resultSet.getString("country");

                theResident = new Resident(id, firstName, lastName, dateOfBirth, town, province, country);
            }
            return theResident;
        } finally {
            close(connection,preparedStatement,resultSet);
        }
    }

    public void deleteResident(String theResidentId) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try {
            int residentId = Integer.parseInt(theResidentId);
            connection = DriverManager.getConnection(JDBC_URL, USER, PASSWORD);
            String sql = "DELETE FROM crschema.residents WHERE id=?";
            preparedStatement.setInt(1, residentId);
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.executeUpdate(sql);
        } finally {
            close(connection,preparedStatement,null);
        }
    }
}