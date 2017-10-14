package lab2;

public class Title {
	private String name;
	private String authorid;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name=name;
	}
	public String getAuthorid() {
		return authorid;
	}
	public void setAuthorid(String authorid) {
		this.authorid=authorid;
	}
	public Title(String name,String authorid) {
		super();
		this.name=name;
		this.authorid=authorid;
	}
}
