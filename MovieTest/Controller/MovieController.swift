//
//  MovieController.swift
//  MovieTest
//
//  Created by Denny Arfansyah on 25/06/21.
//

import UIKit

class MovieController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    lazy var backButton = UIBarButtonItem()
    lazy var gridButton = UIBarButtonItem()
    lazy var listButton = UIBarButtonItem()
    lazy var noInternetConectionView = UIView()
    var isList = true
    var genre: Genre!
    var viewModel: MovieViewModel!
    
    init(genre: Genre) {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
        self.genre = genre
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        viewModel = MovieViewModel(genre: genre, collectionView: collectionView)
    }
    
}
