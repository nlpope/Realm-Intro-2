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
        NavigationView {
            List {
                ForEach(cities) {city in
                    HStack {
                        Text(city.name)
                        Spacer()
                        Text(city.country.first?.name ?? "No Country")
                    }
                }
            }
        }
    }
}

struct AllCitiesListView_Previews: PreviewProvider {
    static var previews: some View {
        AllCitiesListView()
    }
}
