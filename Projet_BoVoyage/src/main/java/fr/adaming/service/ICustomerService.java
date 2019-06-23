package fr.adaming.service;

import java.util.List;

import fr.adaming.model.Customer;
import fr.adaming.model.Person;

public interface ICustomerService {
	public Customer getById(final int id);

	public Customer getById2(final int id, Person pIn);

	public List<Customer> getAll();

	public int add(final Customer customer);

	public int update(final Customer customer);

	public int delete(final Customer customer);

	public Customer getCustomerByMail(String mail);

}
