//
//  ContentView.swift
//  Moonshot
//
//  Created by Danjuma Nasiru on 18/01/2023.
//

import SwiftUI

struct ContentView: View {
    
    let astronauts: [String:Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let formatter = DateFormatter()
    @State private var gridView = true
    //formatter.dateFormat = "y-MM-dd"
    let columns = [GridItem(.adaptive(minimum: 150))]
    var body: some View {
        NavigationView{
            if gridView{
                GridContentView(astronauts: astronauts, missions: missions, columns: columns).toolbar{
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button{
                            gridView.toggle()
                        } label: {
                            Image(systemName: "rectangle.grid.1x2")
                        }
                    }
                }
            }else{
                ListContentView(missions: missions, astronauts: astronauts).toolbar{
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button{
                            gridView.toggle()
                        } label: {
                            Image(systemName: "square.grid.2x2")
                        }
                    }
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
