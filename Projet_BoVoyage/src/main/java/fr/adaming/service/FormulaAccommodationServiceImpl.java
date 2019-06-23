package fr.adaming.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import fr.adaming.dao.IFormulaAccommodationDao;
import fr.adaming.model.FormulaAccomodation;

@Service
@Transactional
public class FormulaAccommodationServiceImpl implements IFormulaAccommodationService {
	

	IFormulaAccommodationDao faccDao;

	@Autowired
	public void setDao(IFormulaAccommodationDao daoToSet) {
		faccDao = daoToSet;
		faccDao.setClazz(FormulaAccomodation.class);
	}

	@Override
	public FormulaAccomodation getById(int id) {
		return faccDao.findOne(id);
	}

	@Override
	public List<FormulaAccomodation> getAll() {
		// TODO Auto-generated method stub
		return faccDao.findAll();
	}

	@Override
	public int add(FormulaAccomodation formulaAcc) {
		// TODO Auto-generated method stub
		return faccDao.create(formulaAcc);
	}

	@Override
	public int update(FormulaAccomodation formulaAcc) {
		// TODO Auto-generated method stub
		return faccDao.update(formulaAcc);
	}

	@Override
	public int delete(FormulaAccomodation formulaAcc) {
		// TODO Auto-generated method stub
		return faccDao.delete(formulaAcc);
	}
	
	
	

}
