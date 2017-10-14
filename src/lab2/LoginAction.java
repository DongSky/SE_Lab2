package lab2;
import java.sql.*;
import com.opensymphony.xwork2.*;
public class LoginAction extends ActionSupport{
	private String user;
	private String password;
	private String name;
	public String execute() {
		String ret=ERROR;
		Connection conn=null;
		try {
			String URL="jdbc:mysql://localhost:3306/lab2?useUnicode=true&characterEncoding=utf8";
			Class.forName("com.mysql.jdbc.Driver");
			conn=DriverManager.getConnection(URL,"root","hatsuzuki");
			String sql="SELECT name FROM users WHERE";
			sql+=" user= ? AND password= ?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, user);
			ps.setString(2, password);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				name=rs.getString(1);
				ret=SUCCESS;
			}
		}catch(Exception e) {
			ret=ERROR;
		}finally {
			if(conn!=null) {
				try {
					conn.close();
				}catch(Exception e) {
				}
			}
		}
		return ret;
		
	}
	public String getUser() {
		return user;
	}
	public String getName() {
		return name;
	}
	public void setUser(String user) {
		this.user=user;
	}
	public void setPassword(String password) {
		this.password=password;
	}
	public void setName(String name) {
		this.name=name;
	}
}
