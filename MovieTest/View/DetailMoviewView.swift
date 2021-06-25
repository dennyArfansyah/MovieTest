//
//  DetailMoviewView.swift
//  MovieTest
//
//  Created by Denny Arfansyah on 26/06/21.
//

import LBTAComponents

extension DetailMoviewController {
    
    func setupView() {
        view.backgroundColor = .white
        view.addSubview(self.scrollView)
        
        view.addSubview(reviewButton)
        reviewButton.setTitle("See Review", for: .normal)
        reviewButton.layer.cornerRadius = 10
        reviewButton.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.5)
        reviewButton.anchor(nil, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 10, bottomConstant: 5, rightConstant: 10, widthConstant: 0, heightConstant: 50)
        reviewButton.addTarget(self, action: #selector(reviewButtonPressed), for: .touchUpInside)
        
        scrollView.backgroundColor = .white
        scrollView.translatesAutoresizingMaskIntoConstraints = false;
        scrollView.anchor(view.topAnchor, left: view.leftAnchor, bottom: reviewButton.topAnchor, right: view.rightAnchor, topConstant: 5, leftConstant: 0, bottomConstant: 5, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        scrollView.addSubview(self.mainView)
        mainView.anchor(scrollView.topAnchor, left: scrollView.leftAnchor, bottom: scrollView.bottomAnchor, right: scrollView.rightAnchor, topConstant: 5, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        mainView.backgroundColor = .white
        view.addSubview(youtubePlayer)
        youtubePlayer.backgroundColor = .black
        youtubePlayer.anchor(view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: view.frame.width, heightConstant: view.frame.width)
        
        mainView.addSubview(titleLabel)
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.boldSystemFont(ofSize: 15)
        titleLabel.anchor(youtubePlayer.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 10, leftConstant: 10, bottomConstant: 0, rightConstant: 10, widthConstant: 0, heightConstant: 0)
        titleLabel.text = movie.title
        
        mainView.addSubview(releaseLabel)
        releaseLabel.numberOfLines = 0
        releaseLabel.font = UIFont.systemFont(ofSize: 13)
        releaseLabel.anchor(titleLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 0, leftConstant: 10, bottomConstant: 0, rightConstant: 10, widthConstant: 0, heightConstant: 0)
        releaseLabel.text = String(format: "Release Date : %@", movie.release_date ?? "")
        
        mainView.addSubview(overviewLabel)
        overviewLabel.numberOfLines = 0
        overviewLabel.font = UIFont.systemFont(ofSize: 13)
        overviewLabel.anchor(releaseLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 0, leftConstant: 10, bottomConstant: 0, rightConstant: 10, widthConstant: 0, heightConstant: 0)
        overviewLabel.text = movie.overview
        overviewLabel.textAlignment = .justified
    }
    
}
