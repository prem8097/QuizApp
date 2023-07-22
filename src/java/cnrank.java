import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class cnrank extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(false);
        Connection con=null;
        String regno=(String)session.getAttribute("regno");
        String name=(String)session.getAttribute("user");
        int mark=(int)session.getAttribute("score");
        String exam="Computer networks";
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost/quizit","root","prem8097");
            
            PreparedStatement pstmt = con.prepareStatement("insert into cn_exam values('"+regno+"','"+name+"','"+exam
                    +"','"+mark+"')");
            pstmt.executeUpdate();
            out.println("added");
            response.sendRedirect("cnrank.jsp");
        }catch(ClassNotFoundException | SQLException e)
        {
            out.println("Sorry!!!TRy again later"+e);
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
       
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(false);
        Connection con=null;
        String regno=(String)session.getAttribute("regno");
        String name=(String)session.getAttribute("user");
        int mark=(int)session.getAttribute("score");
        String exam="Computer networks";
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost/quizit","root","prem8097");
            
            PreparedStatement pstmt = con.prepareStatement("insert into cn_exam values('"+regno+"','"+name+"','"+exam
                    +"','"+mark+"')");
            pstmt.executeUpdate();
            out.println("added");
            
        }catch(ClassNotFoundException | SQLException e)
        {
            out.println("Sorry!!!TRy again later"+e);
        }
    }  
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
