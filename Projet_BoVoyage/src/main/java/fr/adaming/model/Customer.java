package fr.adaming.model;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.OneToMany;

@SuppressWarnings("serial")
@DiscriminatorValue(value = "Customer")
@Entity
public class Customer extends Attendant {

	// Attributes
	private String password;
	private boolean active;

	@Embedded
	protected Address address;

	@OneToMany(mappedBy = "customerTrip", cascade = { CascadeType.REMOVE, CascadeType.PERSIST })
	private List<Trip> tripsCusto;

	@OneToMany(mappedBy = "person")
	private List<Role> roles;

	// Constructors
	public Customer() {
		super();
	}

	public Customer(int id, String mail, String name, String firstname, String civility, Date dob, String phone,
			String password, Address address) {
		super(id, mail, name, firstname, civility, dob, phone);
		this.password = password;
		this.address = address;
	}

	public Customer(String mail, String name, String firstname, String civility, Date dob, String phone,
			String password, Address address) {
		super(mail, name, firstname, civility, dob, phone);
		this.password = password;
		this.address = address;
	}

	// Getters & Setters

	public boolean isActive() {
		return active;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public List<Trip> getTrips() {
		return tripsCusto;
	}

	public void setTrips(List<Trip> trips) {
		this.tripsCusto = trips;
	}

	public List<Role> getRoles() {
		return roles;
	}

	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}

	// To String
	@Override
	public String toString() {
		return "Customer [mdpCus=" + password + ", active=" + active + ", address=" + address + ", trips=" + tripsCusto
				+ ", roles=" + roles + "]";
	}

}
