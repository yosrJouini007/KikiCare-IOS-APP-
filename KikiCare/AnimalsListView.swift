//
//  AnimalsListView.swift
//  KikiCare
//
//  Created by Mezri Abdealziz on 6/3/20.
//  Copyright © 2020 YAApps. All rights reserved.
//

import SwiftUI

struct AnimalsListView: View {
    var body: some View {
        ListHome()
    }}

struct AnimalsListView_Previews: PreviewProvider {
    static var previews: some View {
        AnimalsListView()
    }
}

struct ListHome : View {
    
    // for sticky header view...
    @State var time = Timer.publish(every: 0.1, on: .current, in: .tracking).autoconnect()
    
    @State var show = false
    
    var body: some View{
        
        ZStack(alignment: .top, content: {
            
            ScrollView(.vertical, showsIndicators: false, content: {
                
                VStack{
                    
                    // Header
                    
                    GeometryReader{g in
                        
                        Image("AnimalsPoster")
                        .resizable()
                        .offset(y: g.frame(in: .global).minY > 0 ? -g.frame(in: .global).minY : 0)
                        .frame(height: g.frame(in: .global).minY > 0 ? UIScreen.main.bounds.height / 2.2 + g.frame(in: .global).minY  : UIScreen.main.bounds.height / 2.2)
                        .onReceive(self.time) { (_) in

                            
                            let y = g.frame(in: .global).minY
                            
                            if -y > (UIScreen.main.bounds.height / 2.2) - 50{
                                
                                withAnimation{
                                    
                                    self.show = true
                                }
                            }
                            else{
                                
                                withAnimation{
                                    
                                    self.show = false
                                }
                            }
                            
                        }
                        
                    }
                    .frame(height: UIScreen.main.bounds.height / 2.2)
                        
                    VStack{
                        
                        HStack{
                            
                            Text("My Pets")
                                .font(.title)
                                .fontWeight(.bold)
                            
                            Spacer()
                            
                          /*  Button(action: {
                                
                            }) {
                                
                                Text("See All")
                                    .fontWeight(.bold)
                            }*/
                        }
                        
                        VStack(spacing: 20){
                            
                            ForEach(data){i in
                                
                                CardView(data: i)
                            }
                        }
                        .padding(.top)
                    }
                    .padding()
                    
                    Spacer()
                }
            })
            
            if self.show{
                
                TopView()
            }
        })
        .edgesIgnoringSafeArea(.top)
    }
}
// CardView...

struct CardView : View {
    
    var data : Card
    
    var body: some View{
        
        HStack(alignment: .top, spacing: 20){
            
            Image(self.data.image)
            
            VStack(alignment: .leading, spacing: 6) {
                
                Text(self.data.title)
                    .fontWeight(.bold)
                
                Text(self.data.subTitile)
                    .font(.caption)
                    .foregroundColor(.gray)
                
     
                
            }
            
            Spacer(minLength: 0)
        }
    }
}

// TopView...

struct TopView : View {
    
    var body: some View{
        
        HStack{
            
            VStack(alignment: .leading, spacing: 12) {
                
                HStack(alignment: .top){
                    
                    Image("icon")
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 25, height: 30)
                        // for dark mode adaption...
                        .foregroundColor(.primary)
                    
                    Text("KikiCare")
                        .font(.title)
                        .fontWeight(.bold)
                }
                
                Text("Takes care of your Pets")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            Spacer(minLength: 0)
            
        }
        .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top == 0 ? 15 : (UIApplication.shared.windows.first?.safeAreaInsets.top)! + 5)
        .padding(.horizontal)
        .padding(.bottom)
        .background(BlurBG())
    }
}


// Blur background...

struct BlurBG : UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIVisualEffectView{
        
        // for dark mode adoption...
        
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemMaterial))
        
        return view
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        
        
    }
}

// Static data for cards....
//here get data from database

struct Card : Identifiable {
    
    var id : Int
    var image : String
    var title : String
    var subTitile : String
}

var data = [

    Card(id: 0, image: "kiki", title: "kiki", subTitile: "Cat"),
    Card(id: 1, image: "dog", title: "Bolt", subTitile: "Dog"),
    Card(id: 2, image: "kiki", title: "Fitfata", subTitile: "Cat"),
    Card(id: 3, image: "cat3", title: "Sony", subTitile: "Dog"),
    Card(id: 4, image: "kiki", title: "Kiki", subTitile: "Cat"),
]


