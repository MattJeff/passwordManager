//
//  Login.swift
//  PassWordManager
//
//  Created by Mathis Higuinen on 11/09/2022.
//

import SwiftUI

struct LoginView: View {
 
    @State var email:String=""
    @State var password:String=""
    @State var showRegister = false
    @State var forgotPassword = false
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
            Text("Login").foregroundColor(Color("Title"))
                .font(.custom("BebasNeue-Regular", size: 64))
                .frame(maxWidth: .infinity, alignment: .leading)
                Text("Let’s get you setup with a new account!")
                    .font(.custom("Poppins", size: 12))
                    .foregroundColor(.gray)
            }
            }
            
            
            VStack(spacing:20){
      
            CustomTexField(text: $email, placeholder: "Email", textFiedlType: .standarField, title: "Email")
            CustomTexField(text: $password, placeholder: "Password", textFiedlType: .secureField, title: "Password")
                Button {
                    forgotPassword.toggle()
                } label: {
                    
                    Text("Fordot Password")
                        .font(.custom("Poppins", size: 12))
                        .foregroundColor(Color("Primary"))
                }.fullScreenCover(isPresented: $forgotPassword) {
                    ForgotPassWordView()
                }

                Button {
                    Authmanager.login(withEmail: email, password: password)
                } label: {
                    CustomButton(size: .large, text: "Login", buttonType: .plain)
                }

              
               
            }
            
            
            VStack{
            Text("Don't have an account?")
                    .font(.custom("Poppins", size: 12))
                Button {
                    showRegister.toggle()
                } label: {
                    Text("Register")
                            .font(.custom("BebasNeue-Regular", size: 14))
                            .foregroundColor(Color("Primary"))
                }.fullScreenCover(isPresented: $showRegister) {
                    Register()
                        .environmentObject(Authmanager)
                }

          
            }.padding(.vertical)
           
            Spacer()
        }.padding()
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
