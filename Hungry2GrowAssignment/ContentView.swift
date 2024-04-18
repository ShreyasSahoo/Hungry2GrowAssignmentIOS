//
//  ContentView.swift
//  Hungry2GrowAssignment
//
//  Created by Shreyas Sahoo on 18/04/24.
//

import SwiftUI
import MapKit
struct ContentView: View {
    @StateObject private var viewModel = ViewModel(controller: FetchController())
    @State var searchText = ""
    var body: some View {
        GeometryReader{ geo in
            VStack{
                switch viewModel.status {
                case .success(let data):
                    NavigationStack{
                        List(searchPosts(by: searchText, posts: data.posts)){ post in
                            NavigationLink{
                                PostDetailsView(position: .camera(MapCamera(centerCoordinate: findUser(by: post.userId, users: data.users)!.address.geo.location, distance: 3000)), post: post, user: findUser(by: post.userId, users: data.users)!)
                            } label: {
                                PostView(post: post)
                            }
                            
                            .toolbar {
                                ToolbarItem(placement: .principal) {
                                            VStack {
                                                Text("Posts")
                                                    .padding()
                                                    .font(.title)
                                                    .bold()
                                                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                                                    .foregroundColor(Color.blue)
                                            }
                                        }
                                    }
                            .navigationBarTitleDisplayMode(.inline)
                            .searchable(text:$searchText)
                            .autocorrectionDisabled()
                            .animation(.easeIn,value : searchText)
                            .textInputAutocapitalization(.never)
                            .listRowSeparator(.hidden)
                            .listRowBackground(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                .background(Color.clear)
                                .foregroundColor(Color.clear)
                                .opacity(0.3))
                                .listRowSpacing(10)
                        }
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    }
                    
                    
                    
                    
                case .fetching :
                    ProgressView()
                case .failed(error: let error):
                    VStack(alignment:.center){
                        Spacer()

                        Text("\(error.localizedDescription)")
                            .foregroundStyle(.white)
                            .font(.title)
                            .padding()
                        
                            .background(Color("BabyRed"))
                            .clipShape(.rect(cornerRadius: 20))
                            
                        Spacer()
                    }
                    
                    
                    
                default :
                    Text("\(viewModel.status)")
                }
                
            }
          
            .task{
                await viewModel.getPosts()
            }
        }
        .ignoresSafeArea()
    }
    func findUser(by id: Int, users : [User])->User?{
        
         return users.first { $0.id == id }
    }
    func searchPosts(by searchText : String, posts : [Post])->[Post]{
        if(searchText==""){
            return posts
        }
           
        else{   return posts.filter {$0.title.contains(searchText)}    }
            
        }
         
}
#Preview {
    ContentView()
        
}


