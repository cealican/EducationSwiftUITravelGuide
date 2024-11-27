//
//  ListItemView.swift
//  TravelGuide
//
//  Created by Ali CAN on 31.10.2024.
//

import SwiftUI

struct ListItemView: View {
    var item: Place
    var body: some View {
        HStack {
            (item.image ?? Image("noImage"))
                .resizable()
                .frame(width: 96, height: 85)
                .aspectRatio(contentMode: .fill)
                .cornerRadius(6)
            
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                
                if let description = item.description {
                    Text(description)
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .fontWeight(.bold)
                        .padding(.top, 4)
                }
                
                Spacer()
            }
            .padding(.init(top: 6, leading: 16, bottom: 6, trailing: 6))
            
            Spacer()
        }
        .frame(height: 85)
        .padding(.init(top: 6, leading: 6, bottom: 6, trailing: 6))
        .background(.white)
        .cornerRadius(6)
        
    }
}

#Preview {
    ListItemView(item: Place(name: "Topkapı", description: "Topkapı sarayı", image: Image("topkapi"), location: .init(latitude: 41.012202, longitude: 28.982617)))
}
