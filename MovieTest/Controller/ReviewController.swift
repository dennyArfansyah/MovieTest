//
//  ReviewController.swift
//  MovieTest
//
//  Created by Denny Arfansyah on 25/06/21.
//

import UIKit

class ReviewController: UITableViewController {
    
    var reviewViewModel: ReviewViewModel!
    var movie: Movie!
    lazy var noReviewFoundLabel = UILabel()
    
    init(movie: Movie) {
        super.init(style: .grouped)
        self.movie = movie
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reviewViewModel = ReviewViewModel(movie: movie, tableView: tableView)
        setupLayout()
    }
    
}
