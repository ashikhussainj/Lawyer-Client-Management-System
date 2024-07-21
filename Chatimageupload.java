/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Database;

import com.oreilly.servlet.MultipartRequest;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Path;
import java.nio.file.Paths;
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
@WebServlet(name = "Chatimageupload", urlPatterns = {"/Chatimageupload"})
public class Chatimageupload extends HttpServlet {

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
            out.println("<title>Servlet Chatimageupload</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Chatimageupload at " + request.getContextPath() + "</h1>");
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

        response.setContentType("text/html");

        HttpSession session = request.getSession();
        String myemail = (String) session.getAttribute("email");
         String Clientemail=""+session.getAttribute("Clientemail");

        PrintWriter out = response.getWriter();
        String path = request.getSession().getServletContext().getRealPath("/");
        String patt = path.replace("\\build", "");
        String p = patt + "Chatimages";
        MultipartRequest m = new MultipartRequest(request, p);
        String filename = "" + m.getFile("file");
        Path pp = Paths.get(filename);
        String message = pp.getFileName().toString();

        JOptionPane.showMessageDialog(null, message);

        // Get today's date
        LocalDate today = LocalDate.now();

        // Print today's date
        System.out.println("Today's Date: " + today);
        Connection con = Db.connect();

        try {
            PreparedStatement st = con.prepareStatement("insert into chats(fromemail,toemail,date,content,img) values(?,?,?,?,?)");
            st.setString(1, myemail);
            st.setString(2, Clientemail);
            st.setString(3, "" + today);
            st.setString(4, message);
            st.setInt(5, 1);

            int rs = st.executeUpdate();

            if (rs > 0) {

                response.sendRedirect("Lawyerchat.jsp");

            }

        } catch (SQLException ex) {

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

}
