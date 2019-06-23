package fr.adaming.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import fr.adaming.dao.IFormulaTripDao;
import fr.adaming.model.FormulaTrip;

@Service
@Transactional
public class FormulaTripServiceImpl implements IFormulaTripService {
	

	IFormulaTripDao ftDao;

	@Autowired
	public void setDao(IFormulaTripDao daoToSet) {
		ftDao = daoToSet;
		ftDao.setClazz(FormulaTrip.class);
	}

	@Override
	public FormulaTrip getById(int id) {
		return ftDao.findOne(id);
	}

	@Override
	public List<FormulaTrip> getAll() {
		// TODO Auto-generated method stub
		return ftDao.findAll();
	}

	@Override
	public int add(FormulaTrip formulaTrip) {
		// TODO Auto-generated method stub
		return ftDao.create(formulaTrip);
	}

	@Override
	public int update(FormulaTrip formulaTrip) {
		// TODO Auto-generated method stub
		return ftDao.update(formulaTrip);
	}

	@Override
	public int delete(FormulaTrip formulaTrip) {
		// TODO Auto-generated method stub
		return ftDao.delete(formulaTrip);
	}
	
	
	

}
