//
//  LocationAnotacion.swift
//  AplicacionMapa
//
//  Created by Luciano Nicolini on 31/05/2022.
//

import SwiftUI

struct LocationAnotacion: View {
    let AccentColor = Color("AccentColor")
    var body: some View {
        VStack(spacing: 0){
            Image(systemName:"map.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .font(.headline)
                .foregroundColor(.white)
                .padding(6)
                .background(Color("AccentColor"))
                .cornerRadius(36)
            
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(AccentColor)
                .frame(width: 10, height: 10)
                .rotationEffect(Angle(degrees: 180))
                .offset(y: -3)
                .padding(.bottom,40)
        }
    }
}

struct LocationAnotacion_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            LocationAnotacion()
        }
    }
}
