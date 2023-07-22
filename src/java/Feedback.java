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

public class Feedback extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
       
        PrintWriter out = response.getWriter();
        
        Connection con=null;
        String email=request.getParameter("email");
        String feedback=request.getParameter("feedbackValue");
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost/quizit","root","prem8097");
            
            String insertQuery = "INSERT INTO feedback (email, feed) VALUES (?, ?)";
PreparedStatement pstmt = con.prepareStatement(insertQuery);

// Set the parameter values
pstmt.setString(1, email);
pstmt.setString(2, feedback);

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
