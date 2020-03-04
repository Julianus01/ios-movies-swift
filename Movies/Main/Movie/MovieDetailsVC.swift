//
//  MovieDetailsVC.swift
//  Movies
//
//  Created by Iulian Crisan on 04/03/2020.
//  Copyright © 2020 julianc. All rights reserved.
//

import UIKit

class MovieDetailsVC: UIViewController {
    
    var movie: Movie!
    var overviewLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = movie.title
        view.backgroundColor = .systemBackground
        
        view.addSubview(overviewLabel)
        overviewLabel.text = movie.overview
        
        overviewLabel.translatesAutoresizingMaskIntoConstraints = false
        overviewLabel.numberOfLines = 0
        
        overviewLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        overviewLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        overviewLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
    }
    
}
