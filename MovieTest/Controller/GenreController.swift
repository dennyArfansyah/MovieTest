//
//  ViewController.swift
//  MovieTest
//
//  Created by Denny Arfansyah on 24/06/21.
//

import UIKit

class GenreController: UITableViewController {
    
    var isSuccess = true
    var genreViewModel: GenreViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        genreViewModel = GenreViewModel(tableView: tableView)
    }
    
}
