package conn.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import conn.entity.Doctor;

public class Doctordaw {
private Connection conn ;

public Doctordaw(Connection conn)
{
	super();
	this.conn=conn ; 
}
public boolean RegisterDoctor(Doctor d)
{
	boolean f = false ; 
	try {
		String sql="insert into doctor(full_name,dob,qualification,specialist,email,mobno) values(?,?,?,?,?,?)";
	PreparedStatement ps=conn.prepareStatement(sql);
	ps.setString(1,d.getFullName());
	ps.setString(2,d.getDob());
	ps.setString(3, d.getQualification());
	ps.setString(4, d.getSpecialist());
	ps.setString(5, d.getEmail());
	ps.setString(6, d.getMobNo());
	
	
	int i=ps.executeUpdate();
	if(i==1) {
		f=true ; 
		}
	
	}catch(Exception e)
	{
		e.printStackTrace();
	}
	return f ; 
}
public List<Doctor> getAllDoctor() {
	List<Doctor> list = new ArrayList<Doctor>();
	Doctor d = null;
	try {

		String sql = "select * from doctor order by id desc";
		PreparedStatement ps = conn.prepareStatement(sql);

		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			d = new Doctor();
			d.setId(rs.getInt(1));
			d.setFullName(rs.getString(2));
			d.setDob(rs.getString(3));
			d.setQualification(rs.getString(4));
			d.setSpecialist(rs.getString(5));
			d.setEmail(rs.getString(6));
			d.setMobNo(rs.getString(7));
		
			list.add(d);
		}

	} catch (Exception e) {
		e.printStackTrace();
	}
	return list;
}
public boolean updateDoctor(Doctor d) {
	boolean f = false;

	try {
		String sql = "update doctor set full_name=?,dob=?,qualification=?,specialist=?,email=?,mobno=? where id=?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, d.getFullName());
		ps.setString(2, d.getDob());
		ps.setString(3, d.getQualification());
		ps.setString(4, d.getSpecialist());
		ps.setString(5, d.getEmail());
		ps.setString(6, d.getMobNo());
		ps.setInt(7, d.getId());
		int i = ps.executeUpdate();

		if (i == 1) {
			f = true;
		}
	} catch (Exception e) {
		e.printStackTrace();
	}

	return f;
}
public boolean deleteDoctor(int id) {
	boolean f=false ;
	try {
		String sql = "delete from doctor where id=?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, id);

		int i = ps.executeUpdate();
		if (i == 1) {
			f = true;
		}
	}catch(Exception e) {
		e.printStackTrace();
	}
	
	return f; 
	
}
public Doctor getdoctorbyid(int id) {

	Doctor d = null;
	try {

		String sql = "select * from doctor where id=?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, id);
		ResultSet rs = ps.executeQuery();

		while (rs.next()) {
			d = new Doctor();
			d.setId(rs.getInt(1));
			d.setFullName(rs.getString(2));
			d.setDob(rs.getString(3));
			d.setQualification(rs.getString(4));
			d.setSpecialist(rs.getString(5));
			d.setEmail(rs.getString(6));
			d.setMobNo(rs.getString(7));

		}

	} catch (Exception e) {
		e.printStackTrace();
	}
	return d;
}

}
