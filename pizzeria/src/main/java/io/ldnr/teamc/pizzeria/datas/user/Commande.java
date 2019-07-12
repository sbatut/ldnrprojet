package io.ldnr.teamc.pizzeria.datas.user;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Version;

import org.hibernate.annotations.Type;


@Entity
@Table(name="commande")
public class Commande {
	
	@Id
	private Integer numero ;
	
	 @Version
	    //@Type(type = "dbtimestamp")
	//private Date date;
	 @Temporal(TemporalType.TIMESTAMP)
    private Date date;
	
	@ManyToOne
	@JoinColumn(name="user_id")
	private User user_id;
	
	// Ajout du status de la commande (dernière colonne en base)
	private String status;


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
	
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
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
