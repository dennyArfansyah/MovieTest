//
//  Movie.swift
//  MovieTest
//
//  Created by Denny Arfansyah on 25/06/21.
//

import RealmSwift

struct Movies: Decodable {
    
    let page: Int
    let total_pages: Int
    let total_results: Int
    let results: [Movie]?
}

class Movie: Object, Decodable {
    
    @objc dynamic var id: Int = 0
    @objc dynamic var title: String = ""
    @objc dynamic var poster_path: String? = ""
    @objc dynamic var release_date: String? = ""
    @objc dynamic var overview: String? = ""
    
    convenience init(id: Int, title: String, poster_path: String, release_date: String, overview: String) {
        self.init()
        self.id = id
        self.title = title
        self.poster_path = poster_path
        self.release_date = release_date
        self.overview = overview
    }
    
}
