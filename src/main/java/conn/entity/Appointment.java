package conn.entity;

public class Appointment {
	private int id;
	private String fullName;
	private String gender;
	private String age;
	private String appoinDate;
	private String email;
	private String phNo;
	private String diseases;
	private String spec ;
	private String address;
	

	public Appointment() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Appointment(String fullName, String gender, String age, String appoinDate, String email,
			String phNo, String diseases,String spec, String address) {
		super();
		this.fullName = fullName;
		this.gender = gender;
		this.age = age;
		this.appoinDate = appoinDate;
		this.email = email;
		this.phNo = phNo;
		this.diseases = diseases;
		this.spec=spec ; 
		this.address = address;
	
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getAppoinDate() {
		return appoinDate;
	}

	public void setAppoinDate(String appoinDate) {
		this.appoinDate = appoinDate;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhNo() {
		return phNo;
	}

	public void setPhNo(String phNo) {
		this.phNo = phNo;
	}

	public String getDiseases() {
		return diseases;
	}

	public void setDiseases(String diseases) {
		this.diseases = diseases;
	}




	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	

	public String getSpec() {
		return spec;
	}

	public void setSpec(String spec) {
		this.spec = spec;
	}

	


	

}