package fr.adaming.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

@SuppressWarnings("serial")
@Entity
public class FormulaTrip implements Serializable {

	// Attributes
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_formtrip")
	private int id;
	private String nameFormTrip;
	private double rate;
	private boolean carRental;

	// UML To Java Association's Transformation
	@ManyToOne
	@JoinColumn(name = "acc_id", referencedColumnName = "id_acc")
	private Accommodation accomodation;
	@ManyToOne
	@JoinColumn(name = "dest_id", referencedColumnName = "id_dest")
	private Destination destination;
	@ManyToOne
	@JoinColumn(name = "formacc_id", referencedColumnName = "id_formacc")
	private FormulaAccomodation formulaAccomodation;
	@ManyToOne
	@JoinColumn(name = "insu_id", referencedColumnName = "id_insu")
	private Insurance insurance;
	@ManyToOne
	@JoinColumn(name = "flight_id", referencedColumnName = "id_flight")
	private Flight flight;
	@OneToOne
	@JoinColumn(name = "trip_id", referencedColumnName = "id_trip")
	private Trip trip;

	// Constructors
	public FormulaTrip() {
		super();
	}

	public FormulaTrip(String nameFormTrip, double rate, Accommodation accomodation, Destination destination,
			FormulaAccomodation formulaAccomodation, Insurance insurance, boolean carRental) {
		super();
		this.nameFormTrip = nameFormTrip;
		this.rate = rate;
		this.accomodation = accomodation;
		this.destination = destination;
		this.formulaAccomodation = formulaAccomodation;
		this.insurance = insurance;
		this.carRental = carRental;
	}

	public FormulaTrip(int id, String nameFormTrip, double rate, Accommodation accomodation, Destination destination,
			FormulaAccomodation formulaAccomodation, Insurance insurance, boolean carRental) {
		super();
		this.id = id;
		this.nameFormTrip = nameFormTrip;
		this.rate = rate;
		this.accomodation = accomodation;
		this.destination = destination;
		this.formulaAccomodation = formulaAccomodation;
		this.insurance = insurance;
		this.carRental = carRental;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNameFormTrip() {
		return nameFormTrip;
	}

	public void setNameFormTrip(String nameFormTrip) {
		this.nameFormTrip = nameFormTrip;
	}

	public double getRate() {
		return rate;
	}

	public void setRate(double rate) {
		this.rate = rate;
	}

	public Accommodation getAccomodation() {
		return accomodation;
	}

	public void setAccomodation(Accommodation accomodation) {
		this.accomodation = accomodation;
	}

	public Destination getDestination() {
		return destination;
	}

	public void setDestination(Destination destination) {
		this.destination = destination;
	}

	public FormulaAccomodation getFormulaAccomodation() {
		return formulaAccomodation;
	}

	public void setFormulaAccomodation(FormulaAccomodation formulaAccomodation) {
		this.formulaAccomodation = formulaAccomodation;
	}

	public Insurance getInsurance() {
		return insurance;
	}

	public void setInsurance(Insurance insurance) {
		this.insurance = insurance;
	}

	public Trip getTrip() {
		return trip;
	}

	public void setTrip(Trip trip) {
		this.trip = trip;
	}

	public boolean isCarRental() {
		return carRental;
	}

	public void setCarRental(boolean carRental) {
		this.carRental = carRental;
	}
	
	public Flight getFlight() {
		return flight;
	}

	public void setFlight(Flight flight) {
		this.flight = flight;
	}

	@Override
	public String toString() {
		return "FormulaTrip [id=" + id + ", nameFormTrip=" + nameFormTrip + ", rate=" + rate + ", accomodation="
				+ accomodation + ", destination=" + destination + ", formulaAccomodation=" + formulaAccomodation
				+ ", insurance=" + insurance + "]";
	}

}
