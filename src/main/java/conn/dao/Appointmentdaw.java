package conn.dao;
import java.sql.PreparedStatement;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


import conn.entity.Appointment;

public class Appointmentdaw {
	private Connection conn;

	public Appointmentdaw(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean AddAppointment(Appointment ap) {
		boolean f = false;

		try {

			String sql = "insert into appointment(fullname,gender,age,appointment_date,email,phno,diseases,specialist,address) values(?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1, ap.getFullName());
			ps.setString(2, ap.getGender());
			ps.setString(3, ap.getAge());
			ps.setString(4, ap.getAppoinDate());
			ps.setString(5, ap.getEmail());
			ps.setString(6, ap.getPhNo());
			ps.setString(7, ap.getDiseases());
			ps.setString(8, ap.getSpec());
			ps.setString(9, ap.getAddress());
			

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		return f;

		} catch (Exception e) {
			System.out.println("Data insertion failed: " + e.getMessage());
			e.printStackTrace();
		}
		return f;

		
	}
	public List<Appointment> getAppointmentsByUserId(int userId) {
			List<Appointment> appointments = new ArrayList<>();
			try {
				String sql = "SELECT a.id, a.fullname, a.gender, a.age, a.appointment_date, a.email, a.phno, "
						+ "a.diseases, a.specialist, a.address FROM appointment a "
						+ " WHERE a.email = (SELECT email FROM user_dtls WHERE id = ?)";

				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setInt(1, userId);

				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
					Appointment appt = new Appointment();
					appt.setId(rs.getInt("id"));
					appt.setFullName(rs.getString("fullname"));
					appt.setGender(rs.getString("gender"));
					appt.setAge(rs.getString("age"));
					appt.setAppoinDate(rs.getString("appointment_date"));
					appt.setEmail(rs.getString("email"));
					appt.setPhNo(rs.getString("phno"));
					appt.setDiseases(rs.getString("diseases"));
					appt.setSpec(rs.getString("spec_name"));
					appt.setAddress(rs.getString("address"));

					appointments.add(appt);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return appointments;
		}


}

