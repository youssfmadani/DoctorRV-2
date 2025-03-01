package conn.admin.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import conn.dao.Doctordaw;
import conn.db.DBconnect;
@WebServlet("/deleteDoctor")
public class DeleteDoctor extends HttpServlet  {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id=Integer.parseInt(req.getParameter("id")) ; 
		Doctordaw dao= new Doctordaw(DBconnect.getConn()); 
		HttpSession session = req.getSession();

		if (dao.deleteDoctor(id)) {
			session.setAttribute("succMsg", "Doctor Delete Sucessfully..");
			resp.sendRedirect("admin/view_doctor.jsp");
		} else {
			session.setAttribute("errorMsg", "something wrong on server");
			resp.sendRedirect("admin/view_doctor.jsp");
		}
	}

}
