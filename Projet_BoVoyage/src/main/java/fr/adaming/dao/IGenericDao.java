package fr.adaming.dao;

import java.util.List;



public interface IGenericDao<T> {
	 
	   T findOne(final int id);
	 
	   List<T> findAll();
	 
	   int create(final T entity);
	 
	   int update(final T entity);
	 
	   int delete(final T entity);
	 
	   void setClazz(Class<T> class1);
	}