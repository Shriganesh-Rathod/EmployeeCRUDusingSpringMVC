package employeecrud.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {

    // =========================================================
    // SHOW LOGIN PAGE
    // URL: GET /login
    // =========================================================

    @GetMapping("/login")
    public String showLoginPage() {

        return "login";
    }


    // =========================================================
    // PROCESS LOGIN
    // URL: POST /login
    // =========================================================

    @PostMapping("/login")
    public String login(
            @RequestParam("username") String username,
            @RequestParam("password") String password,
            HttpSession session,
            Model model) {

        if ("admin".equals(username) &&
                "admin123".equals(password)) {

            session.setAttribute("loggedInUser", username);

            return "redirect:/employees";
        }

        model.addAttribute(
                "error",
                "Invalid username or password"
        );
        return "login";
    }


    // =========================================================
    // LOGOUT
    // URL: GET /logout
    // =========================================================

    @GetMapping("/logout")
    public String logout(HttpSession session) {

        session.invalidate();

        return "redirect:/login";
    }
}