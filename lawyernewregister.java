/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Database;

import static Database.LawyerRegister.generateRandomPassword;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

/**
 *
 * @author Fabhost
 */
@WebServlet(name = "lawyernewregister", urlPatterns = {"/lawyernewregister"})
public class lawyernewregister extends HttpServlet {

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
            out.println("<title>Servlet lawyernewregister</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet lawyernewregister at " + request.getContextPath() + "</h1>");
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
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String city = request.getParameter("city");
        String password = request.getParameter("password");
        String category = request.getParameter("category");
        
        JOptionPane.showMessageDialog(null, username+" "+email+" "+phone+" "+city+" "+password+" "+category);

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
            
             PreparedStatement st1 = con.prepareStatement("select * from lawyers where email=?");
             
            st1.setString(1, email);
            
            ResultSet rs1= st1.executeQuery();
            
            if (rs1.next()) {
                
                  out.println("<script type='text/javascript'>");
                out.println("alert('Email Exist')");
                out.println("window.location='lawyernewregister.html'");
                out.println("</script>");
                
            }else{
            
            PreparedStatement st = con.prepareStatement("insert into lawyers(username,email,phone,city,password,category,created,lastlogin) values(?,?,?,?,?,?,?,?)");
            st.setString(1, username);
            st.setString(2, email);
            st.setString(3, phone);
            st.setString(4, city);
            st.setString(5, password);
            st.setString(6, category);
            st.setString(7, "" + today);
            st.setString(8, "" + today);

            HttpSession session = request.getSession();
            int rs = st.executeUpdate();

            if (rs > 0) {

                session.setAttribute("email", email);

                out.println("<script type='text/javascript'>");
//                    out.println("alert('Email Exist')");
                out.println("window.location='Addbarcouncil.jsp'");
                out.println("</script>");

//                response.sendRedirect("Addbarcouncil.jsp");
            } 
//            else {
//
//                out.println("<script type='text/javascript'>");
//                out.println("alert('Registration Failed')");
//                out.println("window.location='lawyernewregister.jsp'");
//                out.println("</script>");

            }

        } catch (SQLException ex) {
//            Logger.getLogger(LawyerRegister.class.getName()).log(Level.SEVERE, null, ex);

JOptionPane.showMessageDialog(null, ex);
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

}
