public with sharing class ContactAndLeadSearch {

    public static List<List<sObject>> searchContactsAndLeads(String searchTerm) {

        List<List<sObject>> results = [
            FIND :searchTerm IN NAME FIELDS
            RETURNING
                Contact(Id, FirstName, LastName),
                Lead(Id, FirstName, LastName)
        ];

        return results;
    }
}