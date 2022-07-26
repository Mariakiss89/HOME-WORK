public class RandomContactFactory {

    public static List <Contact> generateRandomContacts( Integer cont, String param){
        
           List<Contact> accts = new List<Contact>();
        for(Integer i=0;i<cont;i++) {
            Contact a = new Contact(FirstName='Test ' + i,LastName=param);
            accts.add(a);
        }
        return accts;


        
    }
}