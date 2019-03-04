
//
//  TweetViewController.swift
//  Twitter
//
//  Created by Teodoro Calvario on 3/3/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController {
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true,
                completion: nil)
    }
    
    @IBAction func tweets(_ sender: Any) {
        if (!tweetTextView.text.isEmpty){
            TwitterAPICaller.client?.postTweet(tweetSring: tweetTextView.text, success: {
                self.dismiss(animated: true, completion: nil)
            }, failure: { (Error) in
                print("Error Occured with Tweets \(Error)")
                self.dismiss(animated: true, completion: nil)
            })
            
        }
        else{
            self.dismiss(animated: true, completion: nil)
            
        }
    
    }
    
    @IBOutlet weak var tweetTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tweetTextView.becomeFirstResponder()

        // Do any additional setup after loading the view.
    }
    


}
