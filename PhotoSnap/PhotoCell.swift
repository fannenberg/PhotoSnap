//
//  PhotoCell.swift
//  PhotoSnap
//
//  Created by Fernanda on 3/19/16.
//  Copyright © 2016 Maria C. All rights reserved.
//

import UIKit
import Parse
import AFNetworking

class PhotoCell: UITableViewCell {

    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var picturePost: UIImageView!
    @IBOutlet weak var captionLabel: UILabel!
    

    var post: PFObject! {
        didSet {
            captionLabel.text = post["caption"] as? String
            let file = post["media"] as? PFFile
            let url = NSURL(string: (file?.url)!)
            picturePost.setImageWithURL(url!)
            usernameLabel.text = PFUser.currentUser()?.username
            
            picturePost.layer.cornerRadius = 4
            picturePost.clipsToBounds = true
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
