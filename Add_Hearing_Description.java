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
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Fabhost
 */
@WebServlet(name = "Add_Hearing_Description", urlPatterns = {"/Add_Hearing_Description"})
public class Add_Hearing_Description extends HttpServlet {

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
            out.println("<title>Servlet Add_Hearing_Description</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Add_Hearing_Description at " + request.getContextPath() + "</h1>");
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

        String email = request.getParameter("email"),
                description = request.getParameter("description"),
                hearingtype = request.getParameter("hearingtype"),
                clientemail = request.getParameter("clientemail"),
                hearingdate = request.getParameter("hearingdate");

        HttpSession session = request.getSession();

        String post_filename = "" + session.getAttribute("hearing_filename");

        Connection con = Db.connect();
        try {
            PrintWriter out = response.getWriter();

            PreparedStatement st = con.prepareStatement("update hearing set hearingtype=?,hearingdate=?,content=?,clientemail=?  where Lawyeremail=? and filename=?");
            st.setString(1, hearingtype);
            st.setString(2, hearingdate);
            st.setString(3, description);
            st.setString(4, clientemail);
            st.setString(5, email);
            st.setString(6, post_filename);

            int rs = st.executeUpdate();

            if (rs > 0) {

                out.println("<script type='text/javascript'>");
                out.println("alert('Hearing Sent to Admin')");
                out.println("window.location='lawyerhome.jsp'");
                out.println("</script>");

            }else{
                
                  out.println("<script type='text/javascript'>");
                out.println("alert('Somthing Went Wrong')");
                out.println("window.location='lawyerhome.jsp'");
                out.println("</script>");

            }

        } catch (SQLException ex) {
            Logger.getLogger(LawyerRegister.class.getName()).log(Level.SEVERE, null, ex);
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
