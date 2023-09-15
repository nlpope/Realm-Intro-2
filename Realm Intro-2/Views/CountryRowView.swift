//
//  CountryRowView.swift
//  Realm Intro-2
//
//  Created by Noah Pope on 8/4/23.
//

import SwiftUI
import RealmSwift

struct CountryRowView: View {
    @ObservedRealmObject var country: Country
    @FocusState var isFocused: Bool?
    
    var body: some View {
        HStack {
            TextField("New Country", text: $country.name)
                .focused($isFocused, equals: true)
                .textFieldStyle(.roundedBorder)
                .padding()
                .frame(height: 30)
            Spacer()
            Text("\(country.cities.count) cities")
        }
        
    }
}

struct CountryRowView_Previews: PreviewProvider {
    static var previews: some View {
        CountryRowView(country: Country(name: "Canada"))
    }
}
