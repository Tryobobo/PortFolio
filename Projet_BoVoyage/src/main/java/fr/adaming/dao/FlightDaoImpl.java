package fr.adaming.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fr.adaming.model.Destination;
import fr.adaming.model.Flight;

@Repository
public class FlightDaoImpl extends AbstractGenericDao<Flight> implements IFlightDao {

	@Autowired
	private SessionFactory sf;

	// Le setter pour l'injection de dépendance
	public void setSf(SessionFactory sf) {
		this.sf = sf;
	}

	@Override
	public List<Flight> getFliByDestination(Destination destination) {
		Session s = sf.getCurrentSession();

		// Requête HQL
		String req = "FROM Flight as f WHERE f.destination.id=:pId";

		// Récupérer un objet de type Query
		Query query = s.createQuery(req);

		// Paramètres
		query.setParameter("pId", destination.getIdDest());

		@SuppressWarnings("unchecked")
		List<Flight> listeFli = query.list();

		return listeFli;
	}

}
