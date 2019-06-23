package fr.adaming.model;

import java.util.List;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.OneToMany;

@SuppressWarnings("serial")
// Save values dans la même table
@DiscriminatorValue(value = "Admin")
@Entity
public class Admin extends Person {

	// Attributes
	private boolean active;
	private String password;

	@OneToMany(mappedBy = "person")
	private List<Role> roles;

	// Constructors
	public Admin() {
		super();
	}

	public Admin(int id, String mail, String password) {
		super(id, mail);
		this.password = password;
	}

	public Admin(String mail, String password) {
		super(mail);
		this.password = password;
	}

	// Getters & Setters
	public String getpassword() {
		return password;
	}

	public void setpassword(String password) {
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
