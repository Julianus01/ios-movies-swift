//
//  MovieListCell.swift
//  Movies
//
//  Created by Iulian Crisan on 03/03/2020.
//  Copyright © 2020 julianc. All rights reserved.
//

import UIKit
import Kingfisher
import SnapKit

class MovieCell: UITableViewCell {
    
    private final let BASE_URL = "https://image.tmdb.org/t/p/"
    private final let IMAGE_SIZE = "w500/"
    
    let posterImage = UIImageView()
    let titleLabel = UILabel()
    let descriptionLabel = UILabel()
    let ratingValueLabel = UILabel()
    let ratingOutOfLabel = UILabel()
    
    
    var movie: Movie! {
        didSet {
            titleLabel.text = movie.title
            descriptionLabel.text = movie.overview
            ratingValueLabel.text = movie.voteAverage.description
            
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
    
}

extension MovieCell {
    
    func initUI() {
        backgroundColor = .clear
        
        initPosterImage()
        initTitleLabel()
        initDescriptionLabel()
        initRatingValueLabel()
        initRatingOutOfLabel()
    }
    
    func initPosterImage() {
        addSubview(posterImage)
        posterImage.contentMode = .scaleAspectFit
        
        posterImage.layer.shadowColor = UIColor.black.cgColor
        posterImage.layer.shadowOpacity = 0.2
        posterImage.layer.shadowOffset = CGSize(width: 0, height: 10)
        posterImage.layer.shadowRadius = 10
        
        posterImage.translatesAutoresizingMaskIntoConstraints = false
        posterImage.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        posterImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        posterImage.widthAnchor.constraint(equalToConstant: 120).isActive = true
        posterImage.heightAnchor.constraint(equalToConstant: 180).isActive = true
    }
    
    func initTitleLabel() {
        addSubview(titleLabel)
        
        titleLabel.numberOfLines = 2
        titleLabel.lineBreakMode = .byTruncatingTail
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 30).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: posterImage.trailingAnchor, constant: 20).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
    }
    
    func initDescriptionLabel() {
        addSubview(descriptionLabel)
        
        descriptionLabel.numberOfLines = 2
        descriptionLabel.font = UIFont.systemFont(ofSize: 12)
        descriptionLabel.textColor = .systemGray
        
        descriptionLabel.snp.makeConstraints { make in
            make.left.equalTo(posterImage.snp.right).offset(20)
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.right.equalTo(contentView.snp.right).offset(-16)
        }
    }
    
    func initRatingValueLabel() {
        addSubview(ratingValueLabel)
        
        ratingValueLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        ratingValueLabel.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(12)
            make.left.equalTo(posterImage.snp.right).offset(20)
        }
    }
    
    func initRatingOutOfLabel() {
        addSubview(ratingOutOfLabel)
        
        ratingOutOfLabel.text = "/10"
        ratingOutOfLabel.font = UIFont.systemFont(ofSize: 14)
        
        ratingOutOfLabel.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(18)
            make.left.equalTo(ratingValueLabel.snp.right).offset(2)
        }
    }
    
}

