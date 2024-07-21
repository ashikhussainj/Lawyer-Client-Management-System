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
@WebServlet(name = "lawyerlogin", urlPatterns = {"/lawyerlogin"})
public class lawyerlogin extends HttpServlet {

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
            out.println("<title>Servlet lawyerlogin</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet lawyerlogin at " + request.getContextPath() + "</h1>");
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
//        processRequest(request, response);

        String email = request.getParameter("email");
        String password = request.getParameter("password");
//        JOptionPane.showMessageDialog(null, email);
//        JOptionPane.showMessageDialog(null, password);

        Connection con = Db.connect();
        try {
            PreparedStatement st = con.prepareStatement("select * from lawyers where email=? and password=? ");
            st.setString(1, email);
            st.setString(2, password);

            ResultSet rs = st.executeQuery();
            if (rs.next()) {

                if (rs.getInt("council") == 0 && rs.getInt("lawcertificate")==0 ) {

                    out.println("<script type='text/javascript'>");
                    out.println("alert('Verification not completed Please wait')");
                    out.println("window.location='index.html'");
                    out.println("</script>");

                } else {
                    
                        
             PreparedStatement st2= con.prepareStatement("select * from lawyers where email=? and flag=? ");
            st2.setString(1, email);
            st2.setInt(2, 1);
            ResultSet rs2 = st2.executeQuery();
                if (rs2.next()) {
                    
                     out.println("<script type='text/javascript'>");
                    out.println("alert('You are Removed By admin')");
                    out.println("window.location='index.html'");
                    out.println("</script>");
                    
                }else{
                    
                    
                

                    session.setAttribute("email", email);
                    session.setAttribute("city", rs.getString("city"));
                    session.setAttribute("name", rs.getString("username"));

                    LocalDate today = LocalDate.now();

                    // Print today's date
                    System.out.println("Today's Date: " + today);

                    PreparedStatement st1 = con.prepareStatement("update lawyers set lastlogin=? where email=? ");
                    st1.setString(1, "" + today);
                    st1.setString(2, email);

                    int rs1 = st1.executeUpdate();

                    if (rs1 > 0) {

                        out.println("<script type='text/javascript'>");
//                        out.println("alert('Verification not completed Please wait')");
                        out.println("window.location='lawyerhome.jsp'");
                        out.println("</script>");

//                        response.sendRedirect("lawyerhome.jsp");

                    }}

//            JOptionPane.showMessageDialog(null, "hi");
                }

            } else {

                out.println("<script type='text/javascript'>");
                out.println("alert('Wrong Email or password')");
                out.println("window.location='index.html'");
                out.println("</script>");

//                 response.sendRedirect("index.html");
            }

//            st.executeUpdate();
        } catch (Exception ex) {
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
