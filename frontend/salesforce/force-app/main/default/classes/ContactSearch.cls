public with sharing class ContactSearch{
    public static List<Contact> searchForContacts(String lastName, String mailPostalCode){
        Contact[] contacts = [
            SELECT Id, Name
            FROM Contact
            WHERE LastName=:lastName AND MailingPostalCode =: mailPostalCode
        ];
        return contacts;
    }
}