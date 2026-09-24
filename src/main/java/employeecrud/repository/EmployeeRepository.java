package employeecrud.repository;

import employeecrud.entity.Employee;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class EmployeeRepository {

    @PersistenceContext
    private EntityManager entityManager;

    public Employee save(Employee employee) {

        if (employee.getId() == null) {
            entityManager.persist(employee);
            return employee;
        }

        return entityManager.merge(employee);
    }

    public List<Employee> findAll() {

        return entityManager
                .createQuery("SELECT e FROM Employee e", Employee.class)
                .getResultList();
    }

    public Employee findById(Long id) {

        return entityManager.find(Employee.class, id);
    }

    public void deleteById(Long id) {

        Employee employee = entityManager.find(Employee.class, id);

        if (employee != null) {
            entityManager.remove(employee);
        }
    }
}