package fr.adaming.dao;

import java.util.List;

import fr.adaming.model.Destination;
import fr.adaming.model.Flight;

public interface IFlightDao extends IGenericDao<Flight> {
	
	public List<Flight> getFliByDestination(Destination destination);

}
