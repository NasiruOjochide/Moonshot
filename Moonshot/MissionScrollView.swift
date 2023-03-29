//
//  MissionScrollView.swift
//  Moonshot
//
//  Created by Danjuma Nasiru on 20/01/2023.
//

import SwiftUI

struct MissionScrollView: View {
    
    var crew : [CrewMember]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                ForEach(crew, id: \.role){crewMember in
                    NavigationLink{
                        AstronautView(astronaut: crewMember.astronaut)
                    } label: {
                        HStack{
                            Image(crewMember.astronaut.id).resizable().frame(width: 104, height: 72).clipShape(Circle()).overlay{Circle().strokeBorder(.white, lineWidth: 1)}
                            
                            VStack(alignment : .leading){Spacer()
                                Text(crewMember.astronaut.name).foregroundColor(.white)
                                    .font(.headline)
                                Spacer()
                                Text(crewMember.role.contains("Commander") ? "\(crewMember.role) 👨🏽‍✈️"  : crewMember.role).foregroundColor(.secondary)
                                Spacer()
                        }
                        
                        
                        }.padding(.horizontal)
                    }
                }
            }
        }
    }
    
    
}

//struct MissionScrollView_Previews: PreviewProvider {
//    static let missions : [Mission] = Bundle.main.decode("missions.json")
//    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
//    
//    
//    static var previews: some View {
//        MissionScrollView(crew: )
//    }
//}
