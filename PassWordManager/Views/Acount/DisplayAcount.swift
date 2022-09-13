//
//  DisplayAcount.swift
//  PassWordManager
//
//  Created by Mathis Higuinen on 12/09/2022.
//

import SwiftUI

struct DisplayAcount: View {
    var body: some View {
        VStack{
            HStack{
            Image("Left")
                Spacer()
            }
            Text("Facebook")
                .modifier(Title())
            AccountInfo(acount: Account(date: Date(), name: "Facebook", link: "www.facebook.com", email: "mhiguinen235@gmail.com", passWord: "MoiMathis235"))
            Spacer()
            HStack(spacing:space2button){
                CustomButton(size: .small, text: "delete", buttonType: .strock)
                CustomButton(size: .small, text: "Upadate", buttonType: .plain)
            }
        }.padding()
    }
}


struct DisplayAcount_Previews: PreviewProvider {
    static var previews: some View {
        DisplayAcount()
    }
}
