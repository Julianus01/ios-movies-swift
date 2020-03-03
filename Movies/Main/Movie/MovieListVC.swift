//
//  ViewController.swift
//  Movies
//
//  Created by Iulian Crisan on 03/03/2020.
//  Copyright © 2020 julianc. All rights reserved.
//

import UIKit

let movies_data = ["Saving private Ryan", "Troy", "Joker", "Saving private Ryan", "Troy", "Joker", "Saving private Ryan", "Troy", "Joker", "Saving private Ryan", "Troy", "Joker", "Saving private Ryan", "Troy", "Joker", "Saving private Ryan", "Troy", "Joker", "Saving private Ryan", "Troy", "Joker", "Saving private Ryan", "Troy", "Joker", "Saving private Ryan", "Troy", "Joker", "Saving private Ryan", "Troy", "Joker"]

class MovieListVC: UIViewController {
    
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Movies"
        iniViews()
    }
    
}

extension MovieListVC {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies_data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = movies_data[indexPath.row]
        
        return cell
    }
}


extension MovieListVC: UITableViewDelegate, UITableViewDataSource {
    
    func iniViews() {
        view.backgroundColor = .systemBackground
        initTableView()
    }
    
    func initTableView() {
        setTableViewDelegates()
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}
