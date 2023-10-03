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
                ForEach(cities) { city in
                    HStack {
                        Text(city.name)
                        Spacer()
                        Text(city.country.first?.name ?? "No Country")
                    }
                }
                .onDelete(perform: deleteCity)
            }
        }
    }
    
    func deleteCity(indexSet: IndexSet) {
        guard let index = indexSet.first else {return}
        let selectedCity = Array(cities)[index]
        $cities.remove(selectedCity)
    }
}

struct AllCitiesListView_Previews: PreviewProvider {
    static var previews: some View {
        AllCitiesListView()
    }
}
