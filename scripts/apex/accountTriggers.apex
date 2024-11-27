
// Account accou = new Account(Name = 'Apples & Oranges');
// insert accou;


Account existingAccount = [SELECT Id FROM Account WHERE Name = 'Apples & Oranges' LIMIT 1];
delete existingAccount;
