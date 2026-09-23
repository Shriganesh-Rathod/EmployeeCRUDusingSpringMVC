package employeecrud.service;

import employeecrud.entity.Employee;
import employeecrud.repository.EmployeeRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class EmployeeService {

    private final EmployeeRepository employeeRepository;

    public EmployeeService(EmployeeRepository employeeRepository) {

        this.employeeRepository = employeeRepository;
    }

    @Transactional
    public Employee save(Employee employee) {

        return employeeRepository.save(employee);
    }

    @Transactional(readOnly = true)
    public List<Employee> getAllEmployees() {

        return employeeRepository.findAll();
    }

    @Transactional(readOnly = true)
    public Employee getEmployeeById(Long id) {

        return employeeRepository.findById(id);
    }

    @Transactional
    public void deleteEmployee(Long id) {

        employeeRepository.deleteById(id);
    }
}