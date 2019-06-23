package fr.adaming.service;

import java.util.List;

import fr.adaming.model.Trip;

public interface ITripService {

	public Trip getById(final int id);

	public List<Trip> getAll();

	public int add(final Trip trip);

	public int update(final Trip trip);

	public int delete(final Trip trip);
}
