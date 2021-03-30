//
//  VerticalScroll.swift
//  UI-152
//
//  Created by にゃんにゃん丸 on 2021/03/30.
//

import SwiftUI

struct VerticalScroll: View {
    init() {

        UIScrollView.appearance().bounces = false
    }
    @State var currentpage = 1

    var body: some View {
        
        
        ScrollView(.init()){
            TabView{
                
                GeometryReader{proxy in
                    
                    
                    let screen = proxy.frame(in:.global)
                    let offset = screen.minX
                    let scale = 1 + (offset / screen.width)
                    
                    
                    TabView(selection:$currentpage){
                        
                        
                        
                        
                        ForEach(1...6,id:\.self){index in
                            
                            Image("p\(index)")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: getrect().width)
                                .cornerRadius(1)
                                .modifier(VerticalModefiy(screen: screen))
                                .tag(index)
                               
                             
                            
                        }
                        
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                    .rotationEffect(.init(degrees: 90))
                    .frame(width: screen.width)
                    .scaleEffect(scale >= 0.88 ? scale : 0.88 ,anchor:.center)
                    .offset(x: -offset)
                    .blur(radius: (1 - scale) * 20)
                }
                DetatilView(currentpage: $currentpage)
                
                
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
        .background(Color.primary.ignoresSafeArea())
        .ignoresSafeArea()
        .navigationBarHidden(true)
    }
}

struct VerticalScroll_Previews: PreviewProvider {
    static var previews: some View {
        VerticalScroll()
    }
}

struct DetatilView : View {
    @Binding var currentpage : Int
    @Environment(\.presentationMode) var present
    var body: some View{
        
        VStack(spacing:15){
            
            
            Text("Detatil")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.top,edges?.top ?? 10)
            
            Image("p\(currentpage)")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 250, height: 250)
                .cornerRadius(10)
                .padding(.vertical)
            
            
            VStack(alignment:.leading,spacing:10){
                
                Text("Dark Soul")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text("By Girl")
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
                
                
                
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            .padding(.horizontal,30)
            
            
                NavigationLink(
                    destination: NeuroView(),
                    label: {
                        
                        Text("Nuero Login")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding(.vertical,10)
                            .frame(maxWidth: .infinity)
                            .background(
                            
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.red.opacity(0.3),lineWidth: 5)
                            )
                            .padding(.vertical)
                            
                    })
             
          
           
            
            
            Button(action: {
                
                withAnimation{
                    
                    present.wrappedValue.dismiss()
                }
                
            }, label: {
                Text("Back To Pencil")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.vertical,10)
                    .frame(maxWidth: .infinity)
                    .background(
                    
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.red.opacity(0.3),lineWidth: 5)
                    )
            })
                
            
                
            
            Spacer()
            
            
            
        }
        
        .padding()
        .background(Color.red.opacity(0.2).ignoresSafeArea())
        .navigationBarHidden(true)
        
        
        
    }
}


struct VerticalModefiy : ViewModifier {
    
    var screen : CGRect
    func body(content: Content) -> some View {
        return content
            .frame(width: screen.width, height: screen.height)
            .rotationEffect(.init(degrees: -90))
            .frame(width: screen.height, height: screen.width)
            
         
        
    }
}
extension View{
    
    func getrect()->CGRect{
        
        return UIScreen.main.bounds
    }
    
    
}

var edges = UIApplication.shared.windows.first?.safeAreaInsets




