//
//  MovieViewModel.swift
//  MovieTest
//
//  Created by Denny Arfansyah on 25/06/21.
//

import UIKit

class MovieViewModel {
    
    private let service: ServiceProtocol
    private let collectionView: UICollectionView
    private let genre:Genre!
    var movies = [Movie]()
    var page = 1
    
    init(genre: Genre, collectionView: UICollectionView, service: ServiceProtocol = Service()) {
        self.genre = genre
        self.collectionView = collectionView
        self.service = service
        getRequest(page: page, genreId: genre.id)
    }
    
    func getRequest(page: Int, genreId: Int) {
        let url = URL(string: Constants.moviesUrl + "&page=\(page)&with_genres=\(genreId)")!
        service.request(with: url, method: .get, parameter: nil) { response in
            switch response {
            case .success(let data):
                do {
                    let movies = try JSONDecoder().decode(Movies.self, from: data)
                    for m in movies.results ?? [] {
                        let movie = Movie(id: m.id, title: m.title, poster_path: m.poster_path ?? "", release_date: m.release_date ?? "", overview: m.overview ?? "")
                        self.movies.append(movie)
                    }
                    
                    self.collectionView.reloadData()
                } catch {
                    print(error.localizedDescription)
                    self.collectionView.makeToast(error.localizedDescription)
                }
            case .failure(let err):
                let er = err as NSError
                print("FAILURE", er.domain)
                self.collectionView.makeToast(err.localizedDescription)
            }
        }
    }
    
    func loadMore() {
        page += 1
        getRequest(page: page, genreId: genre.id)
    }
    
}
