package fr.adaming.dao;

import java.util.List;

import fr.adaming.model.Destination;

public interface IDestinationDao extends IGenericDao<Destination>{

	public List<Destination> getDestinationByContinent(String continent);
	
	public List<Destination> getDestinationByKW(String kw) ;
}
