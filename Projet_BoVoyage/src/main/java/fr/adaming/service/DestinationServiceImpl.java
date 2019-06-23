package fr.adaming.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import fr.adaming.dao.IDestinationDao;

import fr.adaming.model.Destination;

@Service
@Transactional
public class DestinationServiceImpl implements IDestinationService {


	IDestinationDao destDao;

	@Autowired
	public void setDao(IDestinationDao daoToSet) {
		destDao = daoToSet;
		destDao.setClazz(Destination.class);
	}

	@Override
	public Destination getById(int id) {
		return destDao.findOne(id);
	}

	@Override
	public List<Destination> getAll() {
		return destDao.findAll();
	}

	@Override
	public int add(Destination destination) {
		return destDao.create(destination);
	}

	@Override
	public int update(Destination destination) {
		return destDao.update(destination);
	}

	@Override
	public int delete(Destination destination) {
		return destDao.delete(destination);
	}

	@Override
	public List<Destination> getDestinationByContinent(String continent) {
		return destDao.getDestinationByContinent(continent);
	}

	@Override
	public List<Destination> getDestinationByKW(String kw) {
		return destDao.getDestinationByKW(kw);
	}

}