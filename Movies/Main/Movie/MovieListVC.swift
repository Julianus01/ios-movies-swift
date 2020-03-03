//
//  ViewController.swift
//  Movies
//
//  Created by Iulian Crisan on 03/03/2020.
//  Copyright © 2020 julianc. All rights reserved.
//

import UIKit
import Alamofire

let movies_data = ["Saving private Ryan", "Troy", "Joker", "Saving private Ryan", "Troy", "Joker", "Saving private Ryan", "Troy", "Joker", "Saving private Ryan", "Troy", "Joker", "Saving private Ryan", "Troy", "Joker", "Saving private Ryan", "Troy", "Joker", "Saving private Ryan", "Troy", "Joker", "Saving private Ryan", "Troy", "Joker", "Saving private Ryan", "Troy", "Joker", "Saving private Ryan", "Troy", "Joker"]

class MovieListVC: UIViewController {
    
    var tableView = UITableView()
    var movies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Movies"
        iniViews()
        fetchMovies()
    }
    
}

// HTTP
extension MovieListVC {
    
    func fetchMovies() {
        let request = AF.request("https://api.themoviedb.org/3/discover/movie", method: .get, parameters: ["api_key": "e5febdac386ca4c9c59e9379f3b25bac", "page": 1], encoding: URLEncoding(destination: .queryString)).validate()
        
        request.responseDecodable(of: MOVIES_API_RESPONSE.self) { (response) in
            guard let movies = response.value?.results else { return }
            self.movies = movies
            self.tableView.reloadData()
        }
    }
    
}

struct MOVIES_API_RESPONSE: Codable {
    var results: [Movie]
}

// TABLE
extension MovieListVC {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = movies[indexPath.row].title
        
        return cell
    }
}

// USER INTERFACE
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
