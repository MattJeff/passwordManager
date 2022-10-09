//
//  PassWordManagerApp.swift
//  PassWordManager
//
//  Created by Mathis Higuinen on 09/09/2022.
//

import SwiftUI
import Firebase

@main
struct PassWordManagerApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ApplicationView()
                .environmentObject(AuthViewModel())
        }
    }
}
