//
//  PostModel.swift
//  Hungry2GrowAssignment
//
//  Created by Shreyas Sahoo on 18/04/24.
//

import Foundation

struct Post : Decodable,Identifiable {
    let id : Int
    let userId : Int
    let title : String
    let body : String
}
