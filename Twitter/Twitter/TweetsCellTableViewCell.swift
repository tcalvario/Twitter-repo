//
//  TweetsCellTableViewCell.swift
//  Twitter
//
//  Created by Teodoro Calvario on 2/24/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class TweetsCellTableViewCell: UITableViewCell {
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var tweetsContents: UILabel!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var favButton: UIButton!
    
    
    var favorited: Bool = false
    var tweetId: Int = -1
    
  
    
    
    func setFavorited(_isFavorited: Bool){
        favorited = _isFavorited
        if(favorited){
            favButton.setImage(UIImage(named: "favor-icon-red"), for: UIControl.State.normal)
        }
        else{
            
            favButton.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal)
            
        }
    }

    
    //   var retweeted: Bool = false
   
    
    func setRetweeted(_ isRetweeted:Bool){
        if(isRetweeted){
            retweetButton.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
            retweetButton.isEnabled = false
            
        }
        else {
            
            retweetButton.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
             retweetButton.isEnabled = true
        }
    }
    
    
    @IBAction func favoriteTweet(_ sender: Any) {
        let toBeFavorited = !favorited
        if (toBeFavorited){
            TwitterAPICaller.client?.FavoriteTweet(tweetID: tweetId, success: {
                self.setFavorited(_isFavorited: true)
            }, failure: { (Error) in
                print("Couldn't Favorite\(Error)")
            })
        }
        
        else{
            
            TwitterAPICaller.client?.unFavoriteTweet(tweetID: tweetId, success: {
                self.setFavorited(_isFavorited: false)
                
            }, failure: { (Error) in
                 print("Couldn't Favorite \(Error)")
            })
            
        }
    }
    
    
    @IBAction func retweet(_ sender: Any) {
        TwitterAPICaller.client?.reTweet(tweetID: tweetId, success: {
            self.setRetweeted(true)
            
        }, failure: { (Error) in
            print("Error while retweeting \(Error)")
        })
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
