//
//  AstronautView.swift
//  Moonshot
//
//  Created by Danjuma Nasiru on 19/01/2023.
//

import SwiftUI

struct AstronautView: View {
    let astronaut : Astronaut
    var body: some View {
        ScrollView{
            VStack{
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .circular))
                    .overlay(content: {RoundedRectangle(cornerRadius: 10, style: .circular).stroke(.lightBackground)})
                
                Text(astronaut.description).padding(.vertical)
            }.padding()
        }
        .background(.darkBackground)
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.automatic)
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [String : Astronaut] = Bundle.main.decode("astronauts.json")
    static var previews: some View {
        AstronautView(astronaut: astronauts["aldrin"]!)
    }
}
