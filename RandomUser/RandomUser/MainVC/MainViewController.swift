//
//  MainViewController.swift
//  RandomUser
//
//  Created by Arsenkin Bogdan on 07.03.2020.
//  Copyright © 2020 Arsenkin Bogdan. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let requestUser = NetworkManager<Users>()
    var users = Users()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        tableViewSetup()
        makeRequest()
    }
    
    private func makeRequest() {
        
        guard let url = URL(string: Constants.url) else { return }
        
        requestUser.requestData(with: url, fail: { (errorMessage) in
            print(errorMessage)
        }, success: { (models) in
            self.users = models
            self.tableView.reloadData()
        })
        
        
    }
    
    private func setupUI() {
        self.title = "RandomUsers"
    }
    
    private func tableViewSetup() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: MainCustomTableViewCell.classNaming, bundle: nil), forCellReuseIdentifier: MainCustomTableViewCell.classNaming)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainCustomTableViewCell.classNaming, for: indexPath) as? MainCustomTableViewCell else { return UITableViewCell() }
        
        let user = users.results[indexPath.row]
        
        cell.fill(with: user)
        
        return cell
    }
}
