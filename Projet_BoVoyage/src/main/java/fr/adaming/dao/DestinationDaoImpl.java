package fr.adaming.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fr.adaming.model.Destination;

@Repository
public class DestinationDaoImpl extends AbstractGenericDao<Destination> implements IDestinationDao{
	

	@Autowired
	private SessionFactory sf;

	// Le setter pour l'injection de dépendance
	public void setSf(SessionFactory sf) {
		this.sf = sf;
	}

	
	@Override
	public List<Destination> getDestinationByContinent(String continent) {
		Session s = sf.getCurrentSession();

		// Requête HQL
		String req = "FROM Destination as d WHERE d.continent=:pCont";

		// Récupérer un objet de type Query
		Query query = s.createQuery(req);

		// Paramètres
		query.setParameter("pCont", continent);

		@SuppressWarnings("unchecked")
		List<Destination> listeDest = query.list();

		return listeDest;

	}
	
	// Méthode trouver Dest par mot-clé
	@Override
	public List<Destination> getDestinationByKW(String kw) {
		Session s = sf.getCurrentSession();

		// Requête HQL
		String req = "FROM Destination as d  WHERE d.continent LIKE :pKW OR d.country LIKE :pKW OR d.city LIKE :pKW OR d.description LIKE :pKW";

		// Récupérer un objet de type Query
		Query query = s.createQuery(req);

		// Paramètres
		query.setParameter("pKW", "%" + kw + "%");

		@SuppressWarnings("unchecked")
		List<Destination> listeDest = query.list();

		return listeDest;

	}


}
