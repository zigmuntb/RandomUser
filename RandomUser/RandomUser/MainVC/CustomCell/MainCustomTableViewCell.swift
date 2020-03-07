//
//  MainCustomTableViewCell.swift
//  RandomUser
//
//  Created by Arsenkin Bogdan on 07.03.2020.
//  Copyright © 2020 Arsenkin Bogdan. All rights reserved.
//

import UIKit

class MainCustomTableViewCell: UITableViewCell, ClassNaming {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usersInfoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func fill(with model: UserModel) {
        nameLabel.text = model.name.firstName + " " + model.name.lastName
        usersInfoLabel.text = model.location.city + ", " + model.location.state
        ImageLoader.loadImage(with: .grayLarge, urlString: model.picture.avatarURL, imageView: avatarImageView, completion: nil)
    }
    
}
