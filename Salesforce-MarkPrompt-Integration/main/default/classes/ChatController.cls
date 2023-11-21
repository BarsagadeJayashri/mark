public with sharing class ChatController {
    
    public class messageData {
        public String role;
        public String content;
    }
    
    @AuraEnabled
    public static String getChatResponse(String userMessage) {
        String endpoint = 'https://api.markprompt.com/v1/chat';
        String token = 'ZmxnkPHLuRBQkUXkyf4a0z2UbBlf5O4D';  // change token
        String requestBody = '{ "messages": ' + userMessage + ', "model": "gpt-4","projectKey":"sk_test_DIvPRkylZxa9MuctLquFfX2Fcm2qhpQ2"}';  //change development key here

        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpoint);
        request.setMethod('POST');
        request.setHeader('Authorization', 'Bearer ' + token);
        request.setHeader('Content-Type', 'application/json');
        request.setBody(requestBody);

        Http http = new Http();
        HttpResponse response = http.send(request);

        if (response.getStatusCode() == 200) {
            return response.getBody();
        } else {
            return 'Error: ' + response.getStatus();
        }
    }
}