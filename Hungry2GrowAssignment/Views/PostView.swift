//
//  PostView.swift
//  Hungry2GrowAssignment
//
//  Created by Shreyas Sahoo on 19/04/24.
//

import SwiftUI

struct PostView: View {
    let post : Post
    var body: some View {
        VStack{
            HStack{
                Text(" \(post.title.capitalized)")
                    .bold()
                    .font(.subheadline)
                Spacer()
                
                Circle()
                    .frame(width:30)
                    .overlay {
                        Text("\(post.id)")
                            .fontWeight(.bold)
                            .foregroundStyle(.blue)
                    }
            }
            
            HStack{
                Text("\(post.body.replacingOccurrences(of: "\n", with: ""))")
                    .font(.caption)
                Spacer()
                
            }
            .font(.caption)
        }
        .padding()
        .background(Color.blue)
        .clipShape(.rect(cornerRadius: 20))
        .foregroundStyle(.white)
        .shadow(color: Color.blue.opacity(0.3),radius: 20,x:0,y:10)
        .shadow(color: Color.blue.opacity(0.2),radius: 10,x:0,y:2)
    }
}

#Preview {
    PostView(post:samplePost)
}
