//
//  Home.swift
//  PassWordManager
//
//  Created by Mathis Higuinen on 12/09/2022.
//

import SwiftUI

struct Home: View {
    @State var text:String = ""
    @EnvironmentObject var accountManager:AccountManager
    var body: some View {
        ScrollView(showsIndicators:false){
            VStack{
                HStack{
                    Image("logo")
                        .renderingMode(.template)
                        .foregroundColor(Color("Primary"))
                       
                      
                      
                    Spacer()
                }
                HStack{
                    Card(number: 5, text: "Passwords\nStored")
                    Card(number: 0, text: "Passwords\nCompromised")
                }.padding(.top)
                CustomTexField(text: $text, placeholder: "Search Websites...", textFiedlType:.searchField )
                    .padding(.top)
                VStack{
                AccountRow()
                AccountRow()
                AccountRow()
                AccountRow()
                AccountRow()
                }.padding(.top)
                Spacer()
            }.padding()
        }
    }
}

struct Card:View{
    var number:Int
    var text:String
    var body:some View{
        VStack{
            VStack(alignment:.leading){
                Text("\(number)")
                    .foregroundColor(Color("Primary"))
                    .modifier(Title())
                Text("\(text)")
                    .font(.custom("Poppins",size:14))
                    
            }.padding()
        }
        .frame(width: screen.width/2.38, height: screen.width/2.38)
            .background(Color("Secondary"))
        .cornerRadius(10)
           
        
    }
}

struct AccountRow:View{
    var body:some View{
        VStack{
            HStack{
                Image("Apple")
                    .renderingMode(.template)
                    .foregroundColor(.white)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color("Title"))
                    )
                   
                Text("Apple")
                    .font(.custom("Poppins",size:20))
                
                Spacer()
                Image("Copy")
                    .renderingMode(.template)
                    .foregroundColor(Color("Primary"))
            }.padding(8)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("Secondary"),lineWidth: 2)
                )
            
        }
    }
}



struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
