/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Database;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
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
@WebServlet(name = "newpassword", urlPatterns = {"/newpassword"})
public class newpassword extends HttpServlet {

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
            out.println("<title>Servlet newpassword</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet newpassword at " + request.getContextPath() + "</h1>");
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
//        processRequest(request, response);

        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession();

        String email = request.getParameter("email");
        String pass1 = request.getParameter("pass1");
        String pass2 = request.getParameter("pass2");


        if (pass1.equals(pass2)) {

            Connection con = Db.connect();
            try {
                PreparedStatement st = con.prepareStatement("select * from clients where email=?");
                st.setString(1, email);

                ResultSet rs = st.executeQuery();
                if (rs.next()) {
                    PreparedStatement st1 = con.prepareStatement("update clients set password=? where email=? ");
                    st1.setString(1, pass1);
                    st1.setString(2, email);

                    int rs1 = st1.executeUpdate();

                    if (rs1 > 0) {

                        out.println("<script type='text/javascript'>");
                        out.println("alert('Password Updated')");
                        out.println("window.location='Clients.html'");
                        out.println("</script>");

                    } else {

                        out.println("<script type='text/javascript'>");
                        out.println("alert('Somthing Went Wrong')");
                        out.println("window.location='Clients.html'");
                        out.println("</script>");

                    }

//            JOptionPane.showMessageDialog(null, "hi");
                } else {

                    out.println("<script type='text/javascript'>");
                    out.println("alert('Email Not Exist')");
                    out.println("window.location='Clients.html'");
                    out.println("</script>");
                }

//            st.executeUpdate();
            } catch (Exception ex) {
//            Logger.getLogger(LawyerRegister.class.getName()).log(Level.SEVERE, null, ex);
                JOptionPane.showMessageDialog(null, ex);
            }
        } else {
            out.println("<script type='text/javascript'>");
            out.println("alert('Password Mismatch')");
            out.println("window.location='Newpassword.jsp'");
            out.println("</script>");

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
