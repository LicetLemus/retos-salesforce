@isTest
private class AnimalLocatorTest {
    @isTest
    static void testGetAnimalNameById() {
        // Configurar el simulador
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());

        // Llamar al método
        String result = AnimalLocator.getAnimalNameById(1);

        // Validar la respuesta
        System.assertEquals('Elephant', result, 'El nombre del animal no coincide');
    }
}

@isTest
public class AnimalLocatorMock implements HttpCalloutMock {
    global HttpResponse respond(HttpRequest req) {
        // Respuesta simulada
        HttpResponse response = new HttpResponse();
        response.setStatusCode(200);
        response.setHeader('Content-Type', 'application/json');
        response.setBody('{"id":1, "name":"Elephant"}');
        return response;
    }
}
