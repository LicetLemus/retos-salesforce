public class AnimalLocator {
    public static String getAnimalNameById(Integer id) {

        // Crear la solicitud HTTP
        Http http = new Http();
        HttpRequest request = new HttpRequest();

        // Configurar el endpoint con el ID proporcionado
        String endpoint = 'https://th-apex-http-callout.herokuapp.com/animals/' + id;
        request.setEndpoint(endpoint);
        request.setMethod('GET');

        try {
            // Enviar la solicitud y obtener la respuesta
            HttpResponse response = http.send(request);

            // Validar el código de estado de la respuesta
            if (response.getStatusCode() == 200) {
                // Parsear la respuesta JSON
                String jsonString = response.getBody();
                Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(jsonString);

                System.debug('resultados de json: ----- ' + results);

                // Acceder al objeto 'animal' y luego al campo 'name'
                Map<String, Object> animal = (Map<String, Object>) results.get('animal');
                String animalName = (String) animal.get('name');
                System.debug('Animal Name: ' + animalName);

                return animalName;
            } else {
                throw new CalloutException('Error al obtener el nombre del animal. Código de estado: ' + response.getStatusCode());
            }
        } catch (Exception e) {
            // Manejo de excepciones
            throw new CalloutException('Se produjo un error durante la llamada: ' + e.getMessage());
        }
    }
}
