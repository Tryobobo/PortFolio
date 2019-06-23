package fr.adaming.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import fr.adaming.dao.ICustomerDao;
import fr.adaming.model.Customer;
import fr.adaming.model.Person;

@Service
@Transactional
public class CustomerServiceImpl implements ICustomerService {

	ICustomerDao cusDao;

	@Autowired
	public void setDao(ICustomerDao daoToSet) {
		cusDao = daoToSet;
		cusDao.setClazz(Customer.class);
	}

	@Override
	public Customer getById(int id) {
		return cusDao.findOne(id);
	}

	@Override
	public Customer getById2(int id, Person pIn) {

		return cusDao.findOne(id);
	}

	@Override
	public List<Customer> getAll() {
		return cusDao.findAll();
	}

	@Override
	public int add(Customer customer) {
		return cusDao.create(customer);
	}

	@Override
	public int update(Customer customer) {
		return cusDao.update(customer);
	}

	@Override
	public int delete(Customer customer) {
		return cusDao.delete(customer);
	}

	@Override
	public Customer getCustomerByMail(String mail) {
		// TODO Auto-generated method stub
		return cusDao.getCustomerByMail(mail);
	}

}
