package lab2;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.opensymphony.xwork2.*;

public class UpdateBookQuery extends ActionSupport{
	private String isbn;
	private String title;
	private String authorid;
	private String authorid_new;
	private String publisher;
	private String publishdate;
	private String price;
	private String authorname;
	private String authorage;
	private String authorcountry;
	public String getIsbn() {
	    return isbn;
	}
	public void setIsbn(String isbn) {
	    this.isbn = isbn;
	}
	public String getTitle() {
	    return title;
	}
	public void setTitle(String title) {
	    this.title = title;
	}
	public String getAuthorid() {
	    return authorid;
	}
	public void setAuthorid(String authorid) {
	    this.authorid = authorid;
	}
	public String getPublisher() {
	    return publisher;
	}
	public void setPublisher(String publisher) {
	    this.publisher = publisher;
	}
	public String getPublishdate() {
	    return publishdate;
	}
	public void setPublishdate(String publishdate) {
	    this.publishdate = publishdate;
	}
	public String getPrice() {
	    return price;
	}
	public void setPrice(String price) {
	    this.price = price;
	}
	public String getAuthorname() {
	    return authorname;
	}
	public void setAuthorname(String authorname) {
	    this.authorname = authorname;
	}
	public String getAuthorage() {
	    return authorage;
	}
	public void setAuthorage(String authorage) {
	    this.authorage = authorage;
	}
	public String getAuthorcountry() {
	    return authorcountry;
	}
	public void setAuthorcountry(String authorcountry) {
	    this.authorcountry = authorcountry;
	}
	public String execute() {
		String ret=ERROR;
		if(isbn==""||title==""||publisher==""||publishdate==""||price==""||authorname==""||authorage==""||authorcountry=="") {
			return "lacked";
		}
		Connection conn=null;
		try {
			String URL="jdbc:mysql://localhost:3306/lab2?useUnicode=true&characterEncoding=utf8";
			Class.forName("com.mysql.jdbc.Driver");
			//System.out.println("mysql_conn");
			conn=DriverManager.getConnection(URL,"root","hatsuzuki");
			
			//String search_author_sql="select * from author where name=\""+authorname+"\" and age=\""+authorage+"\" and country=\""+authorcountry+"\";";
			//PreparedStatement ps_author=conn.prepareStatement(search_author_sql);
			String search_author_sql="select * from author where name= ? and age= ? and country= ? ";
			PreparedStatement ps_author=conn.prepareStatement(search_author_sql);
			ps_author.setString(1, authorname);
			ps_author.setString(2, authorage);
			ps_author.setString(3, authorcountry);
			
			//System.out.println("maki");
			ResultSet rs_find_author=ps_author.executeQuery();
			//System.out.println("eli");
			boolean judge_flag=false;
			if(rs_find_author.next()) {
				judge_flag=true;
				System.out.println("Foundit");
				authorid_new=rs_find_author.getString(1);
			}
			if(judge_flag==false) {
				System.out.println("trytogetmax");
				String max_authorid_query="select max(authorid) from author;";
				PreparedStatement ps_max_authorid=conn.prepareStatement(max_authorid_query);
				ResultSet rs_max_authorid=ps_max_authorid.executeQuery();
				int max_author=0;
				if(rs_max_authorid.next()) {
					try {
						max_author=rs_max_authorid.getInt(1);
					} catch (Exception e) {
						System.out.println(e);
					}
				}
				max_author++;
				authorid_new=max_author+"";
				//String add_author_sql="insert into author values "+"(\""+authorid+"\",\""+authorname+"\",\""+authorage+"\",\""+authorcountry+"\");";
				//PreparedStatement ps_add_author=conn.prepareStatement(add_author_sql);
				String add_author_sql="insert into author values ( ? , ? , ? , ? )";
				PreparedStatement ps_add_author=conn.prepareStatement(add_author_sql);
				ps_add_author.setString(1, authorid_new);
				ps_add_author.setString(2, authorname);
				ps_add_author.setString(3, authorage);
				ps_add_author.setString(4, authorcountry);
				try {
					int rs_add=ps_add_author.executeUpdate();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					System.out.println("add author");
					System.out.println(e);
				}
			}
			//String update_sql="update book SET isbn=\""+isbn+"\", title=\""+title+"\", authorid=\""+authorid_new+"\", publisher=\""+publisher+"\", publishdate=\""+publishdate+"\", price=\""+price+"\" where title=\""+title+"\";";
			String update_sql="update book SET isbn= ? ,title= ? ,authorid= ? ,publisher= ? ,publishdate= ? ,price= ? where isbn= ? ";
			PreparedStatement ps=conn.prepareStatement(update_sql);
			ps.setString(1, isbn);
			ps.setString(2, title);
			ps.setString(3, authorid_new);
			ps.setString(4, publisher);
			ps.setString(5, publishdate);
			ps.setString(6, price);
			ps.setString(7, isbn);
			int result=ps.executeUpdate();
			if(result>0) {
				System.out.println("yudachi");
				ret=SUCCESS;
			}
			else {
				System.out.println("hmkz");
			}
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			System.out.println("SQLFailed");
			System.out.println(e1);
			e1.printStackTrace();
		}
		return ret;
	}
}
