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

/**
 *
 * @author premsai devavarapu
 */
public class dbms extends HttpServlet {

    
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
        
        String question;
        JSONObject jsonResponse = new JSONObject();
        question=request.getParameter("questionName");
        
       
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost/quizit","root","prem8097");
            
            PreparedStatement pstmt = con.prepareStatement("Select answer from dbms where question=?");
            pstmt.setString(1, question);
           
            //pstmt.setString(3,username);
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) 
            {
            //out.print("You are successfully loggedin..."+ "Hello"+  email);
              //request.getRequestDispatcher("Welcome").include(request, response);
               
               jsonResponse.put("success",rs.getString("answer"));
            
              //response.sendRedirect("exams.jsp");
             } 
            else 
            {
                jsonResponse.put("success","fail");
              
              //request.getRequestDispatcher("index.html").include(request, response);
             }
             } catch (ClassNotFoundException | SQLException e) {
              e.printStackTrace();
              }
            
        out.print(jsonResponse.toString());
        
        out.flush();
        
        
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
