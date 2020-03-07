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
    
    //MARK: - IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var dateOfBirthLabel: UILabel!
    @IBOutlet weak var phoneButton: UIButton!
    @IBOutlet weak var cellButton: UIButton!
    @IBOutlet weak var emailButton: UIButton!
    
    //MARK: - Initialization
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

    //MARK: - IBActions
    @IBAction func callButtonTapped(_ sender: UIButton) {
        presentCallAlert()
    }
    
    @IBAction func mailButtonTapped(_ sender: UIButton) {
        sendEmail()
    }
    @IBAction func phoneButtonTapped(_ sender: UIButton) {
        makeCall(with: user.phone)
    }
    
    @IBAction func cellButtonTapped(_ sender: UIButton) {
        makeCall(with: user.cell)
    }
    
    @IBAction func emailButtonTapped(_ sender: UIButton) {
        sendEmail()
    }
    
    //MARK: - Private
    private func setupUI() {
        self.title = user.username.username
        imageView.layer.cornerRadius = imageView.frame.height/2
        imageView.layer.masksToBounds = true
        ImageLoader.loadImage(with: .grayLarge, urlString: user.picture.avatarURL, imageView: imageView, completion: nil)
        
        nameLabel.text = user.name.firstName + " " + user.name.lastName
        genderLabel.text = "Gender: \(user.gender)"
        dateOfBirthLabel.text = "Date of birth: " + String(user.dateOfBirth.dateOfBirth.prefix(10))
        phoneButton.setTitle(user.phone, for: .normal)
        cellButton.setTitle(user.cell, for: .normal)
        emailButton.setTitle(user.email, for: .normal)
    }
    
    private func presentCallAlert() {
        let alert = UIAlertController(title: "Call \(user.name.firstName)", message: "Please select a number to call", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Phone: \(user.phone)", style: .default, handler: { (_) in
            self.makeCall(with: self.user.phone)
        }))
        
        alert.addAction(UIAlertAction(title: "Cell: \(user.cell)", style: .default, handler: { (_) in
            self.makeCall(with: self.user.cell)
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (_) in
            print("Cancelled")
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    private func makeCall(with number: String) {
        guard let number = URL(string: "tel://" + number) else { return }
        UIApplication.shared.open(number)
    }
    
    private func sendEmail() {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.modalPresentationStyle = .fullScreen
            mail.mailComposeDelegate = self
            mail.setToRecipients(["\(user.email)"])
            mail.setMessageBody("<p>You're so awesome!</p>", isHTML: true)

            present(mail, animated: true)
        } else {
            print("There was an error presenting mail")
        }
    }

    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
}
