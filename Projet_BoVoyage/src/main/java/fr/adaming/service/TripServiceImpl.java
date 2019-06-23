package fr.adaming.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import fr.adaming.dao.ITripDao;
import fr.adaming.model.Trip;

@Service
@Transactional
public class TripServiceImpl implements ITripService {
	
	ITripDao tripDao;

	@Autowired
	public void setDao(ITripDao daoToSet) {
		tripDao = daoToSet;
		tripDao.setClazz(Trip.class);
	}

	@Override
	public Trip getById(int id) {
		return tripDao.findOne(id);
	}

	@Override
	public List<Trip> getAll() {
		return tripDao.findAll();
	}

	@Override
	public int add(Trip trip) {
		return tripDao.create(trip);
	}

	@Override
	public int update(Trip trip) {
		return tripDao.update(trip);
	}

	@Override
	public int delete(Trip trip) {
		return tripDao.delete(trip);
	}
}
