package conn.admin.servlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import conn.dao.Appointmentdaw;
import conn.db.DBconnect;
import conn.entity.Appointment;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/AppointmentServlet")
public class AppointmentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(AppointmentServlet.class.getName());

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Retrieve form parameters
        String fullname = req.getParameter("fullname");
        String gender = req.getParameter("gender");
        String age = req.getParameter("age");
        String appointDate = req.getParameter("appoint_date");
        String email = req.getParameter("email");
        String phno = req.getParameter("phno");
        String diseases = req.getParameter("diseases");
        String spec = req.getParameter("spec");
        String address = req.getParameter("address");

        HttpSession session = req.getSession();

        // Validate input parameters
        if (fullname == null || gender == null || age == null || appointDate == null ||
                email == null || phno == null || diseases == null || spec == null || address == null) {
            logger.log(Level.WARNING, "One or more missing parameters.");
            session.setAttribute("errorMsg", "Missing required fields.");
            resp.sendRedirect("user_appointment.jsp");
            return;
        }

        // Create Appointment object
        Appointment appointment = new Appointment(fullname, gender, age, appointDate, email, phno, diseases, spec, address);

        // Instantiate DAO and add appointment
        Appointmentdaw dao = new Appointmentdaw(DBconnect.getConn());

        try {
            if (dao.AddAppointment(appointment)) {
                session.setAttribute("succMsg", "Appointment successfully added.");
            } else {
                session.setAttribute("errorMsg", "Error occurred while adding appointment.");
            }
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Error while adding appointment", e);
            session.setAttribute("errorMsg", "Server error, please try again.");
        }

        // Redirect to prevent form resubmission
        resp.sendRedirect("user_appointment.jsp");
    }
}
