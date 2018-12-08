//
//  GitHubTableViewCell.swift
//  RavnApp
//
//  Created by Eliott Moreno on 12/8/18.
//  Copyright © 2018 Eliott Moreno. All rights reserved.
//

import UIKit

class GitHubTableViewCell: UITableViewCell {
    
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var nameLocationLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    
    override func awakeFromNib() {
        roundImage()
    }

    func roundImage(){
        userImageView.layer.masksToBounds = false
        userImageView.layer.borderColor = UIColor.black.cgColor
        userImageView.layer.cornerRadius = userImageView.frame.height/2
        userImageView.clipsToBounds = true
    }
}
