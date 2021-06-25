//
//  GridCell.swift
//  MovieTest
//
//  Created by Denny Arfansyah on 25/06/21.
//

import LBTAComponents

class GridCell: UICollectionViewCell {
    
    let genreLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        backgroundColor = .lightGray
        
        contentView.addSubview(genreLabel)
        genreLabel.translatesAutoresizingMaskIntoConstraints = false
        genreLabel.numberOfLines = 0
        genreLabel.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body)
        genreLabel.textAlignment = .center
        
        genreLabel.anchor(nil, left: contentView.leftAnchor, bottom: nil, right: contentView.rightAnchor, topConstant: 0, leftConstant: 10, bottomConstant: 0, rightConstant: 10, widthConstant: 0, heightConstant: 0)
        genreLabel.anchorCenterSuperview()
    }
    
    func setupData(with movie: Movie) {
        genreLabel.text = movie.title
    }
    
}
