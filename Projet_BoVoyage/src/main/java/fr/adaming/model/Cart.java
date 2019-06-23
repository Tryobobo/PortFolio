package fr.adaming.model;

import java.io.Serializable;
import java.util.List;

@SuppressWarnings("serial")
public class Cart implements Serializable {

	// Attibutes
	private List<Trip> trips;
	private Customer customer;
	
	// Constructors
	public Cart() {
		super();
	}

	public Cart(List<Trip> trips, Customer customer) {
		super();
		this.trips = trips;
	}

	// Getters & Setters
	public List<Trip> getTrips() {
		return trips;
	}

	public void setTrips(List<Trip> trips) {
		this.trips = trips;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	
}
