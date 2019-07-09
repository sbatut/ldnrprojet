package io.ldnr.teamc.pizzeria.testdata;

import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("employee")
public class EmployeeController {
	 @Autowired
	 private EmployeeRepository repo;
	 
	 @Autowired
	 private CompanyRepository repoCompany;
	 
	 @Autowired
	 private EmployeeValidator employeeValidator;

	 @GetMapping
	 public String findAll(ModelMap pModel) {
	  pModel.addAttribute("listeemployees",repo.findAll());
	  return "test/listeemployee";
	 }
	 
	 @GetMapping(path = "{id}")
	 public String findById(ModelMap pModel,@PathVariable("id") int id) {
	     Optional<Employee> optEmployee = repo.findById(id);
	     if (!optEmployee.isPresent())
	     {
	    	 return "";
	     }
	     else
	     {
	    	 Employee employee = optEmployee.get();
	    	 pModel.addAttribute("employee",employee);
	    	 return "test/employee";
	     }
	 }
	 
	 @GetMapping(path= "newemployee")
	 public String postg(ModelMap pModel)
	 {
		 return "test/employeenew";
	 }
	 	 
	 
	 @PostMapping(path= "newemployee")
	 public String post(ModelMap pModel,@RequestParam Map<String,String> allParams) {
		 
		 if (allParams.containsKey("action") && allParams.get("action").equals("creer"))
		 {
		 
			 String lastName =allParams.get("lastName");
			 String firstName = allParams.get("firstName");
			 int id_company = Integer.parseInt(allParams.get("company"));
			 
			 Employee employee = new Employee();
			 employee.setFirstName(firstName);
			 employee.setLastName(lastName);
			 
			 Optional<Company> optcompany= repoCompany.findById(id_company);
			 if(optcompany.isPresent())
			 {
				 Company company = optcompany.get();
				 employee.setCompany(company);
				 repo.save(employee);
				 return "/test/employeenewresult";
			 }
			 else
			 {
				 return "/test/employeenew";
			 }
			 
		 }
		 else
		 {
			 return "/test/employeenew";
		 }
			
	 }
	 
	 //formulaire avec la gestion des erreur
	 @GetMapping(path= "newemployee2")
	 public String postg2(ModelMap pModel)
	 {
		 pModel.addAttribute("employeeForm", new Employee());
		 return "test/employeenew2";
	 }
	 
	 @PostMapping(path= "newemployee2")
	 public String post2(@ModelAttribute("employeeForm") Employee employee, BindingResult bindingResult) {
		 
	        employeeValidator.validate(employee, bindingResult);

	        if (bindingResult.hasErrors()) {
	            return "test/employeenew2";
	        }
	        
	        repo.save(employee);
	        
	        return "redirect:/";
			
	 }
	 
	 
	 
	 @GetMapping(path= "Deleteemployee")
	 public String post(ModelMap pModel,@RequestParam String id ) 
	 {
		 int idemployee = Integer.parseInt(id);
		 Optional<Employee> Optemployee = repo.findById(idemployee);
		 if(Optemployee.isPresent())
		 {
			 repo.deleteById(idemployee);
		 }
		 return  "test/employeenew";
	 }
	 
	 @GetMapping(path= "listeDelUpdemployee")
	 public String post(ModelMap pModel) 
	 {
		  pModel.addAttribute("listeemployees",repo.findAll());
		  return "test/listeDelUpdemployee";
	 }
	 

	 @PutMapping
	 public ResponseEntity<?> put(@RequestBody Employee entity) {
		 if ( entity.getCompany()!=null && checkCompany(entity))
		 {
			 repo.save(entity);
			 return ResponseEntity.ok().body(entity);
		 }
		 else
		 {
			 return ResponseEntity.status(404).body("La company n'existe pas impossible de la creer");
		 }
	 }
	 
	 private boolean checkCompany(Employee employee)
	 {
		 boolean bresult = false;
		 if (employee.getCompany()!=null && employee.getCompany().getId()!=null)
		 {
			 bresult = repoCompany.existsById(employee.getCompany().getId());
		 }
		 
		 return bresult;
		 
	 }
	 
	 @PostMapping(path = "{id}/addresses")
	 public ResponseEntity<?>  putAddress(@PathVariable("id") int id,@RequestBody Address address) {
		 Optional<Employee> employeeOpt = repo.findById(id);
		 Employee employee=null;
		 if (!employeeOpt.isPresent())
		 {
			 return ResponseEntity.notFound().build();
		 }
		 else
		 {
			 employee = employeeOpt.get();
			 employee.addAddress(address);
			 repo.save(employee);
			 return ResponseEntity.created(null).build();
		 }

	 }
	 
	 @DeleteMapping(path = "{id-employee}/addresses/{id-address}")
	 public ResponseEntity<?> delAddress(@PathVariable("id-employee") int idEmployee,@PathVariable("id-address") int idAddress) {
		 Optional<Employee> employeeOpt = repo.findById(idEmployee);
		 Employee employee=null;
		 if (employeeOpt.isPresent())
		 {
			 employee = employeeOpt.get();
			 
			 /*
			 for(Iterator<Address> it = employee.getAddress().iterator();it.hasNext();)
			 {
				 Address address = it.next();
				 if(address.getId()==idAddress)
				 {
					 it.remove();
					 
				 }
			 }
			 */
					 
		 	boolean bok=employee.getAddress().removeIf(address->address.getId().equals(idAddress));
		 	
		 	if (bok)
		 	{
		 		repo.save(employee);
		 		return ResponseEntity.ok().build();
		 	}
		 	else
		 	{
		 		return ResponseEntity.notFound().build();
		 	}
		 				 
		 }
		 else
		 {
			 return ResponseEntity.notFound().build();
		 }
	 }

	 
	 @GetMapping("search")
	 public ResponseEntity<?> searchByLastName(@Nullable @RequestParam("firstName") String firstName, @Nullable @RequestParam("lastName") String lastName) {
		 if (firstName==null)
		 {
			 if(lastName==null)
				 return  ResponseEntity.ok().body(repo.findAll());
			 else
				 return ResponseEntity.ok().body(repo.findByLastName(lastName));
		 }
		 else
		 {
			 if(lastName==null)
				 return ResponseEntity.ok().body(repo.findByFirstName(firstName));
			 else
				 return ResponseEntity.ok().body(repo.findByFirstNameAndLastName(firstName, lastName));
		 }
	 }

	 @DeleteMapping("{id}")
	 public void delete(@PathVariable("id") Integer id) {
	 repo.deleteById(id);
	 }
}
