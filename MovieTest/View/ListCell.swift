//
//  ListCell.swift
//  MovieTest
//
//  Created by Denny Arfansyah on 25/06/21.
//

import LBTAComponents

class ListCell: UICollectionViewCell {
    
    let genreLabel = UILabel()
    let lineView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        backgroundColor = .white
        
        contentView.addSubview(genreLabel)
        genreLabel.numberOfLines = 0
        genreLabel.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body)
        genreLabel.text = "OKE"
        
        genreLabel.anchor(nil, left: contentView.leftAnchor, bottom: nil, right: contentView.rightAnchor, topConstant: 0, leftConstant: 10, bottomConstant: 0, rightConstant: 10, widthConstant: 0, heightConstant: 0)
        genreLabel.anchorCenterYToSuperview()
        
        contentView.addSubview(lineView)
        lineView.anchor(nil, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, topConstant: 0, leftConstant: 10, bottomConstant: 2, rightConstant: 10, widthConstant: 0, heightConstant: 1)
        lineView.backgroundColor = .lightGray
    }
    
    func setupData(with movie: Movie) {
        genreLabel.text = movie.title
    }
    
}
