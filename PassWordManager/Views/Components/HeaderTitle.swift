//
//  HeaderTitle.swift
//  PassWordManager
//
//  Created by Mathis Higuinen on 10/09/2022.
//

import SwiftUI


struct HeaderTitle: View {
    var text:String
    var body: some View {
        HStack{
            Text("Change  \n password ")
                .font(.custom("BebasNeue-Regular", size: 64))
            Spacer()
        }
        .padding(.leading)
    }
}
