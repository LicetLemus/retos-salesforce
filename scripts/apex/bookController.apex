// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents
// sfdx force:apex:execute -f scripts/apex/bookController.apex


// Script para ejecutar el código
// BookController bookCtrl = new BookController(); // Crear una instancia del controlador
// Book__c newBook = bookCtrl.addBook('otro test', 129); // Crear un nuevo libro
// System.debug('Libro: ' + newBook);

// try {
//     insert newBook; // Almacena el nuevo libro en la base de datos
//     System.debug('Libro añadido: ' + newBook); // Verifica el resultado
// } catch (DmlException e) {
//     System.debug('Error al añadir el libro: ' + e.getMessage()); // Manejo de errores
// }

BookController.applyDiscount(0.1);