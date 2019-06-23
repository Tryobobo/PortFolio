package fr.adaming.service;

import java.util.List;

import fr.adaming.model.Insurance;

public interface IInsuranceService {

	public Insurance getById(final int id);
	 
	   public List<Insurance> getAll();
	 
	   public int add(final Insurance insurance);
	 
	   public int update(final Insurance insurance);
	 
	   public int delete(final Insurance insurance);
}
