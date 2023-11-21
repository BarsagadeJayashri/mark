# What is MarkPrompt
It is a set of API endpoints that allow you to index your content and create LLM-powered apps on top of it, such as a a prompt or an instant search on your docs site.

# Salesforce-MarkPrompt Integration
By integrating Markprompt with salesforce we can directly train the Markprompt from Salesforce Org with Zip file or text file. Add then we can use that data to get answer of questions related to the content provided by us to MarkPrompt

# Steps to install This functionality
* Signup on Markprompt to get token and Development key
* Clone this repo or download as zip file
* Open the donwloaded folder in VS Code
* Authorize a Dev Hub Org
* Make changes in Apex class according to the comments provided in the code(change token and development key)
* Push all metadata to scratch org (sfdx force:source:push)
* Create Tabs for Aura Components (AskAI comp. and TrainMarkPrompt comp.)
* Add the Tabs to your App.

# Usage
* Use Train MarkPrompt Component to the train the Data to MarkPrompt with the help of Zip File or Text File (or we yoiu need to provide Github repo to train Markprompt then you can directly do it from MarkPrompt Account).
* With the help of Ask AI component we can get answers to the questions we have. 

** Note- It will only provide the answer to the question asked if it finds the related content in the data provided by us to train MarkPrompt
