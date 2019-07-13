package io.ldnr.teamc.pizzeria.datas.user;

import java.security.NoSuchAlgorithmException;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;

import io.ldnr.teamc.pizzeria.usersecurity.UsersecurityController;

@Controller
//@SessionAttributes("SESSION_USER");
public class UserController {

	@Autowired
	private UserRepository userRepo;


	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView showFormLogin() {

		return new ModelAndView("/users/userLogin", "loginAction", new User());
	}

	@RequestMapping(value = "/inscription", method = RequestMethod.GET)
	public ModelAndView showFormInscription() {

		return new ModelAndView("/users/userInscription", "addformAction", new User());
	}

	
	@PostMapping("/addformAction")
	public String submitFormInscription(@ModelAttribute("addformAction") @Valid User user, BindingResult result,
			Model model, @RequestParam Map<String, String> paramLogin, WebRequest wRequest) throws NoSuchAlgorithmException {
		
		/**
		 * Verifie si login existe en BD
		 */
		String loginPost = (paramLogin.get("login"));
		User u = userRepo.findByLogin(loginPost);

		// si l'utilisateur n'est pas en BD Error page
		if (u != null) {
			return "users/userErrorLoginExist";
		}
		
		
		
		if (result.hasErrors()) {
			return "users/userErrorInscription";
		}

		String secPwd = user.getPasswd();
		String securityPwd = UsersecurityController.getMD5Pwd(secPwd);
		user.setPasswd(securityPwd);

		User user1 = userRepo.save(user);
		model.addAttribute("user", user1);

		model.addAttribute("nom", user.getNom());
		model.addAttribute("prenom", user.getPrenom());
		model.addAttribute("login", user.getLogin());
		model.addAttribute("passwd", user.getPasswd());
		model.addAttribute("id", user.getId());
		model.addAttribute("adresse", user.getAdresse());
		model.addAttribute("role", user.getRole());

		return "/users/userSuccessInscription";

	}
	
	

	@PostMapping("/loginAction")
	
	public String SelectUserBylogin(@ModelAttribute("loginAction") @Valid User user, BindingResult result,
			ModelMap model, @RequestParam Map<String, String> paramLogin, WebRequest wRequest) throws NoSuchAlgorithmException {

		String loginPost = (paramLogin.get("login"));
		String pwdPost = (paramLogin.get("passwd"));

		// requete en BD
		User u = userRepo.findByLogin(loginPost);

		// si l'utilisateur n'est pas en BD Error page
		if (u == null) {
			return "users/userErrorLogin";
		}
		
		

		// petite vérif du login
		if (u.getLogin().isEmpty()  || u.getLogin() == null) {
			return "users/userErrorLogin";
		}

		// recup le role et pwd user en BD
		String pwdIn = u.getPasswd();
		String roleIn = u.getRole();
		String loginIn = u.getLogin();

		// UsersecurityController us = new UsersecurityController();
		String securityPwd = UsersecurityController.getMD5Pwd(pwdPost);

		// comparer les 2 mots de passe en BD et celui saisi par user
		if (!securityPwd.equals(pwdIn) || pwdIn.isEmpty()) {
			return "users/userErrorLogin";
		}

		if (loginPost.isEmpty()) {
			// do something
		}

		// data pour affichage en Front
		model.addAttribute("pwdIn", u.getPasswd());
		model.addAttribute("roleIn", u.getRole());
		model.addAttribute("loginIn", u.getLogin());
		model.addAttribute("nom", u.getNom());
		model.addAttribute("prenom", u.getPrenom());
		model.addAttribute("pwdposted", pwdPost);

		// Dispaching en fonction de l'utilisateur connecté
		if (roleIn.equals("USER")) {
			wRequest.setAttribute("SESSION_USER", u, WebRequest.SCOPE_SESSION);
			wRequest.removeAttribute("SESSION_ADMIN", WebRequest.SCOPE_SESSION);
			return "redirect:/";
		} else if (roleIn.equals("ADMINISTRATOR")) {
			wRequest.setAttribute("SESSION_ADMIN", u, WebRequest.SCOPE_SESSION);
			wRequest.removeAttribute("SESSION_USER", WebRequest.SCOPE_SESSION);
			return "redirect:/gerant/carte";
		} else {
			return "/users/userErrorLogin";
		}
		
	}
	
