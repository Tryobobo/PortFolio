package fr.adaming.service;

import java.util.List;

import fr.adaming.model.Destination;
import fr.adaming.model.Flight;

public interface IFlightService {

	public Flight getById(final int id);

	public List<Flight> getAll();

	public int add(final Flight flight);

	public int update(final Flight flight);

	public int delete(final Flight flight);
	
	public List<Flight> getFliByDestination(Destination destination);

}
