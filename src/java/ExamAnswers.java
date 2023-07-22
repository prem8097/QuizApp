import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.sql.*;
import org.json.JSONArray;
import java.util.*;

public class ExamAnswers extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String quizName = request.getParameter("quizName");
        int numQuestions = Integer.parseInt(request.getParameter("numQuestions"));
        String randomstr = request.getParameter("randomString");
        String correctOptionsJSON = request.getParameter("correctOptions");
        JSONArray jsonArray = new JSONArray(correctOptionsJSON);
        String email = getEmailFromCookie(request);
        
        // Increment the count column in the table for the given email
        incrementCount(email);
        List<Integer> correctOptions = new ArrayList<>();

        for (int i = 0; i < jsonArray.length(); i++) {
            int correctOption = jsonArray.getInt(i);
            correctOptions.add(correctOption);
        }

        PrintWriter out = response.getWriter();

        // Store dynamicHTML in the database or perform any desired processing

        Connection con = null;
        PreparedStatement pstmt = null;
        String createTableQuery = "CREATE TABLE " + randomstr + " ("
                + "ques_no INT PRIMARY KEY AUTO_INCREMENT,"
                + "correct INT"
                + ")";
        String insertQuery = "INSERT INTO " + randomstr + " (correct) VALUES (?)";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/quizit", "root", "prem8097");
            
            // Create the table
            pstmt = con.prepareStatement(createTableQuery);
            pstmt.executeUpdate();

            // Insert correct options into the table
            pstmt = con.prepareStatement(insertQuery);
            for (int i = 0; i < correctOptions.size(); i++) {
                int correctOption = correctOptions.get(i);
                pstmt.setInt(1, correctOption);
                pstmt.executeUpdate();
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (pstmt != null)
                    pstmt.close();
                if (con != null)
                    con.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }

        response.getWriter().write("Dynamic HTML stored successfully.");
        out.println("Dynamic HTML stored successfully");
    }
    private String getEmailFromCookie(HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("adminemail")) {
                    return cookie.getValue();
                }
            }
        }
        return null;
    }
    private void incrementCount(String email) {
        Connection con = null;
        PreparedStatement pstmt = null;
        String incrementQuery = "UPDATE admin_details SET quiz_count = quiz_count + 1 WHERE email = ?";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/quizit", "root", "prem8097");

            pstmt = con.prepareStatement(incrementQuery);
            pstmt.setString(1, email);
            pstmt.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
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
}
