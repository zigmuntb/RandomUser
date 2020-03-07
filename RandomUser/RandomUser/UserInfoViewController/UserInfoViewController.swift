//
//  UserInfoViewController.swift
//  RandomUser
//
//  Created by Arsenkin Bogdan on 07.03.2020.
//  Copyright © 2020 Arsenkin Bogdan. All rights reserved.
//

import UIKit

class UserInfoViewController: UIViewController {

    var user = UserModel()
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var dateOfBirthLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var cellNumberLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    init(model: UserModel) {
        super.init(nibName: nil, bundle: nil)
        
        user = model
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    private func setupUI() {
        self.title = user.username.username
        imageView.layer.cornerRadius = imageView.frame.height/2
        imageView.layer.masksToBounds = true
        ImageLoader.loadImage(with: .grayLarge, urlString: user.picture.avatarURL, imageView: imageView, completion: nil)
        
        nameLabel.text = user.name.firstName + " " + user.name.lastName
        genderLabel.text = "Gender: \(user.gender)"
        dateOfBirthLabel.text = "Date of birth: " + String(user.dateOfBirth.dateOfBirth.prefix(10))
        phoneNumberLabel.text = user.phone
        cellNumberLabel.text = user.cell
        emailLabel.text = user.email
    }
}
