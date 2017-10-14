package lab2;

import java.util.ArrayList;
import java.sql.*;
import lab2.Title;
public class GetBookTitle {
	private String authorname;
	public GetBookTitle(String authorname) {
		super();
		this.authorname=authorname;
	}
	public void setAuthorname(String authorname) {
		this.authorname=authorname;
	}
	public String getAuthorname() {
		return authorname;
	}
	public ArrayList<Title> readBookTitle() {
		ArrayList<Title> list=new ArrayList<Title>();
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
			System.out.println(authorname);
			System.out.println("checkpoint end");
			conn=DriverManager.getConnection(URL,"root","hatsuzuki");
			//String find_authorid_sql="select authorid from author where name=\""+authorname+"\";";
			String find_authorid_sql="select authorid from author where name= ? ";
			try {
				System.out.println("niconico");
				PreparedStatement find_id_ps=conn.prepareStatement(find_authorid_sql);
				find_id_ps.setString(1, authorname);
				ResultSet rs_find_id=find_id_ps.executeQuery();
				while(rs_find_id.next()) {
					String authorid=rs_find_id.getString(1);
					//String book_query_sql="select * from book where authorid=\""+authorid+"\";";
					String book_query_sql="select * from book where authorid= ? ";
					PreparedStatement book_query_ps=conn.prepareStatement(book_query_sql);
					book_query_ps.setString(1, authorid);
					ResultSet rs_book_query=book_query_ps.executeQuery();
					while(rs_book_query.next()) {
						String booktitle=rs_book_query.getString(2);
						String book_authorid=rs_book_query.getString(3);
						System.out.println(booktitle);
						System.out.println(book_authorid);
						list.add(new Title(booktitle,book_authorid));
					}
					System.out.println("end");
				}
			} catch (SQLException e) {
				System.out.println("Search failed");
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
		System.out.println("eriri");
		for(int i=0;i<list.size();i++) {
			System.out.println(list.get(i).getName());
		}
		return list; 
	}
}
