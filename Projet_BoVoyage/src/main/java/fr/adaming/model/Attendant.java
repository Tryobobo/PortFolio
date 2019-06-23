package fr.adaming.model;

import java.util.Date;
import java.util.List;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.ManyToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@SuppressWarnings("serial")
// Save values dans la même table
@DiscriminatorValue(value = "Attendant")
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@Entity
public class Attendant extends Person {

	// Attributes
	protected String name;
	protected String firstname;
	protected String civility;
	@Temporal(TemporalType.DATE)
	protected Date dob;
	protected String phone;

	@ManyToMany(mappedBy = "attendants")
	private List<Trip> trips;

	// Constructors
	public Attendant() {
		super();
	}

	public Attendant(String mail, String name, String firstname, String civility, Date dob, String phone) {
		super(mail);
		this.name = name;
		this.firstname = firstname;
		this.civility = civility;
		this.dob = dob;
		this.phone = phone;
	}

	public Attendant(int id, String mail, String name, String firstname, String civility, Date dob, String phone) {
		super(id, mail);
		this.name = name;
		this.firstname = firstname;
		this.civility = civility;
		this.dob = dob;
		this.phone = phone;
	}

	// Getters & Setters
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getCivility() {
		return civility;
	}

	public void setCivility(String civility) {
		this.civility = civility;
	}

	public Date getDob() {
		return dob;
	}

	public void setDob(Date dob) {
		this.dob = dob;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public List<Trip> getTrips() {
		return trips;
	}

	public void setTrips(List<Trip> trips) {
		this.trips = trips;
	}

	// To String
	@Override
	public String toString() {
		return "Attendant [name=" + name + ", firstname=" + firstname + ", civility=" + civility + ", dob=" + dob
				+ ", phone=" + phone + ", id=" + id + ", mail=" + mail + "]";
	}

}
