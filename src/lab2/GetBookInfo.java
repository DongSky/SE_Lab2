package lab2;

import lab2.BookInfo;
import java.sql.*;
public class GetBookInfo {
	private String bookname;
	private String authorid;
	public GetBookInfo(String title,String authorid) {
		this.bookname=title;
		this.authorid=authorid;
	}
	public BookInfo FetchInfo() {
		BookInfo info=new BookInfo();
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
			System.out.println(bookname);
			System.out.println("checkpoint end");
			conn=DriverManager.getConnection(URL,"root","hatsuzuki");
			//String find_book_sql="select * from book where title=\""+bookname+"\" and authorid=\""+authorid+"\";";
			String find_book_sql="select * from book where title= ? and authorid= ? ";
			try {
				System.out.println("niconico");
				PreparedStatement find_book_ps=conn.prepareStatement(find_book_sql);
				find_book_ps.setString(1, bookname);
				find_book_ps.setString(2, authorid);
				ResultSet rs_find_book=find_book_ps.executeQuery();
				if(rs_find_book.next()) {
					String isbn_=rs_find_book.getString(1);
					String title_=rs_find_book.getString(2);
					String authorid_=rs_find_book.getString(3);
					String publisher_=rs_find_book.getString(4);
					String publishdate_=rs_find_book.getString(5);
					String price_=rs_find_book.getString(6);
					String authorname_="";
					String authorage_="";
					String authorcountry_="";
					//String author_info_sql="select * from author where authorid=\""+authorid_+"\";";
					String author_info_sql="select * from author where authorid= ? ";
					PreparedStatement author_query_ps=conn.prepareStatement(author_info_sql);
					author_query_ps.setString(1, authorid);
					ResultSet rs_author_query=author_query_ps.executeQuery();
					if(rs_author_query.next()) {
						authorname_=rs_author_query.getString(2);
						authorage_=rs_author_query.getString(3);
						authorcountry_=rs_author_query.getString(4);
					}
					info=new BookInfo(isbn_,title_,authorid_,publisher_,publishdate_,price_,authorname_,authorage_,authorcountry_);
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
		return info;
	}
}
