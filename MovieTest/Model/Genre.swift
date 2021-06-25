//
//  Genre.swift
//  MovieTest
//
//  Created by Denny Arfansyah on 25/06/21.
//

import RealmSwift

struct Genres: Decodable {
    
    let genres: [Genre]
}

class Genre: Object, Decodable {
    
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    
    convenience init(id: Int, name: String) {
        self.init()
        self.id = id
        self.name = name
    }
    
}
