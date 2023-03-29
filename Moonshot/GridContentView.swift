//
//  GridContentView.swift
//  Moonshot
//
//  Created by Danjuma Nasiru on 20/01/2023.
//

import SwiftUI

struct GridContentView: View {
    let astronauts: [String:Astronaut]
    let missions: [Mission]
    //let columns = [GridItem(.adaptive(minimum: 150))]
    let columns : [GridItem]
    
    var body: some View {
        
            ScrollView{
                LazyVGrid(columns: columns){
                    ForEach(missions){mission in
                        NavigationLink{
                            MissionView(mission: mission, astronauts: astronauts)
                        } label: {
                            VStack{
                                Image(mission.image).resizable().scaledToFit().frame(width: 100, height: 100).padding()
                                VStack{
                                    Text(mission.displayName).font(.headline).foregroundColor(.white)
                                    Text(mission.formattedLaunchDate).font(.caption).foregroundColor(.white.opacity(0.5))
                                    //Text(mission.dayFirstFormattedDate).font(.caption).foregroundColor(.white.opacity(0.5))
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(.lightBackground)
                                
                            }.clipShape(RoundedRectangle(cornerRadius: 10)).overlay(content: {RoundedRectangle(cornerRadius: 10).stroke(.lightBackground)})
                        }
                    }
                }.padding([.horizontal, .bottom])
            }.navigationTitle("Moonshot").navigationBarTitleDisplayMode(.inline).background(.darkBackground).preferredColorScheme(.dark)
        
    }
}

struct GridContentView_Previews: PreviewProvider {
    static let missions : [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        GridContentView(astronauts: astronauts, missions: missions, columns: [GridItem(.adaptive(minimum: 150))])
    }
}
