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
    var body: some View {
        //$ = binding it to name property
        TextField("New Country", text: $country.name)
            .textFieldStyle(.roundedBorder)
            .padding()
            .frame(height: 30)
    }
}

struct CountryRowView_Previews: PreviewProvider {
    static var previews: some View {
        CountryRowView(country: Country(name: "Canada"))
    }
}
