//
//  RepositoryTableViewCell.swift
//  RavnApp
//
//  Created by Eliott Moreno on 12/9/18.
//  Copyright © 2018 Eliott Moreno. All rights reserved.
//

import UIKit

class RepositoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var pullRequestCountLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
