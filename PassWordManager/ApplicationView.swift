//
//  ApplicationView.swift
//  PassWordManager
//
//  Created by Mathis Higuinen on 09/10/2022.
//

import SwiftUI

struct ApplicationView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        Group{
            if viewModel.userSession == nil {
               LoginView()
                    .environmentObject(viewModel)
            }else{
                Button {
                    viewModel.logout()
                } label: {
                    Text("reload")
                }

                if let user = viewModel.currentUser {
                    ContentView(user:user)
                        
                }
            }
        }
    }
}

struct ApplicationView_Previews: PreviewProvider {
    static var previews: some View {
        ApplicationView()
            .environmentObject(AuthViewModel())
    }
}
