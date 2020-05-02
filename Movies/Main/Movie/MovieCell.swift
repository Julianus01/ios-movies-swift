//
//  MovieListCell.swift
//  Movies
//
//  Created by Iulian Crisan on 03/03/2020.
//  Copyright © 2020 julianc. All rights reserved.
//

import UIKit
import Kingfisher

class MovieCell: UITableViewCell {
    
    private final let BASE_URL = "https://image.tmdb.org/t/p/"
    private final let IMAGE_SIZE = "w500/"
    
    var titleLabel = UILabel()
    var overviewLabel = UILabel()
    var ratingLabel = UILabel()
    var posterImage = UIImageView()
    var movie: Movie! {
        didSet {
            titleLabel.text = movie.title
            overviewLabel.text = movie.overview
            ratingLabel.text = movie.voteAverage.description
            
            let url = URL(string: BASE_URL + IMAGE_SIZE + movie.posterPath)
            posterImage.kf.setImage(with: url)
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        initUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(movie: Movie) {
        self.movie = movie
    }
    
}

extension MovieCell {
    
    func initUI() {
        initPosterImage()
        initTitleLabel()
        initOverviewLabel()
        initRatingLabel()
    }
    
    func initTitleLabel() {
        addSubview(titleLabel)
        
        titleLabel.numberOfLines = 1
        titleLabel.lineBreakMode = .byTruncatingTail
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: posterImage.trailingAnchor, constant: 20).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
    }
    
    func initOverviewLabel() {
        addSubview(overviewLabel)
        
        overviewLabel.numberOfLines = 2
        overviewLabel.font = UIFont.systemFont(ofSize: 12)
        overviewLabel.textColor = .systemGray
        
        overviewLabel.translatesAutoresizingMaskIntoConstraints = false
        overviewLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
        overviewLabel.leadingAnchor.constraint(equalTo: posterImage.trailingAnchor, constant: 20).isActive = true
        overviewLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
    }
    
    func initRatingLabel() {
        addSubview(ratingLabel)
        ratingLabel.textColor = .orange
        
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.topAnchor.constraint(equalTo: overviewLabel.bottomAnchor, constant: 40).isActive = true
        ratingLabel.leadingAnchor.constraint(equalTo: posterImage.trailingAnchor, constant: 20).isActive = true
    }
    
    func initPosterImage() {
        addSubview(posterImage)
        posterImage.translatesAutoresizingMaskIntoConstraints = false
        posterImage.contentMode = .scaleAspectFit
        
        posterImage.layer.shadowColor = UIColor.black.cgColor
        posterImage.layer.shadowOpacity = 0.2
        posterImage.layer.shadowOffset = CGSize(width: 0, height: 10)
        posterImage.layer.shadowRadius = 10
        
        posterImage.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        posterImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        posterImage.widthAnchor.constraint(equalToConstant: 80).isActive = true
        posterImage.heightAnchor.constraint(equalToConstant: 120).isActive = true
    }
    
}

