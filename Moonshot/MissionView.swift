//
//  MissionView.swift
//  Moonshot
//
//  Created by Danjuma Nasiru on 19/01/2023.
//

import SwiftUI

struct CrewMember {
    let role: String
    let astronaut: Astronaut
}

struct CustomDividerView : View{
    var body: some View{
        Rectangle().frame(height: 2).foregroundColor(.lightBackground).padding(.vertical)
    }
}

struct MissionView: View {
    
    
    let crew: [CrewMember]
    
    let mission : Mission
    
    var body: some View {
        GeometryReader{geometry in
            ScrollView{
                VStack{
                    
                    Image(mission.image).resizable().scaledToFit().frame(maxWidth: geometry.size.width * 0.6).padding(.top)
                    
                    Text(mission.launchDate?.formatted(date: .complete, time: .omitted) ?? "N/A").padding(.bottom).font(.subheadline.italic())
                    
                    VStack(alignment: .leading){
                        Text("Mission Highlights").font(.title.bold()).padding(.bottom, 5)
                        
                        CustomDividerView()
                        
                        Text(mission.description)
                        
                        CustomDividerView()
                        
                        Text("Crew")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                        
                    }.padding(.horizontal)
                    
                    MissionScrollView(crew: crew)
                }.padding(.bottom)
            }
        }.navigationTitle(mission.displayName)
            .navigationBarTitleDisplayMode(.automatic)
            .background(.darkBackground)
    }
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        
        self.crew = mission.crew.map{member in
            if let astronaut = astronauts[member.name]{
                return CrewMember(role: member.role, astronaut: astronaut)
            }else{
                fatalError("Missing \(member.name)")
            }
        }
    }
}

struct MissionView_Previews: PreviewProvider {
    static let mission : [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        MissionView(mission: mission[0], astronauts: astronauts).preferredColorScheme(.dark)
    }
}
