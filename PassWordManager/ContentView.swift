//
//  ContentView.swift
//  PassWordManager
//
//  Created by Mathis Higuinen on 09/09/2022.
//

import SwiftUI



struct ContentView: View {
    
    @State var selected = "Home"
    @StateObject var countManager = AccountManager()
    var body: some View {
        
        ZStack{
            
            VStack{
                TabView(selection: $selected) {
                    Home()
                        .environmentObject(countManager)
                        .tag("Home")
                    Profile()
                        .tag("User")
                }
            }
            
            VStack{
                Spacer()
            CustomTabBar(selectedtab: $selected)
                    .environmentObject(countManager)
            }
        }
        
    }
}

struct CustomTabBar:View{
    @Binding var selectedtab:String
    @Namespace var animation
    @State var showAdd = false
    @EnvironmentObject var manager: AccountManager
    var body:some View{
        ZStack{
        HStack(spacing:UIScreen.main.bounds.width/2){
            TabBarButton(animation: animation, image: "Home", selectedTab: $selectedtab)
          
            TabBarButton(animation: animation, image: "User", selectedTab: $selectedtab)
        }.frame(maxWidth: .infinity, maxHeight:64)
            .background(Color("Secondary"))
            .cornerRadius(10)
            Button {
                showAdd.toggle()
            } label: {
                ZStack{
                    Circle()
                        .foregroundColor(Color("Primary"))
                        .frame(width: 60, height: 60)
                        .shadow(color: Color("Primary"), radius: 10, x: 0, y: 5)
                      
                    
                    Image("Add")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(.white)
                        .frame(width: 24, height: 24)
                        .aspectRatio(contentMode: .fill)
                    
                }  .offset( y: -20)
            }.fullScreenCover(isPresented: $showAdd){
                AddNew()
                    .environmentObject(manager)
            }
            
        }.padding()
     
       
    }
}


struct TabBarButton:View{
    var animation:Namespace.ID
    var image:String
    @Binding var selectedTab:String
    var body:some View{
        Button(action: {
            withAnimation(.spring()){
                selectedTab = image
            }
        }) {
            VStack{
            Image(image)
                
                if selectedTab == image {
                    RoundedRectangle(cornerRadius: 1)
                        .fill(Color("Title"))
                        .matchedGeometryEffect(id: "TAB", in: animation)
                        .frame(width: 6, height:2)
                }
            }
            
        }
    }
}



extension View {
    func getSafeAera()->UIEdgeInsets{
        return UIApplication.shared.windows.first?.safeAreaInsets ?? UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



/*
 //styleName: Big Title;
 font-family: Bebas Neue;
 font-size: 64px;
 font-weight: 400;
 line-height: 77px;
 letter-spacing: 0em;
 text-align: left;
 */

