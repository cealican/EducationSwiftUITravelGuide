//
//  ContentView.swift
//  TravelGuide
//
//  Created by Ali CAN on 31.10.2024.
//

import SwiftUI

struct ContentView: View {
    
    var dataList = [
        Place(name: "Sultan Ahmet", description: "Sultan Ahmet Camii", image: Image("sultanahmet"), location: .init(latitude: 41.006124, longitude: 28.977226)),
        Place(name: "Topkapı", description: "Topkapı Sarayı", image: Image("topkapi"), location: .init(latitude: 41.012202, longitude: 28.982617)),
        Place(name: "Selimiye", description: "Selimiye Camii", image: Image("selimiye"), location: .init(latitude: 41.677976, longitude: 26.559704))
        
    ]
    
    var body: some View {
        NavigationView{
            VStack {
                List(dataList) { place in
                    ZStack {
                        NavigationLink(destination: DetailView(place: place)
                            .navigationBarBackButtonHidden(true)) {
                            
                        }.opacity(0)
                        ListItemView(item: place)
                    }
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color("bg"))
                }
                .listStyle(.plain)
                .toolbarBackground(Color("BaseColor"), for: .navigationBar)
                .toolbar(content: {
                    Text("Yerler")
                        .font(.title3)
                        .fontWeight(.bold)
                        .frame(width: UIScreen.main.bounds.width, height: 65)
                        .foregroundColor(.white)
                })
                .toolbarBackground(.visible, for: .navigationBar)
            }
            .background(Color("bg"))
        }
    }
}

#Preview {
    ContentView()
}
