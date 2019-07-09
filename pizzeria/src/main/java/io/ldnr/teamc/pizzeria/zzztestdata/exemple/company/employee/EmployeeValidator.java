package io.ldnr.teamc.pizzeria.zzztestdata.exemple.company.employee;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class EmployeeValidator implements Validator {
	 @Autowired
	 private EmployeeRepository repo;
	 
	 @Autowired
	 private EmployeeRepository repocompany;
	 
	    @Override
	    public boolean supports(Class<?> aClass) {
	        return Employee.class.equals(aClass);
	    }

	    @Override
	    public void validate(Object o, Errors errors) {
	        Employee employee = (Employee) o;
	        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "firstName", "NotEmpty");
	        
	        if (employee.getCompany()==null)
	        {
	        	errors.rejectValue("company", "NotExistCompany");
	        }
	        
	    }
}
