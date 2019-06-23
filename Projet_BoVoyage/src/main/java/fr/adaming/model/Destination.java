package fr.adaming.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.OneToMany;

@SuppressWarnings("serial")
@Entity
public class Destination implements Serializable {

	// Attributes
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_dest")
	private int idDest;
	private String continent;
	private String country;
	private String city;
	private String description;
	private Boolean available;

	@Column(name = "photo_dest")
	@Lob
	private byte[] photo;

	// UML To Java Association's Transformation
	@OneToMany(mappedBy = "destination", cascade = { CascadeType.REMOVE, CascadeType.PERSIST })
	private List<FormulaTrip> formulaTrips;

	@OneToMany(mappedBy = "destination", cascade = { CascadeType.REMOVE, CascadeType.PERSIST })
	private List<Accommodation> accomodations;

	@OneToMany(mappedBy = "destination", cascade = { CascadeType.REMOVE, CascadeType.PERSIST })
	private List<Flight> flights;

	// Constructors
	public Destination() {
		super();
	}

	public Destination(String continent, String country, String city, String description, Boolean available,
			byte[] photo) {
		super();
		this.continent = continent;
		this.country = country;
		this.city = city;
		this.description = description;
		this.available = available;
		this.photo = photo;
	}

	public Destination(int idDest, String continent, String country, String city, String description, Boolean available,
			byte[] photo) {
		super();
		this.idDest = idDest;
		this.continent = continent;
		this.country = country;
		this.city = city;
		this.description = description;
		this.available = available;
		this.photo = photo;
	}

	// Getters & Setters
	public int getIdDest() {
		return idDest;
	}

	public void setIdDest(int idDest) {
		this.idDest = idDest;
	}

	public String getContinent() {
		return continent;
	}

	public void setContinent(String continent) {
		this.continent = continent;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public Boolean getAvailable() {
		return available;
	}

	public void setAvailable(Boolean available) {
		this.available = available;
	}

	public byte[] getPhoto() {
		return photo;
	}

	public void setPhoto(byte[] photo) {
		this.photo = photo;
	}

	public List<FormulaTrip> getFormulaTrips() {
		return formulaTrips;
	}

	public void setFormulaTrips(List<FormulaTrip> formulaTrips) {
		this.formulaTrips = formulaTrips;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public List<Accommodation> getAccomodations() {
		return accomodations;
	}

	public void setAccomodations(List<Accommodation> accomodations) {
		this.accomodations = accomodations;
	}

	public List<Flight> getFlights() {
		return flights;
	}

	public void setFlights(List<Flight> flights) {
		this.flights = flights;
	}

	@Override
	public String toString() {
		return "your destination: " + city + ", " + country;
	}

}
