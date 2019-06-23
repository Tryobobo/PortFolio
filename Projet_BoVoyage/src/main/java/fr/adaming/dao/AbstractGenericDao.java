package fr.adaming.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

public abstract class AbstractGenericDao<T> implements IGenericDao<T> {

	private Class<T> clazz;

	@Autowired
	SessionFactory sessionFactory;

	public final void setClazz(Class<T> clazzToSet) {
		this.clazz = clazzToSet;
	}

	protected final Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}

	@SuppressWarnings("unchecked")
	public T findOne(int id) {
		return (T) getCurrentSession().get(clazz, id);
	}

	@SuppressWarnings("unchecked")
	public List<T> findAll() {
		return getCurrentSession().createQuery("from " + clazz.getName()).list();
	}

	public int create(T entity) {
		try {
			getCurrentSession().persist(entity);
			return 1;
		} catch (Exception e1) {
			return 0;
		}
	}

	public int update(T entity) {
		try{
			getCurrentSession().merge(entity);
			return 1;
		} catch (Exception e1) {
			return 0;
		}
	}

	public int delete(T entity) {
		try{
			getCurrentSession().delete(entity);
			return 1;
		} catch (Exception e1) {
			return 0;
		}
	}

}