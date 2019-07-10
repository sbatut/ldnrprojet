package io.ldnr.teamc.pizzeria.datas.user;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Version;

import org.hibernate.annotations.Type;


@Entity
@Inheritance(strategy=InheritanceType.SINGLE_TABLE)
public class Commande {
	
	@Id
	private Integer numero ;
	
	 @Version
	    @Type(type = "dbtimestamp")
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
	
}
