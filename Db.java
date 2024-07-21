package Database;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;
//import javax.swing.JOptionPane;

/**
 *
 * @author fabsys5
 */
public  class Db {
    
   static Connection con;
       static Statement pre;
    public static Connection connect(){
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/lawyer?useUnicode=true&characterEncoding=UTF-8","root","admin");
        }
        catch(Exception e)
        {
            System.out.print("SQL Exception:"+e);
//            JOptionPane.showMessageDialog(null, e);
            return null;
        }
       return con; 
    }
    public static Statement st()
    {
        try
        {
           pre=connect().createStatement();
        }catch(Exception e)
        {
//            JOptionPane.showMessageDialog(null, e);
            return null;
        }
        return pre;
    }
    
}
