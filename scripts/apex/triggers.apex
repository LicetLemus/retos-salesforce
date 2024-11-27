// sfdx force:apex:execute -f scripts/apex/triggers.apex

Account a = new Account(Name = 'Test Triggers 2');
Insert a;