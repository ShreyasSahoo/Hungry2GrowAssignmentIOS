//
//  PostDetailsView.swift
//  Hungry2GrowAssignment
//
//  Created by Shreyas Sahoo on 18/04/24.
//

import SwiftUI
import MapKit

struct PostDetailsView: View {
    @State var position : MapCameraPosition
    let post : Post
    let user : User
    var body: some View {
        GeometryReader{ geo in
            ScrollView{
                VStack(alignment: .leading){
                    Text("\(post.title.capitalized)")
                        .font(.title)
                        .padding(.horizontal)
                        .fontWeight(.semibold)
                        .foregroundStyle(.blue)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                       
                    HStack{
                        Spacer()
                        Text("Written by @\(user.username)")
                            .multilineTextAlignment(.trailing)
                            .font(.subheadline)
                            .padding(.horizontal)
                    }
                }
                .padding(.vertical)
                
                //Line
                Divider()
                VStack(alignment:.leading){
                    HStack(alignment:.center){
                        Image(systemName:"note.text")
                            .foregroundStyle(.blue)
                            .font(.title)
                            .padding(.bottom,5)
                        Text("Body")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundStyle(.blue)
                    }
                    
                    HStack{
                        Text("\(post.body.replacingOccurrences(of: "\n", with: ""))")
                            .font(.callout)
                            
                            
                    }
                }
                .padding(.vertical)
                Divider()
                   
                VStack(alignment:.leading){
                    HStack{
                        Image(systemName:"person.circle")
                        Text("More about Writer")
                            .font(.title3)
                    }
                    .foregroundStyle(.blue)
                    .fontWeight(.semibold)
                    .font(.title)
                    .padding(.bottom,5)
                    Text("\(user.name) can be contacted at the email : \(user.email). \nYou can also checkout there website \(user.website) ")
                }
                .padding(.vertical)
                Divider()
                VStack(alignment:.leading){
                    
                    
                    HStack{
                        Image(systemName:"location.circle")
                            .font(.title)
                        Text("His Location")
                            .font(.title3)
                    }
                    .foregroundStyle(.blue)
                    .fontWeight(.semibold)
                    Map(position:$position)
                    {
                        Annotation(user.name, coordinate: user.address.geo.location){
                            Image(systemName:
                                    "mappin.and.ellipse")
                            .font(.largeTitle)
                            .imageScale(.large)
                            .symbolEffect(.pulse)
                        }
                        .annotationTitles(.hidden)
                    }
                    .frame(height: 200)
                    .foregroundStyle(.blue)
                    .multilineTextAlignment(.trailing)
                    .padding(.vertical)
                    
                }
            }
            
            .padding()
            
        }
        
    }
    
}
#Preview {
    NavigationStack{
        PostDetailsView(position: .camera(MapCamera(centerCoordinate: sampleUser.address.geo.location, distance: 3000)), post: samplePost, user: sampleUser)
    }
    
}
