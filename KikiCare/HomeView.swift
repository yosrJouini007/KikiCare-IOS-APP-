//
//  HomeView.swift
//  KikiCare
//
//  Created by Mezri Abdealziz on 6/3/20.
//  Copyright © 2020 YAApps. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @State var index = 0
    var body: some View {
        VStack{
           ZStack{
             if self.index == 0{
                AnimalsListView()
             }
            else if self.index == 1{
                 
             }
             else if self.index == 2{
                 
             }
             else{
                 
             }
             }
           .padding(.bottom, 320)
            CustomTabs(index: self.$index)
    }
        .background(Color.black.opacity(0.05).edgesIgnoringSafeArea(.top))
            .navigationBarBackButtonHidden(true)

        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
    
}

struct CustomTabs : View {
    @Binding var index : Int
    var body : some View {
        HStack {
            Button(action:{
                self.index = 0
                
            } )
            {
                Image("list2")
            }
            .foregroundColor(Color.black.opacity(self.index == 0 ? 1 : 0.3))
            Spacer(minLength: 0)
            Button(action:{
                self.index = 1
                          
                      } )
                      {
                          Image("home")
                      }
            .foregroundColor(Color.black.opacity(self.index == 1 ? 1 : 0.3))
            .offset(x: -10)
            
             Spacer(minLength: 0)
            
                    Button(action:{
                                  
                              } )
                              {
                                Image("add2").renderingMode(.original)
                              }
                    .offset(y: -25)
              Spacer(minLength: 0)
            
            Button(action:{
                self.index = 2
                          
                      } )
                      {
                          Image("search")
                      }
            .foregroundColor(Color.black.opacity(self.index == 2 ? 1 : 0.3))
            .offset(x: -10)
             Spacer(minLength: 0)
            Button(action:{
                          self.index = 3
                      } )
                      {
                          Image("person")
                      }
            .foregroundColor(Color.black.opacity(self.index == 3 ? 1 : 0.3))
           
        }
        .padding(.horizontal, 35)
        .padding(.top,220)
        .background(Color.white)
        .clipShape(Cshape())
    }
}

struct Cshape : Shape {
    func path(in rect: CGRect) -> Path {
        return Path{ path in
            path.move(to: CGPoint(x: 0,y: 220))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
             path.addLine(to: CGPoint(x: rect.width, y: 220))
            
            path.addArc(center: CGPoint(x: rect.width / 2, y: 220), radius: 35, startAngle: .zero, endAngle: .init(degrees: 180),clockwise:  true)
        }
    }
}
