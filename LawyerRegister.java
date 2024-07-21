/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Database;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

/**
 *
 * @author Fabhost
 */
public class LawyerRegister extends HttpServlet {

    int passwordLength = 12; // Specify the desired password length
    String generatedPassword = generateRandomPassword(passwordLength);

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LawyerRegister</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LawyerRegister at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PrintWriter out = response.getWriter();
//        processRequest(request, response);

        String username = request.getParameter("Username");
        String email = request.getParameter("email");
        String city = request.getParameter("city");
        String age = request.getParameter("age");

        String passowrd = generateRandomPassword(12);

        GmailEmailSender.sendGmai(email, passowrd);

        // Get today's date
        LocalDate today = LocalDate.now();

        // Print today's date
        System.out.println("Today's Date: " + today);

//         // Step 1: Convert LocalDate to LocalDateTime by adding a time component (midnight)
//        LocalDateTime localDateTime = today.atStartOfDay();
//
//        // Step 2: Convert LocalDateTime to Date
//         Date date = Date.from(localDateTime.atZone(ZoneId.systemDefault()).toInstant());
        Connection con = Db.connect();
        try {

            PreparedStatement st1 = con.prepareStatement("select * from clients where email=?");

            st1.setString(1, email);

            ResultSet rs1 = st1.executeQuery();

            if (rs1.next()) {

                out.println("<script type='text/javascript'>");
                out.println("alert('Email Exist')");
                out.println("window.location='Clients.html'");
                out.println("</script>");

            }

            PreparedStatement st = con.prepareStatement("insert into clients(name,email,city,age,created,lastlogin,password) values(?,?,?,?,?,?,?)");
            st.setString(1, username);
            st.setString(2, email);
            st.setString(3, city);
            st.setString(4, age);
            st.setString(5, "" + today);
            st.setString(6, "" + today);
            st.setString(7, passowrd);

            int rs = st.executeUpdate();

            if (rs > 0) {

                response.sendRedirect("Clients.html");

            }

        } catch (SQLException ex) {
            Logger.getLogger(LawyerRegister.class.getName()).log(Level.SEVERE, null, ex);

            out.print(ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    public static String generateRandomPassword(int length) {
        String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()-_=+";

        SecureRandom random = new SecureRandom();
        StringBuilder password = new StringBuilder();

        for (int i = 0; i < length; i++) {
            int randomIndex = random.nextInt(characters.length());
            char randomChar = characters.charAt(randomIndex);
            password.append(randomChar);
        }

        return password.toString();
    }

}
