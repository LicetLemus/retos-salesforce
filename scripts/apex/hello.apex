// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents
// sfdx force:apex:execute -f scripts/apex/hello.apex


// string tempvar = 'Enter_your_name_here';
// System.debug('Hello World!');
// System.debug('My name is ' + tempvar);


// Consultas SOQL

// List<Contact> listOfContacts = [SELECT FirstName, LastName FROM Contact LIMIT 2];
// system.debug(listOfContacts);

// ContactUtilityy.viewContacts();
// AccountUtility.viewAnnualRevenue();

PropertyUtility.newListedProperties();
