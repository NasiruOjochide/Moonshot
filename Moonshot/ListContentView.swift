//
//  ListContentView.swift
//  Moonshot
//
//  Created by Danjuma Nasiru on 20/01/2023.
//

import SwiftUI

struct ListContentView: View {
    let astronauts: [String:Astronaut]
    let missions: [Mission]
    
    init(missions: [Mission], astronauts: [String: Astronaut]){
        self.missions = missions
        self.astronauts = astronauts
        UITableView.appearance().backgroundColor = UIColor(.darkBackground)
    }
    
    var body: some View {
        
        
        List{
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
            .padding( .bottom)
            .listRowBackground(Color.darkBackground)
            .listRowSeparator(.hidden)
            .preferredColorScheme(.dark)
            
            
            
        }
        .navigationTitle("Moonshot")
        .navigationBarTitleDisplayMode(.inline)
        .listStyle(.inset)
        .background(.red)
        
        
        
        
    }
}


struct ListContentView_Previews: PreviewProvider {
    static let missions : [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        ListContentView(missions: missions, astronauts: astronauts)
    }
}
