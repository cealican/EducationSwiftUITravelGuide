//
//  AvatarView.swift
//  TravelGuide
//
//  Created by Ali CAN on 31.10.2024.
//

import SwiftUI

struct AvatarView: View {
    var image: Image
    var body: some View {
        image
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: UIScreen.main.bounds.width / 2, height: UIScreen.main.bounds.width / 2)
            .clipShape(.circle)
            .overlay(Circle().stroke(Color.white, lineWidth: 3))
            .shadow(radius: 10)
    }
}

#Preview {
    AvatarView(image: .init("topkapi"))
}
