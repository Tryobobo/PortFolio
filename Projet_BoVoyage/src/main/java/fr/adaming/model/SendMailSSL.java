package fr.adaming.model;

public class SendMailSSL {
	
	public SendMailSSL(){
		super();
	}
	
	public int sendMail(String destinataire, String titre, String message) throws Exception{
		int a=0;
		Mail.send("projet.bovoyage@gmail.com", "bovoyage12", destinataire, titre, message);
		a++;
		return a;
	}

}
