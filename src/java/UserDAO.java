import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {
    private String jdbcUrl;
    private String dbUsername;
    private String dbPassword;

    public UserDAO() {
        this.jdbcUrl = "jdbc:mysql://localhost/quizit";
        this.dbUsername = "root";
        this.dbPassword = "prem8097";
    }

    // Method to retrieve the user's name based on the email
    public String getUserNameByEmail(String email) {
        String userName = null;

        try (Connection connection = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword)) {
            String sql = "SELECT name FROM user_details WHERE email = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, email);
                try (ResultSet resultSet = statement.executeQuery()) {
                    if (resultSet.next()) {
                        userName = resultSet.getString("name");
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return userName;
    }
    
    public String getAdminNameByEmail(String email) {
        String adminName = null;

        try (Connection connection = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword)) {
            String sql = "SELECT name FROM admin_details WHERE email = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, email);
                try (ResultSet resultSet = statement.executeQuery()) {
                    if (resultSet.next()) {
                        adminName = resultSet.getString("name");
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return adminName;
    }

    // You can also add methods for other CRUD operations as needed (e.g., createUser, updateUser, deleteUser).
    // Additionally, you should close the resources properly in real-world applications (not shown in this example).
}

