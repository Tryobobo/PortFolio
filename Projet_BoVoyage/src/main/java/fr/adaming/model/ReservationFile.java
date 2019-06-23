package fr.adaming.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

@SuppressWarnings("serial")
@Entity
public class ReservationFile implements Serializable {

	// Attributes
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_rf")
	private int id;
	private String status;

	@OneToOne
	@JoinColumn(name = "trip_id", referencedColumnName = "id_trip")
	private Trip tripRf;

	public ReservationFile() {
		super();
	}

	public ReservationFile(int id, String status, Trip tripRf) {
		super();
		this.id = id;
		this.status = status;
		this.tripRf = tripRf;
	}

	public ReservationFile(String status, Trip tripRf) {
		super();
		this.status = status;
		this.tripRf = tripRf;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Trip getTripRf() {
		return tripRf;
	}

	public void setTripRf(Trip tripRf) {
		this.tripRf = tripRf;
	}

}
