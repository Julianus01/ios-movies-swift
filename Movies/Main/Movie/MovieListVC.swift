//
//  ViewController.swift
//  Movies
//
//  Created by Iulian Crisan on 03/03/2020.
//  Copyright © 2020 julianc. All rights reserved.
//

import UIKit
import Alamofire

class MovieListVC: UIViewController {
    
    private let MOVIE_CELL = "MovieCell"
    var tableView = UITableView()
    
    var movies: [Movie] = []
    var pageNumber = 1
    var isLoadingMore = false;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Popular"
        iniViews()
        fetchInitialMovies()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        if offsetY > contentHeight - scrollView.frame.height {
            if !isLoadingMore {
                fetchMoreMovies()
            }
        }
    }
    
}

// HTTP
extension MovieListVC {
    
    func fetchInitialMovies() {
        let request = AF.request(
            "https://api.themoviedb.org/3/movie/popular",
            method: .get,
            parameters: ["api_key": "e5febdac386ca4c9c59e9379f3b25bac", "page": pageNumber],
            encoding: URLEncoding(destination: .queryString)
        ).validate()
        
        request.responseDecodable(of: MOVIES_API_RESPONSE.self) { (response) in
            guard let movies = response.value?.results else { return }
            self.movies = movies
            self.pageNumber += 1
            self.tableView.reloadData()
        }
    }
    
    func fetchMoreMovies() {
        isLoadingMore = true
        
        let request = AF.request(
            "https://api.themoviedb.org/3/movie/popular",
            method: .get,
            parameters: ["api_key": "e5febdac386ca4c9c59e9379f3b25bac", "page": pageNumber],
            encoding: URLEncoding(destination: .queryString)
        ).validate()
        
        request.responseDecodable(of: MOVIES_API_RESPONSE.self) { (response) in
            guard let movies = response.value?.results else { return }
            self.movies.append(contentsOf: movies)
            self.pageNumber += 1
            self.tableView.reloadData()
            self.isLoadingMore = false
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
        let cell = tableView.dequeueReusableCell(withIdentifier: MOVIE_CELL) as! MovieCell
        let movie = movies[indexPath.row]
        cell.set(movie: movie)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let destinationVC = MovieDetailsVC()
        destinationVC.movie = movies[indexPath.row]
        
        navigationController?.pushViewController(destinationVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// USER INTERFACE
extension MovieListVC: UITableViewDelegate, UITableViewDataSource {
    
    func iniViews() {
        initNavBar()
        initTableView()
    }
    
    func initNavBar() {
        navigationController?.navigationBar.tintColor = .opposite
    }
    
    func initTableView() {
        setTableViewDelegates()
        view.addSubview(tableView)
        
        tableView.rowHeight = 160
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        self.tableView.register(MovieCell.self, forCellReuseIdentifier: MOVIE_CELL)
    }
    
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}
