package lab2;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DeleteBookQuery {
	private String book_name;
	private String authorid;
	public DeleteBookQuery() {}
	public DeleteBookQuery(String bookname,String author_id) {
		this.book_name=bookname;
		this.authorid=author_id;
	}
	public String getBook_name() {
		return book_name;
	}
	public void setBook_name(String bookname) {
		this.book_name=bookname;
	}
	public int deleteQuery() {
		int ret=0;
		Connection conn=null;
		String URL="jdbc:mysql://localhost:3306/lab2?useUnicode=true&characterEncoding=utf8";
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.out.println("Bind failed");
			e.printStackTrace();
		}
		try {
			System.out.println("checkpoint");
			System.out.println(book_name);
			System.out.println("checkpoint end");
			conn=DriverManager.getConnection(URL,"root","hatsuzuki");
			//String delete_book_sql="delete from book where title=\""+book_name+"\" and authorid=\""+authorid+"\";";
			String delete_book_sql="delete from book where title= ? and authorid= ? ";
			try {
				System.out.println("niconico");
				PreparedStatement delete_book_ps=conn.prepareStatement(delete_book_sql);
				delete_book_ps.setString(1, book_name);
				delete_book_ps.setString(2, authorid);
				ret=delete_book_ps.executeUpdate();
			} catch (SQLException e) {
				System.out.println("Delete failed");
				e.printStackTrace();
			}
		} catch (SQLException e) {
			System.out.println("Connect failed");
			e.printStackTrace();
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
}
