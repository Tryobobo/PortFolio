package fr.adaming.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

@SuppressWarnings("serial")
@Entity
public class Trip implements Serializable {

	// Attributes
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_trip")
	private int idTrip;

	@ManyToOne
	@JoinColumn(name = "cus_id", referencedColumnName = "id")
	private Person customerTrip;

	@OneToOne
	@JoinColumn(name = "rf_id", referencedColumnName = "id_rf")
	private ReservationFile reservationFile;

	@OneToOne
	@JoinColumn(name = "formtrip_id", referencedColumnName = "id_formtrip")
	private FormulaTrip formulaTrip;

	@ManyToMany
	@JoinTable(name = "tab_asso_attend_trip", joinColumns = @JoinColumn(name = "trip_id"), inverseJoinColumns = @JoinColumn(name = "attend_id"))
	private List<Person> attendants;

	public Trip() {
		super();
	}

	public Trip(Person customer, FormulaTrip formulaTrip, List<Person> attendants) {
		super();
		this.customerTrip = customer;
		this.formulaTrip = formulaTrip;
		this.attendants = attendants;
	}

	public Trip(int idTrip, Person customer, FormulaTrip formulaTrip, List<Person> attendants) {
		super();
		this.idTrip = idTrip;
		this.customerTrip = customer;
		this.formulaTrip = formulaTrip;
		this.attendants = attendants;
	}

	public int getIdTrip() {
		return idTrip;
	}

	public void setIdTrip(int idTrip) {
		this.idTrip = idTrip;
	}

	public Person getCustomer() {
		return customerTrip;
	}

	public void setCustomer(Person customer) {
		this.customerTrip = customer;
	}

	public FormulaTrip getFormulaTrip() {
		return formulaTrip;
	}

	public void setFormulaTrip(FormulaTrip formulaTrip) {
		this.formulaTrip = formulaTrip;
	}

	public List<Person> getAttendants() {
		return attendants;
	}

	public void setAttendants(List<Person> attendants) {
		this.attendants = attendants;
	}

}
