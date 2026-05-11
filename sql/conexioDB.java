package controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexioBD {
    private static final String URL = "jdbc:mysql://127.0.0.1:3306/space_defender";
    private static final String USER = "root";
    private static final String PASS = "@Ap0512712021@";

    public static Connection conectar() {
        Connection conn = null;
        try {
            conn = DriverManager.getConnection(URL, USER, PASS);
            System.out.println("Connexió feta amb èxit!");
        } catch (SQLException e) {
            System.out.println("Error en la connexió: " + e.getMessage());
        }
        return conn;
    }
}