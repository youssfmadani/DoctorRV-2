package conn.user.servlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import conn.dao.Userdaw;
import conn.db.DBconnect;
import conn.entity.User;

@WebServlet("/user_login")
public class UserLogin extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String email = req.getParameter("email");
            String password = req.getParameter("password");

            // Crée un objet User avec les informations de login
            User u = new User(email, password);
            Userdaw daw = new Userdaw(DBconnect.getConn());

            HttpSession session = req.getSession();

            // Vérifie les informations d'identification de l'utilisateur
            User authenticatedUser = daw.UserLogin(u);

            if (authenticatedUser != null) {
                // Si l'utilisateur est authentifié, stocke les informations dans la session
                session.setAttribute("user", authenticatedUser);
                session.setAttribute("sucMsg", "Login successful!");
                resp.sendRedirect("dashboard.jsp"); // Redirige vers le tableau de bord
            } else {
                // Si les informations d'identification sont incorrectes
                session.setAttribute("errorMsg", "Invalid email or password");
                resp.sendRedirect("signup.jsp"); // Redirige vers la page de login avec un message d'erreur
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("userlogin.jsp"); // Redirige vers la page de login en cas d'erreur serveur
        }
    }
}
