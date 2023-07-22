/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.*;
import java.util.*;
/**
 *
 * @author premsai devavarapu
 */
public class questions extends HttpServlet {

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
        processRequest(request, response);
        PrintWriter out = response.getWriter();
         String paramName,paramValue[];
         Connection con=null;
        Statement stmt=null;
        ResultSet rs=null;
         int score=0;
         String ans="";
         /*String q1="";
         String q2="";
         String q3="";
         String q4="";
         String q5="";
         q1=request.getParameter("question1");
         q2=request.getParameter("question2");
         q3=request.getParameter("question3");
         q4=request.getParameter("question4");
         q5=request.getParameter("question5");*/
         Enumeration paramNames=request.getParameterNames();
          try{
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost/quizit","root","prem8097");
            stmt=con.createStatement();
            
            rs=stmt.executeQuery("select answer from cn_quiz");
            while(rs.next()&& paramNames.hasMoreElements())
            {
                String un=rs.getString(1);
                paramName=(String)paramNames.nextElement();
                paramValue=request.getParameterValues(paramName);
                for(int i=0;i<paramValue.length;i++)
                {
                    ans=paramValue[i];
                }
                if(un.equals(ans))
                {
                    score++;
                }
            }
             HttpSession session = request.getSession();
             session.setAttribute("score", score);
             
             response.sendRedirect("cnscore.jsp");
            //response.sendRedirect("cnmark");
          }
          catch(ClassNotFoundException | SQLException e)
        {
            out.println("Sorry!!!TRy again later"+e);
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
