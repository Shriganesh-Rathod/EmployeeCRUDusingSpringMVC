package employeecrud.interceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class LoginInterceptor
        implements HandlerInterceptor {

    @Override
    public boolean preHandle(
            HttpServletRequest request,
            HttpServletResponse response,
            Object handler)
            throws Exception {

        System.out.println(
                "LOGIN INTERCEPTOR -> "
                        + request.getRequestURI()
        );


        HttpSession session =
                request.getSession(false);


        boolean loggedIn =
                session != null &&
                        session.getAttribute("loggedInUser") != null;


        if (!loggedIn) {

            response.sendRedirect(
                    request.getContextPath()
                            + "/login"
            );

            return false;
        }


        return true;
    }
}