	// Déconnexion User
	@GetMapping(value="/logout_user")
	public String LogoutUser(@ModelAttribute User user, WebRequest wRequest) {
	wRequest.removeAttribute("SESSION_USER", WebRequest.SCOPE_SESSION);
	return "/connexionUsers/connexionLogout";
	}
	
	// Déconnexion Admin
	@GetMapping(value="/logout_admin")
	public String LogoutAdmin(@ModelAttribute User user, WebRequest wRequest) {
	wRequest.removeAttribute("SESSION_ADMIN", WebRequest.SCOPE_SESSION);
	return "/connexionUsers/connexionLogout";
	}

	
	

	
	

	/*
	 * 
	 * //Model m =model.addAttribute("login",user);
	 * 
	 * User u = new User();
	 * 
	 * //User u = userRepo.findByLogin("login");
	 * 
	 * 
	 * 
	 * if (result.hasErrors()) { return "users/userErrorLogin"; }
	 * 
	 * 
	 * String loginUser = u.getLogin(); String pwdUser = u.getPasswd(); String
	 * roleUser = u.getRole(); String nom = u.getLogin();
	 * 
	 * model.addAttribute("login", user.getLogin()); model.addAttribute("passwd",
	 * user.getPasswd());
	 * 
	 * if(pwdUser.isEmpty()) { // do something } if(loginUser.isEmpty()) { // do
	 * something }
	 * 
	 * 
	 * /* //User infosUser = userRepo.findByLogin(loginUser);
	 * 
	 * if("ok") // session USer connecté String userSession = "ok";
	 * 
	 * setAttribute("paramUser",infosUser);
	 * 
	 * Object info = getAttribute("paramUser"); // retourne objet
	 *
	 * /
	 * 
	 * if (roleUser.equals("USER")) { return
	 * "redirect:/connexionUsers/connexionUserOk"; } else if
	 * (roleUser.equals("ADMINISTRATOR")) { return
	 * "redirect:/connexionUsers/connexionAdminOk"; } else { //return
	 * "redirect:/users/userLogin"; //return "/users/userSuccessInscription"; }
	 * 
	 * return "/users/userSuccessInscription";
	 * 
	 * }
	 */

	/*
	 * // User
	 * 
	 * @GetMapping("/connexionUserOk") //public String inscription
	 * (HttpServletRequest request, ModelMap modelMap) { public String loginx2
	 * (@RequestParam(required=false, defaultValue="userConnecte") String userlogin,
	 * ModelMap modelMap) { // testé session USer connecté
	 * 
	 * return "redirect:/pagesUser/"; }
	 * 
	 * 
	 * // Admin
	 * 
	 * @GetMapping("/connexionAdminOk") //public String inscription
	 * (HttpServletRequest request, ModelMap modelMap) { public String loginx
	 * (@RequestParam(required=false, defaultValue="toto") String userlogin,
	 * ModelMap modelMap) { // testé session USer connecté
	 * 
	 * return "redirect:/pagesUser/"; }
	 */

	/*
	 * @GetMapping(path = "users/userSuccess") //public String inscription
	 * (@RequestParam(required=false, defaultValue="toto") String name, String
	 * prenom, ModelMap modelMap) { public String formInfos(ModelMap
	 * pModel,@RequestParam Map<String,String> userInfos) {
	 * 
	 * userInfos.put("nom", userInfos.get("userlastname")); userInfos.put("prenom",
	 * userInfos.get("userfirstname")); userInfos.put("email",
	 * userInfos.get("email")); userInfos.put("login", userInfos.get("username"));
	 * userInfos.put("pwd", userInfos.get("password")); userInfos.put("pwdConfirm",
	 * userInfos.get("cpassword"));
	 * 
	 * return "/users/userSuccessInscription"; }
	 */
}
