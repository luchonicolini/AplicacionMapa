//
//  LocationDetailView.swift
//  AplicacionMapa
//
//  Created by Luciano Nicolini on 31/05/2022.
//

import SwiftUI
import MapKit

struct LocationDetailView: View {
    var location: Location
    @EnvironmentObject private var vm: LocationViewModel
 
    var body: some View {
        ScrollView {
            VStack {
                imageSection
                    .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
                VStack(alignment: .leading, spacing: 16){
                    tilteSection
                    Divider()
                    descriptionSection
                    Divider()
                    mapLayer
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    
                    
                }
                
            }
        .ignoresSafeArea()
        .background(.ultraThinMaterial)
        .overlay(backbutton, alignment: .topLeading)
        }
    }




struct LocationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDetailView(location: LocationsDataService.locations.first!)
            .environmentObject(LocationViewModel())
    }
}

//ForEch-> image
extension LocationDetailView {
    private var imageSection: some View {
        VStack {
            TabView {
                ForEach(location.imageNames, id: \.self) {
                    Image($0)
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIDevice.current.userInterfaceIdiom == .pad ? nil : UIScreen.main.bounds.width)
                        //.frame(width: UIScreen.main.bounds.width)
                        .clipped()
                }
            }
        }
        .frame(height: 500)
        .tabViewStyle(PageTabViewStyle())
    }
    
    //Titulo
    private var tilteSection: some View {
        VStack(alignment: .leading, spacing: 8){
            Text(location.name)
                .font(.largeTitle)
                .fontWeight(.semibold)
            Text(location.name)
                .font(.title3)
                .foregroundColor(.secondary)
            
        }
    }
    //Descipcion
    private var descriptionSection: some View {
        VStack(alignment: .leading, spacing: 8){
            Text(location.description)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            if let url = URL(string: location.link) {
                Link("View NavigationWeb", destination: url)
                    .font(.headline)
                    .tint(.blue)
            }
        }
    }
    
    //map
    private var mapLayer: some View {
        Map(coordinateRegion: .constant(MKCoordinateRegion(center: location.coordinates, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))), annotationItems: [location]) { location in
            MapAnnotation(coordinate: location.coordinates) {
                LocationAnotacion()
                    .shadow(radius: 10)
            }
        }
        .allowsHitTesting(false)
        .aspectRatio(1,contentMode: .fit)
        .cornerRadius(30)
    }
    private var backbutton: some View {
        Button {
            vm.sheetLocation = nil
        } label: {
            Image(systemName: "xmark")
                .font(.headline)
                .padding(16)
                .foregroundColor(.primary)
                .background(.thickMaterial)
                .cornerRadius(10)
                .shadow(radius: 4)
                .padding()
        }
    }
}


