import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.sql.*;
import java.util.regex.*;    
import org.json.JSONArray;
import java.util.*;
import org.json.JSONObject;

public class Admins extends HttpServlet {
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String adminname = request.getParameter("adminname");
    String adminemail = request.getParameter("adminemail");
    String adminpassword=request.getParameter("adminpassword");
    String pattern = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$"; 
    Pattern regex = Pattern.compile(pattern);
    JSONObject jsonResponse = new JSONObject();
    Matcher matcher = regex.matcher(adminemail);  
    if(matcher.matches())
    {
        
     PrintWriter out = response.getWriter();
    // Store dynamicHTML in the database or perform any desired processing

        Connection con = null;
        PreparedStatement pstmt = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/quizit","root","prem8097");
        pstmt = con.prepareStatement("INSERT INTO admin_details (name,email,password) VALUES (?, ?,?)");
        pstmt.setString(1, adminname);
        pstmt.setString(2, adminemail);
        pstmt.setString(3,adminpassword);
        
        pstmt.executeUpdate();
        jsonResponse.put("status", "success");
    } catch (Exception ex) {
        jsonResponse.put("status", "error"); // Set error status in JSON response
        jsonResponse.put("message", ex.getMessage());
        ex.printStackTrace();
    } 
    finally {
        try {
            if (pstmt != null)
                pstmt.close();
            if (con != null)
                con.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
    
    }
    else
    {
        jsonResponse.put("status", "error"); // Set error status in JSON response
        jsonResponse.put("message", "Invalid email format");
    }
    
  }
}
