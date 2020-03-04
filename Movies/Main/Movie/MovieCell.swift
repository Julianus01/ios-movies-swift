//
//  MovieListCell.swift
//  Movies
//
//  Created by Iulian Crisan on 03/03/2020.
//  Copyright © 2020 julianc. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
    
    private final let BASE_URL = "https://image.tmdb.org/t/p/"
    private final let IMAGE_SIZE = "w500/"
    var titleLabel = UILabel()
    var overviewLabel = UILabel()
    var posterImage = UIImageView()
    var movie: Movie!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        initUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(movie: Movie) {
        self.movie = movie
        titleLabel.text = movie.title
        overviewLabel.text = movie.overview
        
        let url = BASE_URL + IMAGE_SIZE + movie.posterPath
        posterImage.loadFromURL(from: url)
    }
    
}

extension MovieCell {
    
    func initUI() {
        initPosterImage()
        initTitleLabel()
        initOverviewLabel()
    }
    
    func initTitleLabel() {
        addSubview(titleLabel)
        
        titleLabel.numberOfLines = 4
        titleLabel.lineBreakMode = .byTruncatingTail
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: posterImage.trailingAnchor, constant: 20).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
    }
    
    func initOverviewLabel() {
        addSubview(overviewLabel)
        
        overviewLabel.numberOfLines = 5
        overviewLabel.lineBreakMode = .byTruncatingTail
        overviewLabel.font = UIFont.systemFont(ofSize: 12)
        
        overviewLabel.translatesAutoresizingMaskIntoConstraints = false
        overviewLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        overviewLabel.leadingAnchor.constraint(equalTo: posterImage.trailingAnchor, constant: 20).isActive = true
        overviewLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
    }
    
    func initPosterImage() {
        addSubview(posterImage)
        posterImage.translatesAutoresizingMaskIntoConstraints = false
        posterImage.contentMode = .scaleAspectFit
        
        posterImage.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        posterImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        posterImage.widthAnchor.constraint(equalToConstant: 80).isActive = true
        posterImage.heightAnchor.constraint(equalToConstant: 120).isActive = true
    }
    
}

extension UIImageView {
    func loadFromURL(from url: String) {
        guard let imageURL = URL(string: url) else { return }
        
        // just not to cause a deadlock in UI!
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else { return }
            
            let image = UIImage(data: imageData)
            DispatchQueue.main.async {
                self.image = image
            }
        }
    }
}

