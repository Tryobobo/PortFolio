package fr.adaming.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@SuppressWarnings("serial")
@Entity
public class Role implements Serializable {

	// Attributs
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_r")
	private int idRole;
	private String roleName;

	// Transformation de l'association UML en Java
	@ManyToOne
	@JoinColumn(name = "p_id", referencedColumnName = "id")
	private Person person;

	// Constructeur
	public Role() {
		super();
	}

	public Role(String roleName, Person person) {
		super();
		this.roleName = roleName;
		this.person = person;
	}



	// Getters & Setters
	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public int getIdRole() {
		return idRole;
	}

	public void setIdRole(int idRole) {
		this.idRole = idRole;
	}

	public Person getAdmin() {
		return person;
	}

	public void setAdmin(Person admin) {
		this.person = admin;
	}

}