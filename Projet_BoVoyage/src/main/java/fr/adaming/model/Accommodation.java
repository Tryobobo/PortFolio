package fr.adaming.model;

import java.io.Serializable;
import java.util.Arrays;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Transient;

@Entity
@SuppressWarnings("serial")
public class Accommodation implements Serializable {

	// Attributes
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_acc")
	private int idAcc;
	private String name;
	private String description;
	private double price;
	private String stars; 
	@Lob
	private byte[] photo;
	private int quantity;
	
	// UML To Java Association's Transformation
	@OneToMany(mappedBy = "accomodation", cascade = { CascadeType.REMOVE, CascadeType.PERSIST })
	private List<FormulaTrip> formulaTrips;
	
	@ManyToOne
	@JoinColumn(name = "dest_id", referencedColumnName = "id_dest")
	private Destination destination;

	// Constructors
	public Accommodation() {
		super();
	}

	public Accommodation(String name, double price, String stars, byte[] photo, int quantity,
			List<FormulaTrip> formulaTrips, Destination destination, String description) {
		super();
		this.name = name;
		this.price = price;
		this.stars = stars;
		this.photo = photo;
		this.quantity = quantity;
		this.formulaTrips = formulaTrips;
		this.destination = destination;
		this.description = description;
	}

	public Accommodation(int idAcc, String name, double price, String stars, byte[] photo, int quantity,
			List<FormulaTrip> formulaTrips, Destination destination, String description) {
		super();
		this.idAcc = idAcc;
		this.name = name;
		this.price = price;
		this.stars = stars;
		this.photo = photo;
		this.quantity = quantity;
		this.formulaTrips = formulaTrips;
		this.destination = destination;
		this.description = description;
	}


	// Getters & Setters
	public int getIdAcc() {
		return idAcc;
	}

	public void setIdAcc(int idAcc) {
		this.idAcc = idAcc;
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

	public byte[] getPhoto() {
		return photo;
	}

	public void setPhoto(byte[] photo) {
		this.photo = photo;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public List<FormulaTrip> getFormulaTrips() {
		return formulaTrips;
	}

	public void setFormulaTrips(List<FormulaTrip> formulaTrips) {
		this.formulaTrips = formulaTrips;
	}
	
	public String getStars() {
		return stars;
	}

	public void setStars(String stars) {
		this.stars = stars;
	}
	
	public Destination getDestination() {
		return destination;
	}

	public void setDestination(Destination destination) {
		this.destination = destination;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	// To String
	@Override
	public String toString() {
		return "Accommodation [idAcc=" + idAcc + ", name=" + name + ", price=" + price + ", stars=" + stars
				+ ", photo=" + Arrays.toString(photo) + ", quantity=" + quantity + "]";
	}




}
