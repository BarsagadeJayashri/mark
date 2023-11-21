({
    uploadFileHelper: function(component, file) {
        var reader = new FileReader();
        reader.onload = $A.getCallback(function() {
            var base64 = reader.result.match(/,(.*)$/)[1];
            var fileName = file.name;
            var fileType = file.type;
            var fileData = file.toString();
            console.log('txt-----'+fileData);
            console.log('Name and type  '+fileName+'------'+fileType);
            var action = component.get("c.uploadFile");
            action.setParams({
                base64Data: base64,
                fileName: fileName,
                fileType: fileType,
                fileData: fileData
            });
            
            action.setCallback(this, function(response) {
                var state = response.getState();
                
                if (state === 'SUCCESS') {
                    console.log("success");
                    
                    console.log('res  '+JSON.stringify(response.getReturnValue()));
                    var jsonString = response.getReturnValue();
                    var jsonObject = JSON.parse(jsonString);
                    console.log(JSON.stringify(response.getReturnValue()).length);
                    component.set("v.isLoading",false);
                    if(jsonObject.status == "ok"){
                    alert("Success: " + jsonObject.message);
                    }
                    else{
                       alert("Error uploading the file: " + jsonObject.message); 
                    }
                        
                } else {
                    alert("Error uploading the file: " + response.getError()[0].message);
                   
                }
                
            });
            
            $A.enqueueAction(action);
        });
        reader.readAsDataURL(file);
    }
})