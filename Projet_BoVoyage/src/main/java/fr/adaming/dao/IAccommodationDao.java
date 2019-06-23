package fr.adaming.dao;

import java.util.List;

import fr.adaming.model.Accommodation;
import fr.adaming.model.Destination;

public interface IAccommodationDao extends IGenericDao<Accommodation>{
	
	public List<Accommodation> getAccByDestination(Destination destination);
}
