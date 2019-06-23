package fr.adaming.service;

import java.util.List;

import fr.adaming.model.Destination;

public interface IDestinationService {

	public Destination getById(final int id);

	public List<Destination> getAll();

	public int add(final Destination destination);

	public int update(final Destination destination);

	public int delete(final Destination destination);

	public List<Destination> getDestinationByContinent(String continent);
	
	public List<Destination> getDestinationByKW(String kw); 

}
