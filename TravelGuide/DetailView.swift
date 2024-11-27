//
//  DetailView.swift
//  TravelGuide
//
//  Created by Ali CAN on 31.10.2024.
//

import SwiftUI
import MapKit

struct DetailView: View {
    @State private var cameraPosition: MapCameraPosition = .automatic
    @Environment(\.dismiss) var dismiss
    var place: Place
    var body: some View {
        ZStack {
            VStack {
                
                Map(position: $cameraPosition){
                    Marker(place.name, coordinate: place.location)
                        .tint(.orange)
                }
                .frame(height: UIScreen.main.bounds.height / 1.8)
                .mapStyle(.hybrid(elevation: .automatic))
                .onAppear {
                    let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
                    let region = MKCoordinateRegion(center: place.location, span: span)
                    
                    cameraPosition = .region(region)
                }
                .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text(place.description ?? "")
                        .font(.callout)
                        .frame(width: UIScreen.main.bounds.width - 60, alignment: .leading)
                        .padding(.init(top: 20, leading: 12, bottom: 20, trailing: 12))
                    
                    Spacer()
                    
                }
                .background(.white)
                .cornerRadius(10)
                .padding(.init(top: 50, leading: 20, bottom: 20, trailing: 20))
            }
            
            if let image = place.image {
                AvatarView(image: image).offset(y: 30)
            }
            
        }
        .toolbar{
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    HStack {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                        Text(place.name)
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                }

            }
        }
        .toolbarBackground(Color("BaseColor"), for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .background(Color("bg"))
    }
}

#Preview {
    DetailView(place: Place(name: "Topkapı", description: "Topkapı Sarayı", image: Image("topkapi"), location: .init(latitude: 41.012202, longitude: 28.982617)))
}
