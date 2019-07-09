package io.ldnr.teamc.pizzeria.testdata;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("company")
public class CompanyController {
 @Autowired
 private CompanyRepository repo;

 @GetMapping
 public Iterable<Company> findAll() {
 return repo.findAll();
 }
 
 @GetMapping(path = "{id}")
 public ResponseEntity<?> findById(@PathVariable("id") int id) {
     Optional<Company> optCompany = repo.findById(id);
     if (!optCompany.isPresent())
     {
    	 return ResponseEntity.notFound().build();
     }
     else
     {
    	 Company company = optCompany.get();
    	 return ResponseEntity.ok().body(company);
     }
 }
 
 @PostMapping
 public Company post(@RequestBody Company entity) {
	 return repo.save(entity);
 }

 @PutMapping
 public Company put(@RequestBody Company entity) {
 return repo.save(entity);
 }

 @DeleteMapping("{id}")
 public void delete(@PathVariable("id") Integer id) {
 repo.deleteById(id);
 }
} 
