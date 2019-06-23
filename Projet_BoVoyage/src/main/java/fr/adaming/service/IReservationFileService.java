package fr.adaming.service;

import java.util.List;

import fr.adaming.model.ReservationFile;

public interface IReservationFileService {

	public ReservationFile getById(final int id);

	public List<ReservationFile> getAll();

	public int add(final ReservationFile reservationFile);

	public int update(final ReservationFile reservationFile);

	public int delete(final ReservationFile reservationFile);
}
