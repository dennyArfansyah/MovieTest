//
//  ReviewCell.swift
//  MovieTest
//
//  Created by Denny Arfansyah on 26/06/21.
//

import LBTAComponents

class ReviewCell: UITableViewCell {
    
    let authorLabel = UILabel()
    let contentLabel = UILabel()
    let lineView = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(authorLabel)
        authorLabel.numberOfLines = 0
        authorLabel.font = UIFont.boldSystemFont(ofSize: 13)
        authorLabel.anchor(contentView.topAnchor, left: contentView.leftAnchor, bottom: nil, right: contentView.rightAnchor, topConstant: 5, leftConstant: 10, bottomConstant: 0, rightConstant: 10, widthConstant: 0, heightConstant: 0)
        
        contentView.addSubview(contentLabel)
        contentLabel.numberOfLines = 0
        contentLabel.font = UIFont.systemFont(ofSize: 13)
        contentLabel.anchor(authorLabel.bottomAnchor, left: contentView.leftAnchor, bottom: nil, right: contentView.rightAnchor, topConstant: 5, leftConstant: 10, bottomConstant: 0, rightConstant: 10, widthConstant: 0, heightConstant: 0)
        
        contentView.addSubview(lineView)
        lineView.anchor(contentLabel.bottomAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, topConstant: 5, leftConstant: 10, bottomConstant: 5, rightConstant: 10, widthConstant: 0, heightConstant: 1)
        lineView.backgroundColor = .lightGray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupData(with review: Review) {
        authorLabel.text = review.author
        contentLabel.text = review.content
    }
    
}
