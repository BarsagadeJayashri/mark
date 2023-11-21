public class MarkPrompt {
    
    public class Request {
        public List<FileData> files;
    }
    
    public class FileData {
        public String path;
        public String content;
    }
    
    @AuraEnabled
    public static string uploadFile(String base64Data, String fileName, String fileType, string fileData) {
        try {
            string trainURL = 'https://api.markprompt.com/v1/train';
            string accessToken = 'ZmxnkPHLuRBQkUXkyf4a0z2UbBlf5O4D';  // Change Token
            
            Http http = new Http();
            HttpRequest requestTrain = new HttpRequest();
            requestTrain.setMethod('POST');
            requestTrain.setEndpoint(trainURL);
            requestTrain.setHeader('Accept', 'application/json');
            requestTrain.setHeader('Authorization', 'Bearer ' + accessToken);
            
            if(fileName.endsWith('.zip')){
                Blob fileBlob = EncodingUtil.base64Decode(base64Data);
                requestTrain.setHeader('content-Type', 'application/zip');
                requestTrain.setBodyAsBlob(fileBlob);
            }
            Else{
                if(fileName.endsWith('.txt')){
                    MarkPrompt.Request request = new MarkPrompt.Request();
                    request.files = new List<MarkPrompt.FileData>();
                    MarkPrompt.FileData obj = new MarkPrompt.FileData();
                    obj.path=fileName;
                    obj.content=fileData;
                    request.files.add(obj);
                    string requestBody = JSON.serialize(request);
                    requestTrain.setHeader('content-Type', 'application/json');
                    requestTrain.setBody(requestBody);
                }
            }
            HttpResponse responseTrain = http.send(requestTrain);
            
            if (responseTrain.getStatusCode() == 200) {
                
                system.debug('########'+JSON.serializePretty(responseTrain.getBody()));
                
                
            } else {
                
                System.debug('API call failed with status code: ' + responseTrain.getStatusCode());
                
            }
            return responseTrain.getBody();
            //insert content;
        } catch (Exception e) {
            throw new AuraHandledException('Error uploading the file: ' + e.getMessage());
            
        }
    }
}