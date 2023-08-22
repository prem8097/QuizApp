/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.*;
import org.json.JSONObject;
import at.favre.lib.crypto.bcrypt.BCrypt;
/**
 *
 * @author premsai devavarapu
 */
public class web6 extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet web6</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet web6 at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

   
    

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       PrintWriter out = response.getWriter();
        Connection con=null;
        Statement stmt=null;
        String email="";
        String pass="";
        HttpSession session = request.getSession();
        JSONObject jsonResponse = new JSONObject();
        email=request.getParameter("email");
        
        pass=request.getParameter("password");
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost/quizit","root","prem8097");
            
            PreparedStatement pstmt = con.prepareStatement("Select Register_Number,name,email,password from user_details where email=?");
            pstmt.setString(1, email);
            
            //pstmt.setString(3,username);
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) 
            {
            //out.print("You are successfully loggedin..."+ "Hello"+  email);
              //request.getRequestDispatcher("Welcome").include(request, response);
                if(verifyPassword(pass,rs.getString("password")))
                {
                    jsonResponse.put("success","loginsuccess");
                }
                else
                {
                    jsonResponse.put("success","loginfail");
                }
               session.setAttribute("email",email);
               session.setAttribute("password", pass);
               session.setAttribute("user", rs.getString(2));
               session.setAttribute("regno",rs.getString(1));
               
            Cookie emailCookie = new Cookie("email", email);
            Cookie passwordCookie = new Cookie("password", pass);
            Cookie userCookie = new Cookie("user", rs.getString(2));
            emailCookie.setMaxAge(3600); // Set the cookie expiration time (in seconds)
            passwordCookie.setMaxAge(3600);
            userCookie.setMaxAge(3600);
            response.addCookie(emailCookie);
            response.addCookie(passwordCookie);
            response.addCookie(userCookie);   
              //response.sendRedirect("exams.jsp");
             } 
            else 
            {
                jsonResponse.put("success","loginfail");
              
              //request.getRequestDispatcher("index.html").include(request, response);
             }
             } catch (ClassNotFoundException | SQLException e) {
              e.printStackTrace();
              }
            
        out.print(jsonResponse.toString());
        
        out.flush();
        
        
    }

    
   private boolean verifyPassword(String plainPassword, String hashedPassword) {
        return BCrypt.verifyer().verify(plainPassword.toCharArray(), hashedPassword).verified;
    }

}
