public  class RandomContactFactory {
    
    public static List<Contact> generateRandomContacts  (Integer numcuenta, String lastname){
      
         List<Contact> listcontactos = new List<Contact>();

        for (Integer i = 0; i < numcuenta; i++) {
            Contact contact = new Contact(FirstName = 'Test  '+i, LastName = lastname);
            listcontactos.add(contact);
        }
        System.debug(listcontactos);
        return listcontactos;
    } 
}
