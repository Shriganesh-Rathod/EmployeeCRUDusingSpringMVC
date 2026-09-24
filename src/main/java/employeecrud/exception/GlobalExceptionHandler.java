package employeecrud.exception;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class GlobalExceptionHandler {

    // =========================================================
    // HANDLE EMPLOYEE NOT FOUND EXCEPTION
    // =========================================================

    @ExceptionHandler(EmployeeNotFoundException.class)
    public String handleEmployeeNotFound(
            EmployeeNotFoundException exception,
            Model model) {

        model.addAttribute(
                "message",
                exception.getMessage()
        );

        return "error";
    }
}