//
//  AcountInfo.swift
//  PassWordManager
//
//  Created by Mathis Higuinen on 12/09/2022.
//

import SwiftUI

struct AccountInfo: View {
    var acount:Account
    @State var lock = false
    var body: some View {
        let date = acount.date.formatted(date: .abbreviated, time: .omitted)
        VStack(alignment:.leading,spacing:20){
            VStack(alignment:.leading){
                Image("Calendar")
                Text(date)
            }
            VStack(alignment:.leading){
                Image("Link")
                Text("\(acount.link)")
            }
            VStack(alignment:.leading){
                Image("User")
                Text("\(acount.email)")
            }
            VStack(alignment:.leading){
                Image("Lock")
                HStack{
                    Text( lock ?  "\(acount.passWord)" : "*********")
                Spacer()
                    Image(lock ? "EyeClose" : "EyeOpen")
                        .renderingMode(.template)
                      
            
                        .foregroundColor(Color("Primary"))
                        .onTapGesture {
                            lock.toggle()
                        }
                    Image("Copy")
                        .renderingMode(.template)
                        
                        .foregroundColor(Color("Primary"))
                }
            }
        }.frame(maxWidth: .infinity,  alignment: .leading)
            .font(.custom("Poppins", size: 12))
            .foregroundColor(.gray)
    }
}
