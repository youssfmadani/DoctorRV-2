package conn.admin.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import conn.dao.Specialistdaw;
import conn.db.DBconnect;

@WebServlet("/addspecialist")
public class Addspecialist extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String specName=req.getParameter("specName");
		Specialistdaw daw= new Specialistdaw(DBconnect.getConn());
	boolean f=daw.addSpecialist(specName); 
	HttpSession session = req.getSession();

	if (f) {
		session.setAttribute("succMsg", "Specialist Added");
		resp.sendRedirect("admin/index.jsp");
	} else {
		session.setAttribute("errorMsg", "something wrong on server");
		resp.sendRedirect("admin/index.jsp");
	}

}
		
	}


