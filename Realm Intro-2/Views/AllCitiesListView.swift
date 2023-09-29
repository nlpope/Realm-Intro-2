//
//  AllCitiesListView.swift
//  Realm Intro-2
//
//  Created by Noah Pope on 9/27/23.
//

import SwiftUI
import RealmSwift

struct AllCitiesListView: View {
    @ObservedResults(City.self, sortDescriptor: SortDescriptor(keyPath: "name")) var cities
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct AllCitiesListView_Previews: PreviewProvider {
    static var previews: some View {
        AllCitiesListView()
    }
}
