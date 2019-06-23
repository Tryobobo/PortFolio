package fr.adaming.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@SuppressWarnings("serial")
@Entity
public class FormulaAccomodation implements Serializable {

	// Attributes
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_formacc")
	private int id;
	private String nameFormAcc;
	private double rate;

	// UML To Java Association's Transformation
	@OneToMany(mappedBy = "formulaAccomodation", cascade = { CascadeType.REMOVE, CascadeType.PERSIST })
	private List<FormulaTrip> formulaTrips;

	// Constructors
	public FormulaAccomodation() {
		super();
	}

	public FormulaAccomodation(int id, String nameFormAcc, double rate) {
		super();
		this.id = id;
		this.nameFormAcc = nameFormAcc;
		this.rate = rate;
	}

	public FormulaAccomodation(String nameFormAcc, double rate) {
		super();
		this.nameFormAcc = nameFormAcc;
		this.rate = rate;
	}

	// Getters & Setters
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNameFormAcc() {
		return nameFormAcc;
	}

	public void setNameFormAcc(String nameFormAcc) {
		this.nameFormAcc = nameFormAcc;
	}

	public double getRate() {
		return rate;
	}

	public void setRate(double rate) {
		this.rate = rate;
	}

	public List<FormulaTrip> getFormulaTrips() {
		return formulaTrips;
	}

	public void setFormulaTrips(List<FormulaTrip> formulaTrips) {
		this.formulaTrips = formulaTrips;
	}

	@Override
	public String toString() {
		return "FormulaAccomodation [id=" + id + ", nameFormAcc=" + nameFormAcc + "]";
	}

}
