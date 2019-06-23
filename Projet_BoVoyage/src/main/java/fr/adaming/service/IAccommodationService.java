package fr.adaming.service;

import java.util.List;

import fr.adaming.model.Accommodation;
import fr.adaming.model.Destination;

public interface IAccommodationService {

	public Accommodation getById(final int id);
	 
	   public List<Accommodation> getAll();
	 
	   public int add(final Accommodation accommodation);
	 
	   public int update(final Accommodation accommodation);
	 
	   public int delete(final Accommodation accommodation);
	   
		public List<Accommodation> getAccByDestination(Destination destination);
}
