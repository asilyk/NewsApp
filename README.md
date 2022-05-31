# NewsApp

The training project for creating applications using the UIKit and Alamofire framework, MVC.

## Objectives and topics of the project:
- URLSession
- JSON
- Alamofire

## Technical assignment
![menu_vc.png](/images/menu_vc.png)
![news_list_vc.png](/images/news_list_vc.png)
![detailed_news_vc.png](/images/detailed_news_vc.png)

Create an application using any public api.
### Important
- Create a JSON Parsing Model
- Decompress JSON and display data on screen
- Bring all network work to the class NetworkManager
### Notes
- The JSON Parsing method must have at least one mandatory parameter with closure. If you call the method to the controller in the closure block, you must return an instance of the model (an array of instances) whose property values must be passed to the appropriate interface elements. This is called asynchronous data transfer from the network manager to your controller.
- You can use the Result type (optional) for asynchronous data transfer and error handling of network requests.
- Need to manually decode JSON
