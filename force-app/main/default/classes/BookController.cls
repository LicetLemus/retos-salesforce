/*
Definición de la clase BookController
Esta clase se encarga de gestionar operaciones relacionadas con los libros.
 */


public with sharing class BookController {
    
    /*
        Propiedad privada que indica si el libro está disponible.
     */
    private Boolean isAvaliable;

    /* 
        Propiedad de tipo Book__c, que es un objeto personalizado que representa un libro.
        Este objeto almacenará la información del libro que se está gestionando.
     */
    Book__c book;


    /* 
        Un constructor es un método especial que se llama cuando se crea un nuevo objeto de esta clase.
        Constructor de la clase BookController
        Este método se llama automáticamente al crear una instancia de la clase.
     */
    public BookController() {
        isAvaliable = true;
    }

    /*
        Método público addBook
        Este método permite crear un nuevo libro a partir de un nombre y un precio dados.
        Recibe dos parámetros:
        name: El nombre del libro (tipo String).
        price: El precio del libro (tipo Decimal).
    */
    public Book__c addBook(String name, Decimal price) {
        // Instancia del objeto Book__c
        book = new Book__c();
        book.Name = name;
        book.Price__c = price;
        return book;
    }

    public static void applyDiscount(Decimal discount) {
        List<Book__c> books = [SELECT Name, Price__C FROM Book__C WHERE Price__c > 50];
        if (books?.size() > 0) {
            for (Book__c b : books) {
                b.Price__C = b.Price__C - (b.Price__C * discount);
            }
        }
        update (books);
    }

}