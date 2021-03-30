//
//  NeuroView.swift
//  UI-152
//
//  Created by にゃんにゃん丸 on 2021/03/30.
//

import SwiftUI

struct NeuroView: View {
    @State var text = ""
    @State var pas = ""
    
    @Environment(\.presentationMode) var present
    var body: some View {
        ZStack{
            
            Color("c1")
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing:15){
                
                
                VStack(spacing:18){
                    
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Neuro Pic")
                            .foregroundColor(Color.black.opacity(0.7))
                            .padding(.vertical)
                            .frame(width: getrect().width - 150)
                    })
                    .buttonStyle(ButtonModifier())
                    
                
                    
                    
                    Image("p10")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 200, height: 200)
                        .clipShape(Circle())
                        .modifier(TopModifier())
                    
                    
                    HStack{
                        
                        Image(systemName: "envelope.fill")
                        TextField("Enter", text: $text)
                        
                        
                    }
                    .modifier(TFModifier())
                    
                    
                    HStack{
                        
                        Image(systemName: "lock.fill")
                      SecureField("Password", text: $pas)
                        
                        Button(action: {
                            
                            present.wrappedValue.dismiss()
                        }, label: {
                            Image(systemName: "eye.fill")
                                .font(.title2)
                                .foregroundColor(Color.blue)
                                
                            
                        })
                        
                        
                    }
                    .modifier(TFModifier())
                    
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("login")
                            .foregroundColor(Color.black.opacity(0.7))
                            .padding(.vertical)
                            .frame(width: getrect().width - 150)
                    })
                    .buttonStyle(ButtonModifier())
                    
                    Text("or")
                        .font(.title2)
                     .foregroundColor(.primary)
                    
                    HStack{
                        
                        
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Image("p9")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 100, height:100)
                                .clipShape(Circle())
                        })
                        .buttonStyle(OtherModifier())
                        
                          Text(
                          
                          ("Neuro")
                            
                            +
                            ("Pick")
                          
                          
                          )
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.blue)
                          .kerning(2)
                          .padding(.leading,25)
                          
                           
                            
                        
                        Spacer(minLength: 0)
                        
                        
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Image("p8")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 100, height:100)
                                .clipShape(Circle())
                        })
                        .buttonStyle(OtherModifier())
                        
                        
                        
                    }
                    
                    
                    
                }
               
                
            }
            .padding(.horizontal)
        }
        .navigationBarHidden(true)
    }
}

struct NeuroView_Previews: PreviewProvider {
    static var previews: some View {
        NeuroView()
    }
}

struct TopModifier : ViewModifier {
    func body(content: Content) -> some View {
        return content
            .background(Color("c1"))
            .padding(20)
            .cornerRadius(13)
            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 10, y: 10)
            .shadow(color: Color.white.opacity(0.2), radius: 5, x: -10, y: -10)
    }
}

struct TFModifier : ViewModifier {
    func body(content: Content) -> some View {
        return content
            .padding(20)
            .background(Color("c1"))
            .cornerRadius(10)
            .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.black.opacity(0.1),lineWidth: 4)
                .shadow(color: Color.black.opacity(0.2), radius: 3, x: 5, y: 5)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .shadow(color: Color.black.opacity(0.2), radius: 3, x: -5, y: -5)
                .clipShape(RoundedRectangle(cornerRadius: 15))
            
            
            )
    }
}

struct ButtonModifier : ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label.background(Color("c1")).cornerRadius(15)
            .overlay(
            
                VStack{
                    
                    
                    if configuration.isPressed{
                        
                        
                        
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.black.opacity(0.05),lineWidth: 3)
                            .shadow(color: Color.black.opacity(0.2), radius: 3, x: 5, y: 5)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .shadow(color: Color.black.opacity(0.2), radius: 3, x: -5, y: -5)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                    }
                }
            
            
            )
            .shadow(color: Color.black.opacity(configuration.isPressed ? 0 : 0.2), radius: 5, x: 5, y: 5)
        
            .shadow(color: Color.white.opacity(configuration.isPressed ? 0 : 0.6), radius: 5, x: -5, y: -5)
    }
}

struct OtherModifier : ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label.background(Color("c1")).clipShape(Circle())
            .overlay(
            
                VStack{
                    
                    
                    if configuration.isPressed{
                        
                        
                        Circle()
                            .stroke(Color.black.opacity(0.05),lineWidth: 3)
                            .shadow(color: Color.black.opacity(0.2), radius: 3, x: 5, y: 5)
                            .clipShape(Circle())
                            .shadow(color: Color.black.opacity(0.2), radius: 3, x: -5, y: -5)
                            .clipShape(Circle())
                    }
                }
            
            
            )
            .shadow(color: Color.black.opacity(configuration.isPressed ? 0 : 0.2), radius: 5, x: 5, y: 5)
        
            .shadow(color: Color.white.opacity(configuration.isPressed ? 0 : 0.6), radius: 5, x: -5, y: -5)
    }
}
