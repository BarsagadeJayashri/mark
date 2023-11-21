({
    handleFilesChange: function(component, event, helper) {
        var files = event.getSource().get("v.files");
        component.set("v.FileList", files[0]); 
        console.log(files.length + ' files !!');
    },
    
    uploadFileHandler: function(component, event, helper) {
        var file = component.get("v.FileList");
        console.log('uploadfileHandler'+file);
        if (file) {
            component.set("v.isLoading",true);
            helper.uploadFileHelper(component, file);
        }
    }
})