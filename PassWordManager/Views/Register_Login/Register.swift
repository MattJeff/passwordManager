//
//  Register.swift
//  PassWordManager
//
//  Created by Mathis Higuinen on 11/09/2022.
//

import SwiftUI

struct Register: View {
    
    @State var username:String = ""
    @State var email:String=""
    @State var password:String=""
    @State var showLogin = false
    @EnvironmentObject var Authmanager: AuthViewModel
    
    var body: some View {
        VStack(spacing:32){
            VStack{
            HStack{
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 36, height: 36)
                   
                Spacer()
              
            }
            VStack(alignment:.leading){
            Text("Register").foregroundColor(Color("Title"))
                .font(.custom("BebasNeue-Regular", size: 64))
                .frame(maxWidth: .infinity, alignment: .leading)
                Text("Let’s get you setup with a new account!")
                    .font(.custom("Poppins", size: 12))
                    .foregroundColor(.gray)
            }
            }
            
            
            VStack(spacing:20){
            
            CustomTexField(text: $username, placeholder: "username123", textFiedlType: .standarField, title: "Username")
            CustomTexField(text: $email, placeholder: "Email", textFiedlType: .standarField, title: "Email")
            CustomTexField(text: $password, placeholder: "Password", textFiedlType: .secureField, title: "Password")
                
                Button {
                    Authmanager.register(withEmail: email, password: password, username: username)
                } label: {
                    CustomButton(size: .large, text: "Register", buttonType: .plain)
                }

            
              
               
            }
            
            
            VStack{
            Text("Already have an account?")
                    .font(.custom("Poppins", size: 12))
                
                Button {
                    showLogin.toggle()
                } label: {
                    Text("Login")
                            .font(.custom("BebasNeue-Regular", size: 14))
                            .foregroundColor(Color("Primary"))
                }.fullScreenCover(isPresented: $showLogin) {
                    LoginView()
                        .environmentObject(Authmanager)
                }

           
            }.padding(.vertical)
           
        
          
            
            Spacer()
        }.padding()
    }
}

struct Register_Previews: PreviewProvider {
    static var previews: some View {
        Register()
    }
}
