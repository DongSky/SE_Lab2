package lab2;

public class BookInfo {
	private String isbn;
	private String title;
	private String authorid;
	private String publisher;
	private String publishdate;
	private String price;
	private String authorname;
	private String authorage;
	private String authorcountry;
	public BookInfo() {}
	public BookInfo(String isbn_,String title_,String authorid_,String publisher_,String publishdate_,String price_,String authorname_,String authorage_,String authorcountry_) {
		this.isbn=isbn_;
		this.title=title_;
		this.authorid=authorid_;
		this.publisher=publisher_;
		this.publishdate=publishdate_;
		this.price=price_;
		this.authorname=authorname_;
		this.authorage=authorage_;
		this.authorcountry=authorcountry_;
	}
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
}
