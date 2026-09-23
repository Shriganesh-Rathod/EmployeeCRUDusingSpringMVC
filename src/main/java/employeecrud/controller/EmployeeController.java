package employeecrud.controller;

import employeecrud.entity.Employee;
import employeecrud.service.EmployeeService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/employees")
public class EmployeeController {

    private final EmployeeService employeeService;

    public EmployeeController(EmployeeService employeeService) {

        this.employeeService = employeeService;
    }

    // =========================================================
    // READ ALL EMPLOYEES
    // =========================================================

    @GetMapping
    public String listEmployees(Model model) {

        model.addAttribute(
                "employees",
                employeeService.getAllEmployees()
        );

        return "employee-list";
    }


    // =========================================================
    // SHOW CREATE FORM
    // =========================================================

    @GetMapping("/new")
    public String showCreateForm(Model model) {

        model.addAttribute(
                "employee",
                new Employee()
        );

        return "employee-form";
    }


    // =========================================================
    // CREATE / UPDATE EMPLOYEE
    // =========================================================

    @PostMapping("/save")
    public String saveEmployee(
            @ModelAttribute("employee")
            Employee employee) {

        employeeService.save(employee);

        return "redirect:/employees";
    }


    // =========================================================
    // SHOW EDIT FORM
    // =========================================================

    @GetMapping("/edit/{id}")
    public String showEditForm(
            @PathVariable("id") Long id,
            Model model) {

        Employee employee =
                employeeService.getEmployeeById(id);

        model.addAttribute(
                "employee",
                employee
        );

        return "employee-form";
    }


    // =========================================================
    // DELETE EMPLOYEE
    // =========================================================

    @PostMapping("/delete/{id}")
    public String deleteEmployee(
            @PathVariable("id") Long id) {

        employeeService.deleteEmployee(id);

        return "redirect:/employees";
    }
}