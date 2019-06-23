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

@Entity
@SuppressWarnings("serial")
public class Insurance implements Serializable {

	// Attributes
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_insu")
	private int idInsu;
	private String name;
	private double price;

	// UML To Java Association's Transformation
	@OneToMany(mappedBy = "insurance", cascade = { CascadeType.REMOVE, CascadeType.PERSIST })
	private List<FormulaTrip> formulaTrips;

	// Constructors
	public Insurance() {
		super();
	}

	public Insurance(String name, double price) {
		super();
		this.name = name;
		this.price = price;
	}

	public Insurance(int idInsu, String name, double price) {
		super();
		this.idInsu = idInsu;
		this.name = name;
		this.price = price;
	}

	// Getters & Setters
	public int getIdInsu() {
		return idInsu;
	}

	public void setIdInsu(int idInsu) {
		this.idInsu = idInsu;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public List<FormulaTrip> getFormulaTrips() {
		return formulaTrips;
	}

	public void setFormulaTrips(List<FormulaTrip> formulaTrips) {
		this.formulaTrips = formulaTrips;
	}

	@Override
	public String toString() {
		return "You chose the following: " + name + "Assurance, at the cost of " + price + " euros";
	}

}
