package fr.adaming.dao;

import fr.adaming.model.Customer;

public interface ICustomerDao extends IGenericDao<Customer> {
	
	public Customer getCustomerByMail(String mail);
	
}
