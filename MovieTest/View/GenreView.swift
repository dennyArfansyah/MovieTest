//
//  GenreView.swift
//  MovieTest
//
//  Created by Denny Arfansyah on 24/06/21.
//

import UIKit

extension GenreController {
    
    func setupLayout() {
        view.backgroundColor = .white
        
        navigationItem.title = "Genre"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return genreViewModel.genres.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let genre = genreViewModel.genres[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = genre.name
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let genre = genreViewModel.genres[indexPath.row]
        navigationController?.pushViewController(MovieController(genre: genre), animated: true)
    }
    
}
