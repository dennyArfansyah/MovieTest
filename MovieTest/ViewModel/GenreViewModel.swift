//
//  GenreViewModel.swift
//  MovieTest
//
//  Created by Denny Arfansyah on 25/06/21.
//

import Foundation
import RealmSwift
import Toast_Swift

class GenreViewModel {
    
    private let service: ServiceProtocol
    var genres = [Genre]()
    private let tableView: UITableView
    
    init(tableView: UITableView, service: ServiceProtocol = Service()) {
        self.service = service
        self.tableView = tableView
        getRequest()
    }
    
    func getRequest() {
        let url = URL(string: Constants.genreUrl)!
        service.request(with: url, method: .get, parameter: nil) { response in
            switch response {
            case .success(let data):
                do {
                    let genre = try JSONDecoder().decode(Genres.self, from: data)
                    self.genres = genre.genres.map { return Genre(id: $0.id, name: $0.name) }
                    self.tableView.reloadData()
                    
                    self.insertGenre()
                    
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
    
    func insertGenre() {
        let localRealm = try! Realm()
        try! localRealm.write {
            localRealm.add(genres)
        }
    }
}
