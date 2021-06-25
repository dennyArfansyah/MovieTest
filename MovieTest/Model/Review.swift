//
//  Review.swift
//  MovieTest
//
//  Created by Denny Arfansyah on 25/06/21.
//

import RealmSwift

struct Reviews: Decodable {
    
    let page: Int
    let results: [Review]?
}

class Review: Object, Decodable  {
    
    @objc dynamic var author: String = ""
    @objc dynamic var created_at: String? = ""
    @objc dynamic var content: String? = ""
    
    convenience init(author: String, created_at: String, content: String) {
        self.init()
        self.author = author
        self.created_at = created_at
        self.content = content
    }
    
}
