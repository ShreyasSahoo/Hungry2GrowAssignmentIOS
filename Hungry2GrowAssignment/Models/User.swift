//
//  User.swift
//  Hungry2GrowAssignment
//
//  Created by Shreyas Sahoo on 18/04/24.
//

import MapKit
struct User : Decodable {
    let id : Int
    let name : String
    let username : String
    let email : String
    let website : String
    let address : Address
    
   
}

struct Address : Decodable {
    let geo : Geo
    
    struct Geo : Decodable {
        let lat : String
        let lng : String
        var location : CLLocationCoordinate2D {
            CLLocationCoordinate2D(latitude: Double(lat)!, longitude: Double(lng)!)
        }
    }
}
