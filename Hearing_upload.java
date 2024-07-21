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

/**
 *
 * @author Fabhost
 */
@WebServlet(name = "Hearing_upload", urlPatterns = {"/Hearing_upload"})
public class Hearing_upload extends HttpServlet {

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
            out.println("<title>Servlet Hearing_upload</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Hearing_upload at " + request.getContextPath() + "</h1>");
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
        String email = (String) session.getAttribute("email");


        PrintWriter out = response.getWriter();
        String path = request.getSession().getServletContext().getRealPath("/");
        String patt = path.replace("\\build", "");
        String p = patt + "Hearing_Photos";
        MultipartRequest m = new MultipartRequest(request, p);
        String filename = "" + m.getFile("file");
        Path pp = Paths.get(filename);
        String name = pp.getFileName().toString();
        
        

        // Get today's date
        LocalDate today = LocalDate.now();

        // Print today's date
        System.out.println("Today's Date: " + today);

        Connection con = Db.connect();
        try {

            PreparedStatement st1 = con.prepareStatement("select * from hearing where Lawyeremail=? and filename=?");
            st1.setString(1, email);
            st1.setString(2, name);
            ResultSet rs1 = st1.executeQuery();
            if (rs1.next()) {

                out.println("<script type='text/javascript'>");
                out.println("alert('Already Posted')");
                out.println("window.location='Hearing_updates.jsp'");
                out.println("</script>");

            }
            
            
             PreparedStatement st12 = con.prepareStatement("select * from hearing where filename=?");
          
            st12.setString(1, name);
            ResultSet rs12 = st12.executeQuery();
            if (rs12.next()) {

                out.println("<script type='text/javascript'>");
                out.println("alert('FileName Exist')");
                out.println("window.location='Hearing_updates.jsp'");
                out.println("</script>");

            }

            PreparedStatement st = con.prepareStatement("insert into hearing(Lawyeremail,filename) values(?,?)");
            st.setString(1, email);
            st.setString(2, name);
            int rs = st.executeUpdate();

            if (rs > 0) {
                
                session.setAttribute("hearing_filename",name);

                response.sendRedirect("Hearing_content.jsp");

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
