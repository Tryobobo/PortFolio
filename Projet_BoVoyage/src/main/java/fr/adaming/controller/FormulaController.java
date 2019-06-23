package fr.adaming.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import fr.adaming.model.Accommodation;
import fr.adaming.model.Cart;
import fr.adaming.model.Destination;
import fr.adaming.model.Flight;
import fr.adaming.model.FormulaAccomodation;
import fr.adaming.model.FormulaTrip;
import fr.adaming.model.Insurance;
import fr.adaming.model.Trip;
import fr.adaming.service.IAccommodationService;
import fr.adaming.service.IDestinationService;
import fr.adaming.service.IFlightService;
import fr.adaming.service.IFormulaAccommodationService;
import fr.adaming.service.IFormulaTripService;
import fr.adaming.service.IInsuranceService;
import fr.adaming.service.ITripService;

@Controller
@RequestMapping("/formula")
@Scope("session")
public class FormulaController {

	// Transformation de l'asso UML en JAVA
	@Autowired
	private IDestinationService destService;
	@Autowired
	private IFlightService fliService;
	@Autowired
	private IAccommodationService accService;
	@Autowired
	private IFormulaTripService ftService;
	@Autowired
	private IFormulaAccommodationService faService;
	@Autowired
	private IInsuranceService iService;
	@Autowired
	private ITripService tripService;

	private Accommodation accOut;
	private Cart cart;
	private FormulaTrip formTripHotel;

	@PostConstruct
	public void init() {

		this.cart = new Cart();
		this.formTripHotel = new FormulaTrip();

	}

	public Accommodation getAccOut() {
		return accOut;
	}

	public void setAccOut(Accommodation accOut) {
		this.accOut = accOut;
	}

	// FORMULE VOL SEUL
	/** METHODE AFFICHER PAGE */
	@RequestMapping(value = "/loneflightViewFlight", method = RequestMethod.GET)
	public ModelAndView viewLoneFlightForm(@RequestParam("pDest") @ModelAttribute("destSearch") int idDest,
			Model modele) {

		List<Flight> listFli = fliService.getFliByDestination(destService.getById(idDest));
		modele.addAttribute("listFliDest", listFli);

		return new ModelAndView("formulaFlight", "destination", destService.getById(idDest));
	}

	/** METHODE AFFICHER PAGE CHOIX FINAL ASSURANCE + VOITURE */
	@RequestMapping(value = "/loneflightSelectFlight", method = RequestMethod.GET)
	public ModelAndView selectLoneFlightForm(HttpServletRequest request,
			@RequestParam("pFli") @ModelAttribute("fliSelect") int idFlight, Model modele) {

		List<Insurance> forminsu = iService.getAll();
		modele.addAttribute("forminsu", forminsu);

		modele.addAttribute(new FormulaTrip());

		return new ModelAndView("hotelReservationPage", "hotel", accService.getById(idFlight));

	}

	/** METHODE SUBMIT RESERVATION FLIGHT */
	@RequestMapping(value = "/loneflightSubmitResFlight", method = RequestMethod.POST)
	public ModelAndView submitResLoneFlight(Model modele, @ModelAttribute("formulaTrip") FormulaTrip formTrip) {

		// FormulaTrip formTrip = new FormulaTrip();
		formTrip.setNameFormTrip("Lone Flight");
		formTrip.setRate(1);
		// Appel de la méthode service

		int test = ftService.add(formTrip);

		if (test != 0) {
			try {
				List<Trip> listTrips = this.cart.getTrips();
				Trip trip = new Trip();
				trip.setFormulaTrip(formTrip);
				listTrips.add(trip);
				this.cart.setTrips(listTrips);
				tripService.add(trip);
			} catch (Exception e1) {
				List<Trip> listTrips = new ArrayList<Trip>();
				Trip trip = new Trip();
				trip.setFormulaTrip(formTrip);
				listTrips.add(trip);
				System.out.println(listTrips + " " + cart);
				this.cart.setTrips(listTrips);
				tripService.add(trip);
			}
			System.out.println(cart);
			return new ModelAndView("cartPage", "msg", "this trip has been added to your Cart !");
		} else {
			return new ModelAndView("flightReservationPage", "msg", "Something went wrong...");
		}

	}

	// FORMULE HOTEL SEUL
	/** METHODE AFFICHER PAGE SELECT HOTEL */
	@RequestMapping(value = "/lonehotelViewHotel", method = RequestMethod.GET)
	public ModelAndView viewLoneHotelForm(@RequestParam("pDest") @ModelAttribute("destSearch") int idDest,
			Model modele) {

		List<Accommodation> listAcc = accService.getAccByDestination((destService.getById(idDest)));
		modele.addAttribute("listAccDest", listAcc);

		this.formTripHotel.setDestination(destService.getById(idDest));

		return new ModelAndView("formulaHotel", "destination", destService.getById(idDest));

	}

