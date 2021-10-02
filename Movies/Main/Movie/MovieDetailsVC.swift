//
//  MovieDetailsVC.swift
//  Movies
//
//  Created by Iulian Crisan on 04/03/2020.
//  Copyright © 2020 julianc. All rights reserved.
//

import UIKit
import Kingfisher
import SnapKit

class MovieDetailsVC: UIViewController {
    
    private final let BASE_URL = "https://image.tmdb.org/t/p/"
    private final let IMAGE_SIZE = "w780/"
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    let posterContainerView = UIView()
    let posterImage = UIImageView()
    let imageTopGradientView = UIView()
    let imageGradientView = UIView()
    let overviewLabel = UILabel()
    
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

// MARK: User Interface
extension MovieDetailsVC {
    
    func initUI() {
        initGeneral()
        initScrollView()
        initContentView()
        initPosterContainerView()
        initPosterImage()
        initTopImageGradientView()
        initImageGradientView()
        initOverviewLabel()
    }
    
    func initGeneral() {
        view.backgroundColor = .systemBackground
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
    
    func initPosterContainerView() {
        contentView.addSubview(posterContainerView)
        
        posterContainerView.snp.makeConstraints { make in
            make.top.equalTo(scrollView)
            make.left.right.equalTo(view)
            make.height.equalTo(posterContainerView.snp.width).multipliedBy(1.5)
        }
    }
    
    
    func initPosterImage() {
        contentView.addSubview(posterImage)
        
        posterImage.contentMode = .scaleAspectFill
        posterImage.clipsToBounds = true
        
        posterImage.snp.makeConstraints { make in
            make.left.right.equalTo(posterContainerView)
            make.top.equalTo(view).priority(.high)
            make.height.greaterThanOrEqualTo(posterContainerView.snp.height).priority(.required)
            make.bottom.equalTo(posterContainerView.snp.bottom)
        }
    }
    
    func initTopImageGradientView() {
        contentView.addSubview(imageTopGradientView)
        
        let colorTop = UIColor(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor.clear
                    
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 80)
        
        imageTopGradientView.layer.insertSublayer(gradientLayer, at:0)
        
        imageTopGradientView.snp.makeConstraints { make in
            make.left.equalTo(posterImage.snp.left)
            make.top.equalTo(posterImage.snp.top)
            make.right.equalTo(posterImage.snp.right)
            make.height.equalTo(80)
        }
    }
    
    func initImageGradientView(){
        contentView.addSubview(imageGradientView)
        
        let colorTop = UIColor.clear
        let colorBottom = UIColor(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 1.0).cgColor
                    
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 80)
        
        imageGradientView.layer.insertSublayer(gradientLayer, at:0)
        
        imageGradientView.snp.makeConstraints { make in
            make.left.equalTo(posterImage.snp.left)
            make.bottom.equalTo(posterImage.snp.bottom)
            make.right.equalTo(posterImage.snp.right)
            make.height.equalTo(80)
        }
    }
    
    func initOverviewLabel() {
        contentView.addSubview(overviewLabel)
        
        overviewLabel.translatesAutoresizingMaskIntoConstraints = false
        overviewLabel.numberOfLines = 0
        
        overviewLabel.topAnchor.constraint(equalTo: posterImage.bottomAnchor, constant: 40).isActive = true
        overviewLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        overviewLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        overviewLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -200).isActive = true
    }
    
}
