package com.bladbaez.web.db;

import com.bladbaez.web.domain.Resident;

import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ResidentDbUtil {
    private DataSource dataSource;

    public ResidentDbUtil(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    public List<Resident> getResidents() throws SQLException {
        List<Resident> residents = new ArrayList<>();

        Connection myConn = null;
        Statement myStmt = null;
        ResultSet myRs = null;

        try {
            // get a connection
            myConn = dataSource.getConnection();

            // create a sql statement
            String sql = "SELECT * FROM residents";
            myStmt = myConn.createStatement();

            // execute query
            myRs = myStmt.executeQuery(sql);

            // process result set
            while(myRs.next()){
                // retrieve data from result set row
                int id = myRs.getInt("id");
                String firstName = myRs.getString("first_name");
                String lastName = myRs.getString("last_name");
                Date dateOfBirth = myRs.getDate("date_of_birth");
                String town = myRs.getString("town");
                String province = myRs.getString("province");
                String country = myRs.getString("country");

                // create new resident object
                Resident tempResident = new Resident(id,firstName,lastName,dateOfBirth,town,province,country);

                // add it to the list of students
                residents.add(tempResident);
            }
                return residents;
        } finally {
            // close JDBC objects
            if(myRs != null){
                myRs.close();
            }
            if(myStmt != null){
                myStmt.close();
            }
            if(myConn != null){
                myConn.close();
            }
        }
    }
}
