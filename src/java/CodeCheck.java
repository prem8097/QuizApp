import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.internet.ParseException;
import org.json.JSONObject;

public class CodeCheck extends HttpServlet {
    // Database connection details
    private static final String DB_URL = "jdbc:mysql://localhost/quizit";
    private static final String DB_USERNAME = "root";
    private static final String DB_PASSWORD = "prem8097";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String quizName = request.getParameter("quizName");
        boolean codeExists = checkCodeExistsInDatabase(quizName);
        HttpSession session=request.getSession();
        String email=(String)session.getAttribute("email");
        boolean attempt=userAttemptCheck(quizName,email);
        try {
            boolean timecheck=userTimeCheck(quizName);
            JSONObject jsonResponse = new JSONObject();
       if(codeExists ==true && attempt != true && timecheck == true)
       {
           jsonResponse.put("success","attemptfail");
       }
       if(codeExists != true && attempt != true && timecheck == true)
       {
           jsonResponse.put("success","codeattempt");
       }
       if(codeExists == true && attempt == true && timecheck==true)
       {
           jsonResponse.put("success","success");
       }
       if(codeExists != true && attempt == true && timecheck==true)
       {
           jsonResponse.put("success", "codecheck");
       }
       //
       if(codeExists ==true && attempt != true && timecheck != true)
       {
           jsonResponse.put("success","timefail");
       }
       if(codeExists != true && attempt != true && timecheck != true)
       {
           jsonResponse.put("success","timefail");
       }
       if(codeExists == true && attempt == true && timecheck!=true)
       {
           jsonResponse.put("success","timefail");
       }
       if(codeExists != true && attempt == true && timecheck!=true)
       {
           jsonResponse.put("success", "timefail");
       }
       
        // Set the response content type
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        // Create a JSON response
        PrintWriter out = response.getWriter();
        out.print(jsonResponse.toString());
        
        out.flush();
            
            
        } catch (java.text.ParseException ex) {
            Logger.getLogger(CodeCheck.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

    private boolean checkCodeExistsInDatabase(String quizName) {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            // Establish a database connection
            connection = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);

            // Prepare a SQL statement to check if the quiz code exists
            String query = "SELECT COUNT(*) FROM quizzes WHERE quiz_code = ?";
            statement = connection.prepareStatement(query);
            statement.setString(1, quizName);

            // Execute the query and get the result
            resultSet = statement.executeQuery();

            if (resultSet.next()) {
                int count = resultSet.getInt(1);
                return count > 0; // Return true if the count is greater than 0 (code exists), false otherwise
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Close the database resources
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (statement != null) {
                    statement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return false; // Return false if an error occurred
    }
    private boolean userAttemptCheck(String quizName, String email) {
    Connection connection = null;
    PreparedStatement statement = null;
    ResultSet resultSet = null;

    try {
        // Establish a database connection
        connection = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);

        // Prepare a SQL statement to check the status of the email
        String query = "SELECT status FROM user_quizzes WHERE email = ? AND quiz_code = ?";
        statement = connection.prepareStatement(query);
        statement.setString(1, email);
        statement.setString(2, quizName);

        // Execute the query and get the result
        resultSet = statement.executeQuery();

        if (resultSet.next()) {
            boolean status = resultSet.getBoolean("status");
            return !status; // Return true if status is 0 (false), false if status is 1 (true)
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        // Close the database resources
        try {
            if (resultSet != null) {
                resultSet.close();
            }
            if (statement != null) {
                statement.close();
            }
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    return false; // Return false if an error occurred
}
private boolean userTimeCheck(String quizName) throws java.text.ParseException {
    Connection connection = null;
    PreparedStatement statement = null;
    ResultSet resultSet = null;

    try {
        // Establish a database connection
        connection = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);

        // Prepare a SQL statement to check the status of the email
        String query = "SELECT end_time, end_date FROM quizzes WHERE quiz_code = ?";
        statement = connection.prepareStatement(query);

        statement.setString(1, quizName);

        // Execute the query and get the result
        resultSet = statement.executeQuery();

        if (resultSet.next()) {
            String end_time = resultSet.getString("end_time");
            String end_date = resultSet.getString("end_date");

            String dateTimeString = end_date + " " + end_time; // Handle the parse exception, e.g., show an error message to the user
            // out.println("Error occurred while parsing the date and time.");
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            java.util.Date endDateTime = sdf.parse(dateTimeString);
            // Get the current time
            java.util.Date currentTime = new java.util.Date();
            // Compare the current time and retrieved end time
            return currentTime.before(endDateTime);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        // Close the database resources
        try {
            if (resultSet != null) {
                resultSet.close();
            }
            if (statement != null) {
                statement.close();
            }
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Return false if an error occurred or if end_date and end_time are not greater than the current time
    return false;
}

}
