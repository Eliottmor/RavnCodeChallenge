# RavnCodeChallenge

In the GitHubService.swift file there is a location to add a token. I left a comment where it should go. It should replace "\<token\>".
Once the token is added, it will be good to run. 

I used MVC architecture. I have the github service that loads all the information based on the search. Once the information loads
I send it to the ViewController to display the data. I use the delegate pattern to let the viewController know when the data is ready
so it can reload the table. 
