package io.ldnr.teamc.pizzeria.datas.user;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class UserController {

	@GetMapping("/login")
	//public String inscription (HttpServletRequest request, ModelMap modelMap) {
		public String login (@RequestParam(required=false, defaultValue="toto") String userlogin, ModelMap modelMap) {
		
		modelMap.put("userlogin", userlogin);
		
	
			return "/users/userLogin";
		}
	
	@GetMapping("/inscription")
		public String inscription (@RequestParam(required=false, defaultValue="toto") String name, String prenom, ModelMap modelMap) {
		
		modelMap.put("name", name);
		modelMap.put("prenom",prenom);
	
			return "/users/userInscription";
		}
	
}