	/** METHODE AFFICHER PAGE CHOIX FINAL FORMULE HOTEL + ASSURANCE + VOITURE */
	@RequestMapping(value = "/lonehotelSelectHotel", method = RequestMethod.GET)
	public ModelAndView selectLoneHotelForm(HttpServletRequest request,
			@RequestParam("pAcc") @ModelAttribute("accSelect") int idAcc, Model modele) {

		this.formTripHotel.setAccomodation(accService.getById(idAcc));

		List<FormulaAccomodation> formacc = faService.getAll();
		modele.addAttribute("formacc", formacc);

		List<Insurance> forminsu = iService.getAll();
		modele.addAttribute("forminsu", forminsu);

		modele.addAttribute(new FormulaTrip());
		modele.addAttribute(new FormulaAccomodation());

		return new ModelAndView("hotelReservationPage", "hotel", accService.getById(idAcc));

	}

	/** METHODE SUBMIT RESERVATION HOTEL */
	@RequestMapping(value = "/lonehotelSubmitResHotel", method = RequestMethod.POST)
	public String submitResLoneHotel(Model modele, @ModelAttribute("formulaTrip") FormulaTrip formTrip) {

		// FormulaTrip formTrip = new FormulaTrip();
		this.formTripHotel.setNameFormTrip("Lone Accommodation");
		this.formTripHotel.setRate(1);
		this.formTripHotel.setCarRental(formTrip.isCarRental());
		this.formTripHotel.setFormulaAccomodation(faService.getById(formTrip.getFormulaAccomodation().getId()));
		this.formTripHotel.setInsurance(iService.getById(formTrip.getInsurance().getIdInsu()));
		// Appel de la méthode service

		int test = ftService.add(this.formTripHotel);
		if (test != 0) {
			try {
				List<Trip> listTrips = this.cart.getTrips();
				Trip trip = new Trip();
				trip.setFormulaTrip(this.formTripHotel);
				listTrips.add(trip);
				this.cart.setTrips(listTrips);
				tripService.add(trip);
			} catch (Exception e1) {
				List<Trip> listTrips = new ArrayList<Trip>();
				Trip trip = new Trip();
				trip.setFormulaTrip(this.formTripHotel);
				listTrips.add(trip);
				tripService.add(trip);
				this.cart.setTrips(listTrips);

			}
			return "redirect:lonehotelViewCart";
		} else {
			return "hotelReservationPage";
		}

	}

	/** METHODE AFFICHER PAGE PANIER */
	@RequestMapping(value = "/lonehotelViewCart", method = RequestMethod.GET)
	public ModelAndView viewCartFromHotelForm(Model modele) {

		List<Trip> listTrips = this.cart.getTrips();
		List<FormulaTrip> listFT = new ArrayList<FormulaTrip>();
		for (Trip elem : listTrips) {
			FormulaTrip ft = elem.getFormulaTrip();
			listFT.add(ft);
		}

		return new ModelAndView("cartPage", "listFT", listFT);
	}

	// FORMULE HOTEL+FLIGHT
	/** METHODE AFFICHER PAGE HOTEL */
	@RequestMapping(value = "/hotelflightViewHotel", method = RequestMethod.GET)
	public ModelAndView viewHotelForm(@RequestParam("pDest") @ModelAttribute("destSearch") int idDest, Model modele) {

		List<Accommodation> listAcc = accService.getAccByDestination((destService.getById(idDest)));

		modele.addAttribute("listAccDest", listAcc);

		return new ModelAndView("formulaHotFliHotel", "destination", destService.getById(idDest));
	}

	/** METHODE SUBMIT RESERVATION HOTEL */
	@RequestMapping(value = "/hotelflightSelectHotel", method = RequestMethod.GET)
	public String submitResHotel(@RequestParam("pHotel") int idAcc, Model modele, RedirectAttributes ra) {

		FormulaTrip ft = new FormulaTrip();
		ft.setNameFormTrip("Hotel and Flight");
		ft.setRate(0.8);
		ft.setAccomodation(accService.getById(idAcc));
		ft.setDestination(destService.getById(accService.getById(idAcc).getDestination().getIdDest()));
		ftService.add(ft);
		FormulaTrip ftBis = ftService.getAll().get(ftService.getAll().size() - 1);
		ra.addAttribute("ft", ftBis.getId());
		ra.addAttribute("idAcc", idAcc);
		return "redirect:hotelflightViewFlight";

	}

