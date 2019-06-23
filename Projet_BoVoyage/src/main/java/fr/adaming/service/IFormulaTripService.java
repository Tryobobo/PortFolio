package fr.adaming.service;

import java.util.List;

import fr.adaming.model.FormulaTrip;

public interface IFormulaTripService {
	
	public FormulaTrip getById(final int id);

	public List<FormulaTrip> getAll();

	public int add(final FormulaTrip formulaTrip);

	public int update(final FormulaTrip formulaTrip);

	public int delete(final FormulaTrip formulaTrip);

}
