//
//  Place.swift
//  TravelGuide
//
//  Created by Ali CAN on 31.10.2024.
//
import Foundation
import SwiftUICore
import CoreLocation

struct Place: Identifiable {
    var id: UUID = .init()
    var name: String
    var description: String?
    var image: Image?
    var location: CLLocationCoordinate2D
}
