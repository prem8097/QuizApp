import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

@WebServlet("/ExamResult")
public class ExamResult extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String quizCode = request.getParameter("quizCode");

        String selectedOptionsJson = request.getParameter("selectedOptions");
        int score = 0;

        // Retrieve the username and registration number from session attributes
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("user");
        String registrationNumber = (String) session.getAttribute("regno");
        String email=(String)session.getAttribute("email");
        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/quizit", "root", "prem8097")) {
            // Prepare the SQL statement to retrieve correct options
            String selectSql = "SELECT correct FROM " + quizCode + " WHERE ques_no = ?";
            PreparedStatement selectStmt = conn.prepareStatement(selectSql);

            try {
                // Convert the JSON string to a JSONArray
                JSONArray selectedOptionsArray = new JSONArray(selectedOptionsJson);

                // Iterate over the selected options
                for (int i = 0; i < selectedOptionsArray.length(); i++) {
                    // Get the question number and selected option from each JSON object
                    int questionNumber = selectedOptionsArray.getJSONObject(i).getInt("questionNumber");
                    int selectedOption = selectedOptionsArray.getJSONObject(i).getInt("selectedOption");

                    // Set the question number parameter in the select SQL statement
                    selectStmt.setInt(1, questionNumber);

                    ResultSet rs = selectStmt.executeQuery();
                    if (rs.next()) {
                        int correctOption = rs.getInt("correct");

                        if (selectedOption == correctOption) {
                            score++;
                        }
                    }
                    rs.close();
                }
            } catch (JSONException e) {
                e.printStackTrace();
            }

            // Close the select statement
            selectStmt.close();

            // Create the quizCode_Result table if it does not exist
            String createTableSql = "CREATE TABLE IF NOT EXISTS " + quizCode + "_Result (username VARCHAR(255), registrationNumber VARCHAR(255), score INT, email VARCHAR(255))";
            PreparedStatement createTableStmt = conn.prepareStatement(createTableSql);
            createTableStmt.executeUpdate();
            createTableStmt.close();

            // Insert the score and user details into the result table
            
            
            String insertSql = "INSERT INTO " + quizCode + "_Result (username, registrationNumber, score,email) VALUES (?, ?, ?,?)";
            PreparedStatement insertStmt = conn.prepareStatement(insertSql);
            insertStmt.setString(1, username);
            insertStmt.setString(2, registrationNumber);
            insertStmt.setInt(3, score);
            insertStmt.setString(4,email);
            insertStmt.executeUpdate();
            insertStmt.close();
            
            String insertSql1 = "UPDATE user_quizzes SET status = ? WHERE email = ? and quiz_code = ?";
            PreparedStatement insertStmt1 = conn.prepareStatement(insertSql1);
            insertStmt1.setBoolean(1, true);
            insertStmt1.setString(2, email);
            insertStmt1.setString(3,quizCode);
            insertStmt1.executeUpdate();
            insertStmt1.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Store the score in the session for further use
        session.setAttribute("score", score);
        session.setAttribute("code",quizCode);
        // Return the score as the response
        JSONObject result = new JSONObject();
        result.put("score", score);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(result.toString());

        // Redirect to a result page or perform any other necessary actions
        // response.sendRedirect("cnscore.jsp");
    }
}
