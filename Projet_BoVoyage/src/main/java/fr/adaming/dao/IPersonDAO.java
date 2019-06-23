package fr.adaming.dao;

import fr.adaming.model.Person;

public interface IPersonDAO {

	public Person getPersonByMail(String mail);
	
}