	/** MEHODE AFFICHER FLIGHT */
	@RequestMapping(value = "/hotelflightViewFlight", method = RequestMethod.GET)
	public ModelAndView viewFlight(Model modele, @RequestParam("idAcc") int id, @RequestParam("ft") int ft) {

		modele.addAttribute("destination", destService.getById(accService.getById(id).getDestination().getIdDest()));
		modele.addAttribute("ft", Integer.toString(ft));
		List<Flight> listFli = fliService
				.getFliByDestination(destService.getById(accService.getById(id).getDestination().getIdDest()));
		return new ModelAndView("formulaHotFliFlight", "listFliDest", listFli);
	}

	/** METHODE AFFICHER PAGE CHOIX FINAL FORMULE HOTEL + ASSURANCE + VOITURE */
	@RequestMapping(value = "/hotelflightSelectHotelAndFlight", method = RequestMethod.GET)
	public ModelAndView selectHotelandFlightForm(HttpServletRequest request, @RequestParam("pFli") int idFlight,
			Model modele, @RequestParam("ft") String ft) {

		FormulaTrip ftBis = ftService.getById(Integer.parseInt(ft));
		ftBis.setFlight(fliService.getById(idFlight));
		ftService.update(ftBis);
		List<FormulaAccomodation> formacc = faService.getAll();
		modele.addAttribute("formacc", formacc);

		List<Insurance> forminsu = iService.getAll();
		modele.addAttribute("forminsu", forminsu);

		modele.addAttribute("ft", Integer.toString(ftBis.getId()));
		modele.addAttribute(new FormulaTrip());
		modele.addAttribute(new FormulaAccomodation());

		int idAcc = ftBis.getAccomodation().getIdAcc();
		return new ModelAndView("formulaHotFliReservationPage", "hotel", accService.getById(idAcc));

	}

	/** METHODE SUBMIT RESERVATION HOTEL + FLIGHT */
	@RequestMapping(value = "/hotelflightSubmitResHotel", method = RequestMethod.POST)
	public String submitResHotelAndFlight(Model modele, @ModelAttribute("formulaTrip") FormulaTrip formTrip,
			@RequestParam("ft") String ft) {

		// Appel de la méthode service
		FormulaTrip ftBis = ftService.getById(Integer.parseInt(ft));
		ftBis.setCarRental(formTrip.isCarRental());
		ftBis.setFormulaAccomodation(formTrip.getFormulaAccomodation());

		int test = ftService.update(ftBis);

		if (test != 0) {
			try {
				List<Trip> listTrips = this.cart.getTrips();
				Trip trip = new Trip();
				trip.setFormulaTrip(ftBis);
				listTrips.add(trip);
				this.cart.setTrips(listTrips);
				tripService.add(trip);
			} catch (Exception e1) {
				List<Trip> listTrips = new ArrayList<Trip>();
				Trip trip = new Trip();
				trip.setFormulaTrip(ftBis);
				trip.setAttendants(null);
				trip.setCustomer(null);
				listTrips.add(trip);
				System.out.println(listTrips + " " + cart);
				this.cart.setTrips(listTrips);
				tripService.add(trip);
			}
			return "redirect:hotelflightViewCart";
		} else {
			return "hotelReservationPage";
		}

	}

	/** METHODE AFFICHER PAGE PANIER */
	@RequestMapping(value = "/hotelflightViewCart", method = RequestMethod.GET)
	public ModelAndView viewCartFromHotelFlightForm(Model modele) {

		List<Trip> listTrips = this.cart.getTrips();
		List<FormulaTrip> listFT = new ArrayList<FormulaTrip>();
		for (Trip elem : listTrips) {
			FormulaTrip ft = elem.getFormulaTrip();
			listFT.add(ft);
		}

		return new ModelAndView("cartPage", "listFT", listFT);
	}

	/** METHODE AFFICHER PHOTO */
	@RequestMapping(value = "photoAcc", produces = MediaType.IMAGE_JPEG_VALUE)
	@ResponseBody
	public byte[] getPhotoAcc(int idAcc) throws IOException {
		Accommodation acOut = accService.getById(idAcc);
		if (acOut.getPhoto() == null) {
			return new byte[0];
		} else {
			return IOUtils.toByteArray(new ByteArrayInputStream(acOut.getPhoto()));
		}
	}

	@RequestMapping(value = "photoDest", produces = MediaType.IMAGE_JPEG_VALUE)
	@ResponseBody
	public byte[] getPhotoDest(int idDest) throws IOException {
		Destination desOut = destService.getById(idDest);
		if (desOut.getPhoto() == null) {
			return new byte[0];
		} else {
			return IOUtils.toByteArray(new ByteArrayInputStream(desOut.getPhoto()));
		}
	}

}