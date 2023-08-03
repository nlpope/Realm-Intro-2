//
//  Country.swift
//  Realm Intro-2
//
//  Created by Noah Pope on 8/3/23.
//

import Foundation
import RealmSwift

class Country: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var name: String
    @Persisted var cities: List<City>
    
    convenience init(name: String) {
        self.init()
        self.name = name
    }
}
