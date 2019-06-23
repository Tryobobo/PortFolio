package fr.adaming.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import fr.adaming.dao.IReservationFileDao;
import fr.adaming.model.ReservationFile;

@Service
@Transactional
public class ReservationFileServiceImpl implements IReservationFileService {

	IReservationFileDao rfDao;

	@Autowired
	public void setDao(IReservationFileDao daoToSet) {
		rfDao = daoToSet;
		rfDao.setClazz(ReservationFile.class);
	}

	@Override
	public ReservationFile getById(int id) {
		return rfDao.findOne(id);
	}

	@Override
	public List<ReservationFile> getAll() {
		return rfDao.findAll();
	}

	@Override
	public int add(ReservationFile reservationFile) {
		return rfDao.create(reservationFile);
	}

	@Override
	public int update(ReservationFile reservationFile) {
		return rfDao.update(reservationFile);
	}

	@Override
	public int delete(ReservationFile reservationFile) {
		return rfDao.delete(reservationFile);
	}
}
