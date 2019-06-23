package fr.adaming.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.OneToMany;

@SuppressWarnings("serial")
@DiscriminatorValue(value = "Counsellor")
@Entity
public class Counsellor extends Person implements Serializable {

	// Attributes
	private String password;

	private boolean active;

	@OneToMany(mappedBy = "person")
	private List<Role> roles;

	// Constructors
	public Counsellor() {
		super();
	}

	public Counsellor(int id, String mail, String password) {
		super(id, mail);
		this.password = password;
	}

	public Counsellor(String mail, String password) {
		super(mail);
		this.password = password;
	}

	// Getters & Setters
	public String getMdpCo() {
		return password;
	}

	public void setMdpCo(String password) {
		this.password = password;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public List<Role> getRoles() {
		return roles;
	}

	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}

}
