package employeecrud.filter;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;

public class LoginFilter extends OncePerRequestFilter {

    @Override
    protected void doFilterInternal(
            HttpServletRequest request,
            HttpServletResponse response,
            FilterChain filterChain)
            throws ServletException, IOException {

        String uri = request.getRequestURI();

        String contextPath = request.getContextPath();

        String path = uri.substring(
                contextPath.length()
        );

        System.out.println(
                "LOGIN FILTER -> " + path
        );


        // =====================================================
        // ALLOW LOGIN REQUEST
        // =====================================================

        if (path.equals("/login")) {

            filterChain.doFilter(request, response);

            return;
        }


        // =====================================================
        // CHECK SESSION
        // =====================================================

        HttpSession session =
                request.getSession(false);


        boolean loggedIn =
                session != null &&
                        session.getAttribute("loggedInUser") != null;


        // =====================================================
        // NOT LOGGED IN
        // =====================================================

        if (!loggedIn) {

            response.sendRedirect(
                    contextPath + "/login"
            );

            return;
        }


        // =====================================================
        // LOGGED IN
        // CONTINUE REQUEST
        // =====================================================

        filterChain.doFilter(
                request,
                response
        );
    }
}