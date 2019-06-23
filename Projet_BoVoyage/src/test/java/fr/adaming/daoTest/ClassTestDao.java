//package fr.adaming.daoTest;
//
//import static org.junit.Assert.assertEquals;
//
//import java.util.Date;
//
//import org.junit.Before;
//
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.test.annotation.Rollback;
//import org.springframework.test.context.ContextConfiguration;
//import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
//import org.springframework.transaction.annotation.Transactional;
//
//import fr.adaming.dao.IEtudiantDao;
//import fr.adaming.model.Etudiant;
//import fr.adaming.model.Formateur;
//
//
//@RunWith(SpringJUnit4ClassRunner.class) 
//@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/application-context.xml"})
//public class ClassTestDao {
//	
//	@Autowired
//	private IEtudiantDao eDao;
//	
//	private Formateur f; 
//	
//	@Before
//	public void beforeMethode(){
//		this.f= new Formateur(1, "a@a", "a");
//	}
//	
//	// Vérifier la taille de la liste retournée
//	@Test
//	@Transactional(readOnly=true)
//	public void testGetAllEtudiants1(){
//		int tailleTheorique = 1;
//		// Récupérer la taille de la liste
//		int tailleReelle = eDao.getAllEtudiants(f).size();
//		
//		assertEquals(tailleTheorique, tailleReelle);
//		
//		System.out.println("Test getAll");
//	}
//	
//	@Test
//	@Transactional
//	@Rollback(true)
//	public void testAddEtudiant(){
//		Etudiant eIn= new Etudiant("Toto", "Titi", new Date());
//		eIn.setFormateur(f);
//		
//		// Récupérer la taille de la liste avant l'ajout
//		int tailleReelle = eDao.getAllEtudiants(f).size();
//		
//		eDao.addEtudiantDao(eIn);
//		
//		assertEquals(tailleReelle+1, eDao.getAllEtudiants(f).size());
//			
//	}
//	
//	@Test
//	@Transactional
//	@Rollback(true)
//	public void testDeleteEtudiant(){
//		
//		// Récupérer un étudiant dans la liste
//		Etudiant eIn= eDao.getAllEtudiants(f).get(0);
//		
//		// Récupérer la taille de la liste avant l'ajout
//		int tailleReelle = eDao.getAllEtudiants(f).size();
//		
//		eDao.deleteEtudiantDao(eIn);
//		
//		assertEquals(tailleReelle-1, eDao.getAllEtudiants(f).size());
//			
//	}
//
//
//}
