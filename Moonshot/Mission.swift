//
//  Mission.swift
//  Moonshot
//
//  Created by Danjuma Nasiru on 18/01/2023.
//

import Foundation

struct Mission : Codable, Identifiable{
    
    struct Crewrole : Codable{
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate : Date?
    let crew: [Crewrole]
    let description: String
    
    var displayName : String{
        "Apollo \(id)"
    }
    
    var image: String{
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String{
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
    
    var dayFirstFormattedDate: String{
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/y"
        return formatter.string(from: launchDate ?? Date.now)
    }
}
