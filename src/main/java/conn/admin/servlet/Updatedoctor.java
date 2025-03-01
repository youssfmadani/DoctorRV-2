package conn.admin.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import conn.dao.Doctordaw;
import conn.db.DBconnect;
import conn.entity.Doctor;
@WebServlet("/updateDoctor")
public class Updatedoctor extends HttpServlet  {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {

			String fullName = req.getParameter("fullname");
			String dob = req.getParameter("dob");
			String qualification = req.getParameter("qualification");
			String spec = req.getParameter("spec");
			String email = req.getParameter("email");
			String mobno = req.getParameter("mobno");

			int id = Integer.parseInt(req.getParameter("id"));


			Doctor d = new Doctor(id,fullName, dob, qualification, spec, email, mobno);

			Doctordaw dao = new Doctordaw(DBconnect.getConn());
			HttpSession session = req.getSession();


			if (dao.updateDoctor(d)) {
				session.setAttribute("succMsg", "Doctor Update Sucessfully..");
				resp.sendRedirect("admin/view_doctor.jsp");
			} else {
				session.setAttribute("errorMsg", "something wrong on server");
				resp.sendRedirect("admin/view_doctor.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
		
		
		
		
		
		
	}
	


