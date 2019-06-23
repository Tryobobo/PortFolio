package fr.adaming.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fr.adaming.model.Accommodation;
import fr.adaming.model.Destination;

@Repository
public class AccommodationDaoImpl  extends AbstractGenericDao<Accommodation> implements IAccommodationDao{


	@Autowired
	private SessionFactory sf;

	// Le setter pour l'injection de dépendance
	public void setSf(SessionFactory sf) {
		this.sf = sf;
	}

	
	@Override
	public List<Accommodation> getAccByDestination(Destination destination) {
		Session s = sf.getCurrentSession();

		// Requête HQL
		String req = "FROM Accommodation as a WHERE a.destination.id=:pId";

		// Récupérer un objet de type Query
		Query query = s.createQuery(req);

		// Paramètres
		query.setParameter("pId", destination.getIdDest());

		@SuppressWarnings("unchecked")
		List<Accommodation> listeAcc = query.list();

		return listeAcc;

	}
	
}
