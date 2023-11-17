package utilitaires;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
 
public class EnvoyerEmail {
private static String username = "biltheoitoua@gmail.com";
private static String password = "rhxv qnrw ousd dawl";
public  static void envoyer(String received, String subject, String body) {
// Etape 1 : Création de la session
Properties props = new Properties();
props.put("mail.smtp.auth", "true");
props.put("mail.smtp.starttls.enable","true");
props.put("mail.smtp.host","smtp.gmail.com");
props.put("mail.smtp.port","587");
Session session = Session.getInstance(props,
new javax.mail.Authenticator() {
protected PasswordAuthentication getPasswordAuthentication() {
return new PasswordAuthentication(username, password);
}
});
try {
// Etape 2 : Création de l'objet Message
Message message = new MimeMessage(session);
message.setFrom(new InternetAddress("biltheoitoua@gmail.com"));
message.setRecipients(Message.RecipientType.TO,
InternetAddress.parse(received));
message.setSubject(subject);
message.setText(body);
// Etape 3 : Envoyer le message
Transport.send(message);
//System.out.println("Message_envoye");
} catch (MessagingException e) {
throw new RuntimeException(e);
} }
//Etape 4 : Tester la méthode
 }


//rhxv qnrw ousd dawl
 