package fr.adaming.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import fr.adaming.dao.IFlightDao;
import fr.adaming.model.Destination;
import fr.adaming.model.Flight;

@Service
@Transactional
public class FlightServiceImpl implements IFlightService {

	IFlightDao flDao;

	@Autowired
	public void setDao(IFlightDao daoToSet) {
		flDao = daoToSet;
		flDao.setClazz(Flight.class);
	}

	@Override
	public Flight getById(int id) {
		return flDao.findOne(id);
	}

	@Override
	public List<Flight> getAll() {
		return flDao.findAll();
	}

	@Override
	public int add(Flight flight) {
		return flDao.create(flight);
	}

	@Override
	public int update(Flight flight) {
		return flDao.update(flight);
	}

	@Override
	public int delete(Flight flight) {
		return flDao.delete(flight);
	}

	@Override
	public List<Flight> getFliByDestination(Destination destination) {
		return flDao.getFliByDestination(destination);
	}

}
