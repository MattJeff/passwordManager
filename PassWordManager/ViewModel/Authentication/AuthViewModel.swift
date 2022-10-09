//
//  AuthViewModel.swift
//  Instagram_Clone
//
//  Created by Eren Cem Salta on 4/22/21.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift
import FirebaseFirestore

class AuthViewModel: ObservableObject {
    
    @Published var userSession: Firebase.User?
    @Published var currentUser: User?
    
    static let shared = AuthViewModel()
    
    init() {
        userSession = Auth.auth().currentUser
        fetchUser()
    }
    
    func login(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { (result, err) in
            if let err = err {
                print(err.localizedDescription)
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
            self.fetchUser()
            
        }
    }
    
    func register(withEmail email: String, password: String, username: String) {
        Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
            if let err = err {
                print(err.localizedDescription)
                return
            }
            
            guard let user = result?.user else { return }
            
            let data = ["email": email,
                        "username": username,
                        "uid": user.uid]
            
            Firestore.firestore().collection("users").document(user.uid).setData(data) { err in
                if let err = err {
                    print(err.localizedDescription)
                    return
                }
                
                self.userSession = user
                self.fetchUser()
                
                print("DEBUG: USER CREATED")
            }
            
        }
    }
    
    func logout() {
        self.userSession = nil
        try? Auth.auth().signOut()
    }
    
    func fetchUser() {
        
        guard let uid = userSession?.uid else { return }
        
        Firestore.firestore().collection("users").document(uid).getDocument { (snap, err) in
            if let err = err {
                print(err.localizedDescription)
                return
            }
            
            if let  data = snap?.data() {
                
                let email = data["email"] as! String
                let username = data["username"] as! String
                let uid = data["uid"] as! String
                let imageUrl = data["profileImageURL"] as? String ?? ""
                
                let user = User(username: username, email: email, profileImageURL:imageUrl)
                self.currentUser = user
                
                
            }
            
        }
    }
    
}
