package fr.adaming.service;

import java.util.List;

import fr.adaming.model.FormulaAccomodation;

public interface IFormulaAccommodationService {

	
	public FormulaAccomodation getById(final int id);

	public List<FormulaAccomodation> getAll();

	public int add(final FormulaAccomodation formulaAcc);

	public int update(final FormulaAccomodation formulaAcc);

	public int delete(final FormulaAccomodation formulaAcc);
	
}
