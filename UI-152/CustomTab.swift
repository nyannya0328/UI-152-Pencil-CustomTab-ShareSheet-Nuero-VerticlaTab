//
//  CustomTab.swift
//  UI-152
//
//  Created by にゃんにゃん丸 on 2021/03/30.
//

import SwiftUI

struct CustomTab : View {
    
    
    
    var body: some View{
        
        NavigationView{
            
            CustomTabs()
                .navigationTitle("Tabs")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct CustomTab_Previews: PreviewProvider {
    static var previews: some View {
        CustomTab()
    }
}

struct CustomTabs : View {
    @State var selected = 0
    
    @State var items : [Any] = []
    @State var show = false
    var body: some View{
        
       
            
            TabView(selection:$selected){
                
                Color.red
                    .tag(0)
                   
              
                    .tabItem {
                        
                        Image(systemName: "phone.down.fill")
                            .frame(width: 20, height: 20)
                        
                    }
                
                Color.green
                    .tag(1)
               
                    .tabItem {
                        
                        Image(systemName: "clock.fill")
                        
                    }
                
                Color.blue
                    .tag(2)
               
                    .tabItem {
                        
                        Image(systemName: "headphones")
                        
                    }
                
                Color.green
                    .tag(3)
                   
                    .tabItem {
                        
                        Image(systemName: "gear")
                        
                        
                    }
                
                
            }
            
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            .navigationBarItems(trailing: Menu(content: {
                
                Button(action: {
                    
                    selected = 0
                    
                    items.removeAll()
                    items.append(UIImage(named: "p1")!)
                    show.toggle()
                    
                }, label: {
                    HStack{
                        
                        Text("Sheet")
                        Image(systemName: "phone.down.fill")
                        
                    }
                })
                
                Button(action: {
                    
                    selected = 1
                }, label: {
                    HStack{
                        
                        Text("Alerm")
                        Image(systemName: "clock.fill")
                        
                    }
                })
                
                Button(action: {
                    
                    selected = 2
                    
                }, label: {
                    HStack{
                        
                        Text("Audio")
                        Image(systemName: "headphones")
                        
                    }
                })
                
                Button(action: {
                    
                    selected = 3
                    
                }, label: {
                    HStack{
                        
                        Text("Settings")
                        Image(systemName: "gear")
                        
                    }
                })
                
                
            }, label: {
                Image(systemName: "line.horizontal.3")
                    .font(.title)
                    .foregroundColor(.black)
                
            }))
            .sheet(isPresented: $show, content: {
                SharSheet(item: items)
            })
           
            
            
        
        
        
    }
    
}

struct SharSheet : UIViewControllerRepresentable {
    var item : [Any]
    func makeUIViewController(context: Context) -> UIActivityViewController {
        
        let view = UIActivityViewController(activityItems: item, applicationActivities: nil)
        
        return view
        
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
        
    }
}
