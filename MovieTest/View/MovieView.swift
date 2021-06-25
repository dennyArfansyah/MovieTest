//
//  MovieView.swift
//  MovieTest
//
//  Created by Denny Arfansyah on 25/06/21.
//

import UIKit

extension MovieController {
    
    func setupLayout() {
        setupNavigationBar()
        setupCollectionView()
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = false
        let gridImage = UIImage(systemName: "rectangle.grid.2x2")
        gridButton.image = gridImage
        gridButton.target = self
        gridButton.tag = 0
        gridButton.action = #selector(barButonsPressed)
        
        let listImage = UIImage(systemName: "rectangle.grid.1x2.fill")
        listButton.image = listImage
        listButton.target = self
        listButton.tag = 1
        listButton.action = #selector(barButonsPressed)
        
        navigationItem.rightBarButtonItems = [listButton, gridButton]
    }
    
    func setupCollectionView() {
        collectionView.register(ListCell.self, forCellWithReuseIdentifier: "ListCell")
        collectionView.register(GridCell.self, forCellWithReuseIdentifier: "GridCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
    }
    
    //MARK: - Handlers
    @objc func backButtonPressed() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func barButonsPressed(_ sender: UIBarButtonItem) {
        let gridImage = sender.tag == 0 ? "rectangle.grid.2x2.fill" : "rectangle.grid.2x2"
        gridButton.image = UIImage(systemName: gridImage)
        
        let listImage = sender.tag == 0 ? "rectangle.grid.1x2" : "rectangle.grid.1x2.fill"
        listButton.image = UIImage(systemName: listImage)
        
        isList = sender.tag == 0 ? false : true
        collectionView.reloadData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.movies.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let movie = viewModel.movies[indexPath.row]
        if isList {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListCell", for: indexPath) as! ListCell
            cell.setupData(with: movie)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridCell", for: indexPath) as! GridCell
            cell.setupData(with: movie)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width
        if isList {
            return CGSize(width: width, height: 50)
        } else {
            return CGSize(width: (width - 15)/2, height: (width - 15)/2)
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = viewModel.movies[indexPath.row]
        let controller = DetailMoviewController(movie: movie)
        navigationController?.pushViewController(controller, animated: true)
    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == viewModel.movies.count - 1 {
            perform(#selector(loadMore), with: nil, afterDelay: 1.0)
        }
    }
    
    @objc func loadMore() {
        viewModel.loadMore()
    }
    
}
