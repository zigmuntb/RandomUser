//
//  UserInfoViewController.swift
//  RandomUser
//
//  Created by Arsenkin Bogdan on 07.03.2020.
//  Copyright © 2020 Arsenkin Bogdan. All rights reserved.
//

import UIKit
import MessageUI

class UserInfoViewController: UIViewController, MFMailComposeViewControllerDelegate {

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

    @IBAction func callButtonTapped(_ sender: UIButton) {
        presentCallAlert()
    }
    
    @IBAction func mailButtonTapped(_ sender: UIButton) {
        sendEmail()
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
    
    private func presentCallAlert() {
        let alert = UIAlertController(title: "Call \(user.name.firstName)", message: "Please select a number to call", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Phone: \(user.phone)", style: .default, handler: { (_) in
            guard let number = URL(string: "tel://" + self.user.phone) else { return }
            UIApplication.shared.open(number)
        }))
        
        alert.addAction(UIAlertAction(title: "Cell: \(user.cell)", style: .default, handler: { (_) in
            guard let number = URL(string: "tel://" + self.user.cell) else { return }
            UIApplication.shared.open(number)
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (_) in
            print("Cancelled")
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func sendEmail() {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["\(user.email)"])
            mail.setMessageBody("<p>You're so awesome!</p>", isHTML: true)

            present(mail, animated: true)
        } else {
            print("There was an error opening mail")
        }
    }

    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
}
