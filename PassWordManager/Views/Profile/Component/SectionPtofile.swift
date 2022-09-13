//
//  SectionPtofile.swift
//  PassWordManager
//
//  Created by Mathis Higuinen on 11/09/2022.
//

import SwiftUI

struct sectionPorfile:View{
    var image:String
    var text:String
    
    var body: some View{
       
        HStack{
            
            Image("\(image)")
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 18, height: 12)
                .foregroundColor(Color("Primary"))
            Text(text)
                .foregroundColor(Color("Title"))
                .font(.custom("Poppins", size: 12))
        }.frame(maxWidth: .infinity,alignment: .leading)
            .padding(.vertical)
        
    }
}
