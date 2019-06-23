package fr.adaming.model;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Embeddable;

@Embeddable
@Access(AccessType.FIELD)
public class Address {

	// Attributes
	private String adressName;
	private String city;
	private String postalCode;

	// Constructors
	public Address() {
		super();
	}

	public Address(String adressName, String city, String postalCode) {
		super();
		this.adressName = adressName;
		this.city = city;
		this.postalCode = postalCode;
	}

	public String getAdressName() {
		return adressName;
	}

	public void setAdressName(String adressName) {
		this.adressName = adressName;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getPostalCode() {
		return postalCode;
	}

	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}

}
