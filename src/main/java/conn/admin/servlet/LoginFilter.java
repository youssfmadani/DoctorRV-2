package conn.admin.servlet;


import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;


@WebFilter({"/dashboard.jsp","/user_dashboard.jsp","/view_appointment.jsp","user_appointment.jsp"})
public class LoginFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {


        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;


        if (req.getSession().getAttribute("user") != null) {
            chain.doFilter(request, response);
        }
        else {
            res.sendRedirect(req.getContextPath() + "/userlogin.jsp");
        }

    }
}
