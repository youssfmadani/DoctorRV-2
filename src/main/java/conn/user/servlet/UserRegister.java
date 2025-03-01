package conn.user.servlet;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import conn.dao.Userdaw;
import conn.db.DBconnect;
import conn.entity.User ; 
@WebServlet("/user_register")

public class UserRegister extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String fullname=req.getParameter("fullname");
			String email=req.getParameter("email");
			String password=req.getParameter("password");
			
			
			User u= new User(fullname,email,password); 
Userdaw daw= new Userdaw(DBconnect.getConn()) ; 
HttpSession session=req.getSession();
boolean f= daw.UserRegister(u); 

if (f) {

	session.setAttribute("sucMsg", "Register Sucessfully");
	resp.sendRedirect("signup.jsp");

} else {
	session.setAttribute("errorMsg", "Something wrong on server");
	resp.sendRedirect("signup.jsp");
}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	
	
	
}
