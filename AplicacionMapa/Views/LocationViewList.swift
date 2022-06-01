//
//  LocationViewList.swift
//  AplicacionMapa
//
//  Created by Luciano Nicolini on 30/05/2022.
//

import SwiftUI

struct LocationViewList: View {
    @EnvironmentObject private var vm: LocationViewModel
    
    var body: some View {
        List  {
            ForEach(vm.locations) { location in
                Button {
                    vm.showNextLocation(location: location)
                } label: {
                    listRowView(location: location)
                }
                .padding(.vertical)
                .listRowBackground(Color.clear)
                
            }
        }
        .listStyle(PlainListStyle())
    }
}

struct LocationViewList_Previews: PreviewProvider {
    static var previews: some View {
        LocationViewList()
            .environmentObject(LocationViewModel())
    }
}

//Modelo de LISTA
//Extencion LocationViewList
extension LocationViewList {
    
    private func listRowView(location: Location) -> some View {
        HStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 45, height: 45)
                    .cornerRadius(10)
            }
            VStack(alignment: .leading) {
                Text(location.name)
                    .font(.headline)
                Text(location.cityName)
                    .font(.subheadline)
            }
            //.background(Color.red)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
