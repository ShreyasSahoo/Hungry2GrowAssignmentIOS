//
//  ViewModel.swift
//  Hungry2GrowAssignment
//
//  Created by Shreyas Sahoo on 18/04/24.
//

import Foundation

@MainActor
class ViewModel : ObservableObject {
    enum Status {
        case notStarted
        case fetching
        case success(data : (posts : [Post] , users : [User]))
        case failed(error: Error)
    }

    @Published private(set) var status : Status = .notStarted
    private let controller : FetchController
    
    init(controller : FetchController){
        self.controller = controller
    }
    
    func getPosts () async {
        status = .fetching
        
        do {
            let posts = try await controller.fetchPosts()
            let users = try await controller.fetchUsers()
            status = .success(data: (posts,users))
            } catch {
            status = .failed(error: error)
            }
        }
    }

   
 
