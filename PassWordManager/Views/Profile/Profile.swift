//
//  Profile.swift
//  PassWordManager
//
//  Created by Mathis Higuinen on 11/09/2022.
//

import SwiftUI



struct Profile: View {
    
    @State var showUpdateProfile = false
    @State var showChangePassWord = false
    
    var body: some View {
        VStack(spacing:20){
           
            Text("Profile")
                .modifier(Title())
            VStack{
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("Primary"),lineWidth: 2)
                    .background(
                    
                        Image("avatar")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .cornerRadius(10)
                        
                            
                    )
                    .frame(width: screen.width/4.65, height: screen.width/4.65)
                
                Text("Mathis Higuinen")
                    .foregroundColor(Color("Title"))
                    .font(.custom("BebasNeue-Regular", size: 16))
                Text("mathis.higuienagmail.com")
                    .foregroundColor(.gray)
                    .font(.custom("Poppins", size: 12))
            }
            VStack{
                Button {
                    showUpdateProfile.toggle()
                } label: {
                    sectionPorfile(image: "User", text: "Update")
                }.fullScreenCover(isPresented: $showUpdateProfile) {
                    EditProfile()
                }
                
                Button {
                    showChangePassWord.toggle()
                } label: {
                    sectionPorfile(image: "Lock", text: "Change Master Password")
                }.fullScreenCover(isPresented: $showChangePassWord) {
                    Profile_changePassword()
                }
                Button {
           
                } label: {
                    sectionPorfile(image: "Edit", text: "Autofil Setttings")
                }
                Button {
                    
                } label: {
                    sectionPorfile(image: "Moon", text: "Switch to Dark Mode")
                }

               
            }
            
            sectionPorfile(image: "Logout", text: "Logout")
         
            
            Spacer()
        }.padding()
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
