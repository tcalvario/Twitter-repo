//
//  HomeTableViewController.swift
//  Twitter
//
//  Created by Teodoro Calvario on 2/24/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {
    
    var tweetArray = [NSDictionary]()
    var numberOfTweets: Int!
    
    
    func loadtweets(){
        
        let myURL = "https://api.twitter.com/1.1/statuses/home_timeline.json"
        let myParams = ["count": 10]
        TwitterAPICaller.client?.getDictionariesRequest(url: myURL, parameters: myParams, success:
            {(tweets: [NSDictionary]) in
                
                self.tweetArray.removeAll()
                for tweet in tweets {
                    self.tweetArray.append(tweet)
                }
                
                self.tableView.reloadData()

                
                
        }, failure: { (Error) in
            print("Something went wrong Yo... Fix it")
        })
    }

    @IBAction func onLogout(_ sender: Any) {
        TwitterAPICaller.client?.logout()
        self.dismiss(animated: true, completion: nil)
        UserDefaults.standard.set(false, forKey: "userloggedin")
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tweetCell", for: indexPath) as! TweetsCellTableViewCell
        let user = tweetArray[indexPath.row]["user"] as! NSDictionary
        
        cell.tweetsContents.text =  tweetArray[indexPath.row]["text"] as? String
        cell.userName.text = user["name"] as! String
        
        let imageURL = URL(string: (user["profile_image_url_https"]as? String)!)
        let data = try? Data(contentsOf: imageURL!)
        
        if let imageData = data {
            cell.profileImage.image = UIImage(data: imageData)
        }
        
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadtweets()
       
    }

   

    override func numberOfSections(in tableView: UITableView) -> Int {
       return 1

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tweetArray.count
    }
    
}
