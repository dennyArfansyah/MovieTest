//
//  ReviewViewModel.swift
//  MovieTest
//
//  Created by Denny Arfansyah on 25/06/21.
//

import UIKit

class ReviewViewModel {
    
    private let service: ServiceProtocol
    private let movie: Movie!
    var reviews: [Review]?
    private let tableView: UITableView
    var page = 1
    
    init(movie: Movie, tableView: UITableView, service: ServiceProtocol = Service()) {
        self.movie = movie
        self.service = service
        self.tableView = tableView
        getRequest()
    }
    
    func getRequest() {
        let url = URL(string: Constants.reviewUrl + "\(movie.id)/reviews?api_key=520609269154335cdfd2f418e3d8377f&page=\(page)")!
        service.request(with: url, method: .get, parameter: nil) { response in
            switch response {
            case .success(let data):
                do {
                    let review = try JSONDecoder().decode(Reviews.self, from: data)
                    for r in review.results ?? [] {
                        let review = Review(author: r.author, created_at: r.created_at ?? "", content: r.content ?? "")
                        self.reviews?.append(review)
                    }
                    
                    self.tableView.reloadData()
                    
                } catch {
                    print(error.localizedDescription)
                    self.tableView.makeToast(error.localizedDescription)
                }
            case .failure(let err):
                let er = err as NSError
                print("FAILURE", er.domain)
                self.tableView.makeToast(err.localizedDescription)
            }
        }
    }
    
}
