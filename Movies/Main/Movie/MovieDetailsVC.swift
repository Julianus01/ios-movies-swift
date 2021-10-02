//
//  MovieDetailsVC.swift
//  Movies
//
//  Created by Iulian Crisan on 04/03/2020.
//  Copyright © 2020 julianc. All rights reserved.
//

import UIKit
import Kingfisher

class MovieDetailsVC: UIViewController {
    
    private final let BASE_URL = "https://image.tmdb.org/t/p/"
    private final let IMAGE_SIZE = "w780/"
    
    var scrollView = UIScrollView()
    var contentView = UIView()
    var overviewLabel = UILabel()
    var posterImage = UIImageView()
    
    var movie: Movie! {
        didSet {
            let url = URL(string: BASE_URL + IMAGE_SIZE + movie.posterPath)
            posterImage.kf.setImage(with: url)
            
            overviewLabel.text = movie.overview
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
    }
    
}





// User Interface
extension MovieDetailsVC {
    
    func initUI() {
        view.backgroundColor = .systemBackground
        initScrollView()
        initContentView()
        initPosterImage()
        initOverviewLabel()
    }
    
    func initScrollView(){
        view.addSubview(scrollView)
        scrollView.alwaysBounceVertical = true
        scrollView.contentInsetAdjustmentBehavior = .never
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
    
    func initContentView() {
        scrollView.addSubview(contentView)
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
    }
    
    
    func initPosterImage() {
        contentView.addSubview(posterImage)
        
        posterImage.contentMode = .scaleAspectFill
        posterImage.clipsToBounds = true
        
        posterImage.translatesAutoresizingMaskIntoConstraints = false
        posterImage.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        posterImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        posterImage.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        posterImage.heightAnchor.constraint(equalToConstant: 550).isActive = true
    }
    
    func initOverviewLabel() {
        contentView.addSubview(overviewLabel)
        
        overviewLabel.translatesAutoresizingMaskIntoConstraints = false
        overviewLabel.numberOfLines = 0
        overviewLabel.font = UIFont.systemFont(ofSize: 12)
        
        overviewLabel.topAnchor.constraint(equalTo: posterImage.bottomAnchor, constant: 40).isActive = true
        overviewLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        overviewLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        overviewLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -200).isActive = true
    }
    
}
