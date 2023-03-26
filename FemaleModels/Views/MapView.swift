//
//  MapView.swift
//  FemaleModels
//
//  Created by Lem Euro on 30.07.2022.
//

import MapKit
import SwiftUI

struct MapView: View {
    var strangePlace: Country.StrangePlace
    @State private var region = MKCoordinateRegion()
    
    var body: some View {
        Text(strangePlace.name)
            .font(.title.bold())
            .padding(.bottom, 5)
        
        Map(coordinateRegion: $region)
            .ignoresSafeArea(edges: .top)
            .frame(height: 300)
            .onAppear {
                setRegion(strangePlace.locationCoordinate)
            }

        strangePlace.image
            .resizable()
            .scaledToFill()
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
            .offset(y: -130)
            .padding(.bottom, -130)
    }
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static let countries: [Country] = Bundle.main.decode("countries.json")
    
    static var previews: some View {
        MapView(strangePlace: countries[0].place!)
    }
}
