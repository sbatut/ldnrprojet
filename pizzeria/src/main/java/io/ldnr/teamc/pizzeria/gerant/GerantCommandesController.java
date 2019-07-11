package io.ldnr.teamc.pizzeria.gerant;

import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import io.ldnr.teamc.pizzeria.datas.ingredient.Ingredient;
import io.ldnr.teamc.pizzeria.datas.ingredient.IngredientRepository;
import io.ldnr.teamc.pizzeria.datas.user.CommandeRepository;



@Controller
@RequestMapping("gerant")
public class GerantCommandesController {
	
	 @Autowired
	 private CommandeRepository repoCommande;
	
	 
	 @GetMapping(path = "commandes")
	 public String gestionCommandes(ModelMap pModel) {
	  pModel.addAttribute("listecommandes",repoCommande.findAll());
	  return "gerant/gestioncommandes";
	 }
	 	
}
