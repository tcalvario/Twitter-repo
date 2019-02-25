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
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
