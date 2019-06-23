package fr.adaming.controller;
 
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import fr.adaming.model.SendMailSSL;
 
@Controller
@RequestMapping("/contactus")
public class EmailController {
 
    static String message, emailToRecipient, emailSubject, emailMessage, custoName, custoMail, custoTel;
 
    static ModelAndView modelViewObj;
    
    int verif;
 
//    @Autowired
//    private JavaMailSender mailSenderObj;
 
    @RequestMapping(value = "/emailForm", method = RequestMethod.GET)
    public ModelAndView viewEmailForm(ModelMap model) {
        modelViewObj = new ModelAndView("emailFormPage");
        return  modelViewObj;       
    }
 
    // This Method Is Used To Prepare The Email Message And Send It To The Client
//    @RequestMapping(value = "/sendEmail", method = RequestMethod.POST)
//    public ModelAndView sendEmailToClient(HttpServletRequest request, final @RequestParam CommonsMultipartFile attachFileObj) {
// 
//        // Reading Email Form Input Parameters      
//        emailSubject = request.getParameter("subject");
//        emailMessage = request.getParameter("message");
//        emailToRecipient = request.getParameter("mailTo");
 
        // Logging The Email Form Parameters For Debugging Purpose
//        System.out.println("\nRecipient?= " + emailToRecipient + ", Subject?= " + emailSubject + ", Message?= " + emailMessage + "\n");
// 
//        mailSenderObj.send(new MimeMessagePreparator() {
//            public void prepare(MimeMessage mimeMessage) throws Exception {
// 
//                MimeMessageHelper mimeMsgHelperObj = new MimeMessageHelper(mimeMessage, true, "UTF-8");             
//                mimeMsgHelperObj.setTo(emailToRecipient);
//                mimeMsgHelperObj.setFrom(emailFromRecipient);               
//                mimeMsgHelperObj.setText(emailMessage);
//                mimeMsgHelperObj.setSubject(emailSubject);
 
                // Determine If There Is An File Upload. If Yes, Attach It To The Client Email              
//                if ((attachFileObj != null) && (attachFileObj.getSize() > 0) && (!attachFileObj.equals(""))) {
//                    System.out.println("\nAttachment Name?= " + attachFileObj.getOriginalFilename() + "\n");
//                    mimeMsgHelperObj.addAttachment(attachFileObj.getOriginalFilename(), new InputStreamSource() {                   
//                        public InputStream getInputStream() throws IOException {
//                            return attachFileObj.getInputStream();
//                        }
//                    });
//                } else {
//                    System.out.println("\nNo Attachment Is Selected By The User. Sending Text Email!\n");
//                }
//            }
//        });
//        System.out.println("\nMessage Send Successfully.... Hurrey!\n");
// 
//        modelViewObj = new ModelAndView("successEmailPage","messageObj","Thank You! Your Email Has Been Sent!");
//        return  modelViewObj;   
//    }
//    
    
    
    // Méthode pour que le CLIENT envoie un mail à l'agence
    @RequestMapping(value = "/sendMail", method = RequestMethod.POST)
    public String sendMail(HttpServletRequest request, RedirectAttributes ra) {
 
        // Récupérer les paramètres de la requête    
        emailSubject = request.getParameter("subject");
        custoName = request.getParameter("name");
        custoTel = request.getParameter("telephone");
        custoMail = request.getParameter("mail");
        emailMessage = request.getParameter("message");
        emailToRecipient = request.getParameter("mailTo");
 
    
        //Le message qu'on va vraiment envoyer dans le mail:
        message = "The customer "+ custoName+" ("+ custoMail +" "+custoTel+") sent you a message about "+emailSubject
		+ "\n"+ emailMessage; 
        
	// On envoie un mail 

		// Ici on envoie concrètement le mail en renseignant le destinataire et le message
		// On oublie pas de surround la fonction pour ne pas faire planter l'appli si ca crash
		SendMailSSL sm = new SendMailSSL();
		try {
			// Vérif va servir à savoir si le mail est envoyé vu que la fonction sendmail retourne un int
			verif=sm.sendMail("projet.bovoyage@gmail.com", emailSubject, message);

		} catch (Exception e) {

			e.printStackTrace();
		}
		if(verif!=0){
			return "homePage";
		}else{
			ra.addFlashAttribute("msg", "Impossible to send a message");
			return "failEmailPage";
		}
    }
}