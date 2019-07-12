package io.ldnr.teamc.pizzeria.datas.user;

import java.util.Collection;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;



@Entity
@Table(name="user")
public class User {
	 @Id
	 @GeneratedValue(strategy = GenerationType.IDENTITY)
	 private Integer id;
	 
	    @NotNull
	    @Column(name = "nom", nullable = false)
	    private String nom;
	    
	    @NotNull
	    @Column(name = "prenom", nullable = true)
	    private String prenom;
	    
	  /*  @NotNull
	    @Column(name = "adresse", nullable = true)
	    private String adresse;
	    
	    @NotNull
	    @Column(name = "login", nullable = false, unique = true)
	    private String login;
	    
	    @NotNull
	    @Column(name = "passwd", nullable = false, unique = true)
	    private String passwd;
	    
	    @Column(name = "role", nullable = false)
	    private String role;*/

	    
	    @OneToMany(mappedBy="user_id", fetch = FetchType.LAZY)
	    private Collection<Commande> commandes;

	    
	    public User() {
	    	super();
	        this.nom = "";
	        this.prenom = "";


	    }
	    
	    public User(String nom, String prenom, String adresse, String login, String passwd, Collection<RoleEnum>roles ) {
	    	super();
	        this.nom = nom;
	        this.prenom = prenom;
	       /* this.adresse= adresse;
	        this.login=login;
	        this.passwd = passwd;	*/        
	    }
	    public void setNom(String nom) {
			this.nom = nom;
		}

	/*	public Integer getId() {
			return id;
		}

		public void setId(Integer id) {
			this.id = id;
		}

		public String getNom() {
			return nom;
		}

		public void setNom(String nom) {
			this.nom = nom;
		}

		public String getPrenom() {
			return prenom;
		}

		public void setPrenom(String prenom) {
			this.prenom = prenom;
		}

		public String getAdresse() {
			return adresse;
		}

		public void setAdresse(String adresse) {
			this.adresse = adresse;
		}

		public String getLogin() {
			return login;
		}

		public void setLogin(String login) {
			this.login = login;
		}

		public String getPasswd() {
			return passwd;
		}

		public void setPasswd(String passwd) {
			this.passwd = passwd;
		}


		public Collection<Commande> getCommandes() {
			return commandes;
		}

		public void setCommandes(Collection<Commande> commandes) {
			this.commandes = commandes;
		}*/


}
