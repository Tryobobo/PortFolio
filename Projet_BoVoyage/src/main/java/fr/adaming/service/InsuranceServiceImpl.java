package fr.adaming.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import fr.adaming.dao.IInsuranceDao;
import fr.adaming.model.Insurance;

@Service
@Transactional
public class InsuranceServiceImpl implements IInsuranceService {

	IInsuranceDao insuDao;
	
	@Autowired
	public void setDao(IInsuranceDao daoToSet) {
		insuDao = daoToSet;
		insuDao.setClazz(Insurance.class);
	}

	@Override
	public Insurance getById(int id) {
		return insuDao.findOne(id);
	}

	@Override
	public List<Insurance> getAll() {
		return insuDao.findAll();
	}

	@Override
	public int add(Insurance insurance) {
		return insuDao.create(insurance);
	}

	@Override
	public int update(Insurance insurance) {
		return insuDao.update(insurance);
	}

	@Override
	public int delete(Insurance insurance) {
		return insuDao.delete(insurance);
	}

}
