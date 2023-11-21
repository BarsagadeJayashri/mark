({
    sendMessage: function (component, event, helper) {
        var userMessage = component.get("v.newMessage");
        console.log('userMessage'+userMessage);
        var messages = component.get("v.messages");
        console.log('messages'+messages);
        messages.push({ role: "user", content: userMessage });
        component.set("v.messages", messages);
        console.log('messages1'+JSON.stringify(messages));
		component.set("v.isLoading",true);
        // Call the Apex method to get the API response
        var action = component.get("c.getChatResponse");
        action.setParams({ userMessage : JSON.stringify(messages) });

        action.setCallback(this, function (response) {
            if (response.getState() === "SUCCESS") {
                var apiResponse = response.getReturnValue();
                messages.push({ role: "assistant", content: apiResponse });
                component.set("v.messages", messages);
                console.log(JSON.stringify(apiResponse));
                component.set("v.isLoading",false);
            }
            else{
                component.set("v.isLoading",false);
            }
        });
		component.set("v.newMessage","");
        $A.enqueueAction(action);
    }
})