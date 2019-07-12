package io.ldnr.teamc.pizzeria.datas.user;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Version;

import org.hibernate.annotations.Type;

import io.ldnr.teamc.pizzeria.datas.ingredient.Ingredient;
import io.ldnr.teamc.pizzeria.datas.pizza.Pizza;


@Entity
@Inheritance(strategy=InheritanceType.SINGLE_TABLE)
@Table(name="commande")
public class Commande {
	
	@Id
	@GeneratedValue (strategy = GenerationType.IDENTITY) @Column (name = "numero", unique = true, nullable = false) 
	private Integer numero ;
	
    @Temporal(TemporalType.TIMESTAMP)
	private Date date;
	
	@ManyToOne
	@JoinColumn(name="user_id")
	private User user_id;


	public Integer getNumero() {
		return numero;
	}

	public void setNumero(Integer numero) {
		this.numero = numero;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public User getUser_id() {
		return user_id;
	}

	public void setUser_id(User user_id) {
		this.user_id = user_id;
	}

	public Commande() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Commande(Integer numero) {
		super();
		this.numero = numero;

	}
	
	 @ManyToMany(fetch = FetchType.EAGER)
	 @JoinTable(name="pizza_commande",joinColumns=@JoinColumn(name="commande_numero"),
	 	inverseJoinColumns=@JoinColumn(name="pizza_id")
	 )
	 public Set<Pizza> pizzas = new HashSet<Pizza>();
	
	 
	 public void setPizzas(Set<Pizza> pizzas){
		 this.pizzas.addAll(pizzas);
	
	
		 
	 }
}
