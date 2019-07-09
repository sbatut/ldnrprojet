
package io.ldnr.teamc.pizzeria.zzztestdata.exemple.company.employee;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

public interface EmployeeRepository extends CrudRepository<Employee, Integer>  {
	List<Employee> findByLastName(String lastName);
	List<Employee> findByFirstName(String firstName);
	List<Employee> findByFirstNameAndLastName(String firstName, String lastName); 
}
