package fr.adaming.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import fr.adaming.dao.IPersonDAO;
import fr.adaming.model.Person;

@Service("adService")
@Transactional
public class PersonServiceImpl implements IPersonService {

	// UML to Java Association's Transformation
	@Autowired
	private IPersonDAO pDAO;
	
	// Setter for Dependency Injection
	public void setAdDAO(IPersonDAO pDAO) {
		this.pDAO = pDAO;
	}

	@Override
	public Person getPersonByMail(String mail) {
		// Calling DAO Method
		return pDAO.getPersonByMail(mail);
	}

	
	
}
