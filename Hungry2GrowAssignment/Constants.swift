//
//  SamplePost.swift
//  Hungry2GrowAssignment
//
//  Created by Shreyas Sahoo on 18/04/24.
//

import Foundation
let samplePost: Post = {
    let jsonString = """
        {
            "userId": 1,
            "id": 10,
            "title": "optio molestias id quia eum",
            "body": "quo et expedita modi cum officia vel magnindoloribus qui repudiandaenvero nisi sit\\nquos veniam quod sed accusamus veritatis error"
        }
        """
    let jsonData = Data(jsonString.utf8)
    let decoder = JSONDecoder()
    let post = try! decoder.decode(Post.self, from: jsonData)
    return post
}()
let sampleUser : User = {
    let jsonString = """
        {
          "id": 1,
          "name": "Leanne Graham",
          "username": "Bret",
          "email": "Sincere@april.biz",
          "address": {
            "street": "Kulas Light",
            "suite": "Apt. 556",
            "city": "Gwenborough",
            "zipcode": "92998-3874",
            "geo": {
              "lat": "17.3159",
              "lng": "11.1496"
            }
          },
          "phone": "1-770-736-8031 x56442",
          "website": "hildegard.org",
          "company": {
            "name": "Romaguera-Crona",
            "catchPhrase": "Multi-layered client-server neural-net",
            "bs": "harness real-time e-markets"
          }
        }
        """
    let jsonData = Data(jsonString.utf8)
    let decoder = JSONDecoder()
    let user = try! decoder.decode(User.self, from: jsonData)
    return user
}()
