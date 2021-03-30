//
//  ContentView.swift
//  UI-152
//
//  Created by にゃんにゃん丸 on 2021/03/30.
//

import SwiftUI
import PencilKit

struct ContentView: View {
    @State var canbas = PKCanvasView()
    @State var isDraw = true
    
    @State var color : Color = .black
    
    @State var type : PKInkingTool.InkType = .pencil
    
    @State var colorPicker = false
    
  
    
    @State var show = false
   
    var body: some View {
        NavigationView{
           DrawingView(canbas: $canbas, isDraw: $isDraw, type: $type, color: $color)
                .navigationTitle("Canbas")
                .toolbar(content: {
                    
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        
                        
                    
                            Button(action: {
                                
                                
                                isDraw = false
                                
                            }, label: {
                              Image(systemName: "pencil.slash")
                                    
                            })
                        
                        
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        
                        ColorPicker(selection: $color){
                        
                            Button(action: {
                                
                                colorPicker.toggle()
                                
                               
                                
                            }, label: {
                            Image(systemName: "eyedropper.full")
                        })
                        
                    }
                    }
                    
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        
                        
                        Button(action: {
                            
                            isDraw = true
                            type = .pen
                            
                        }, label: {
                            Image(systemName: "pencil.tip")
                        })
                        
                    }
                    
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        
                        
                        Button(action: {
                            isDraw = true
                            type = .marker
                            
                        }, label: {
                            Image(systemName: "highlighter")
                        })
                        
                    }
                    
                    
                    ToolbarItem(placement: .navigationBarLeading) {
                        
                        Button(action: SaveImage, label: {
                            Image(systemName: "iphone")
                        })
                        
                    }
                    
                    ToolbarItem(placement: .navigationBarLeading) {
                        
                      NavigationLink(
                        destination: CustomTab(),
                        label: {
                            Image(systemName: "ipad")
                        })
                           
                     
                        
                    }
                    
                    ToolbarItem(placement: .navigationBarLeading) {
                        
                      NavigationLink(
                        destination: VerticalScroll(),
                        label: {
                            Image(systemName: "books.vertical.fill")
                        })
                           
                     
                        
                    }
                    
                   
                    
                })
            
        }
        .sheet(isPresented: $colorPicker, content: {
           ColorPicker("Color", selection: $color)
            .padding()
        })
        
    }

    func SaveImage(){
        
        let image = canbas.drawing.image(from: canbas.drawing.bounds, scale: 1)
        
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct DrawingView : UIViewRepresentable {
    
    @Binding var canbas : PKCanvasView
    @Binding var isDraw : Bool
    @Binding var type : PKInkingTool.InkType
    @Binding var color : Color
    
    
    var ink : PKInkingTool{
        
        PKInkingTool(type,color: UIColor(color))
    }
    let eraser = PKEraserTool(.bitmap)
    func makeUIView(context: Context) -> PKCanvasView {
        canbas.drawingPolicy = .anyInput
        
        canbas.tool = isDraw ? ink : eraser
       // canbas.isRulerActive = true 定規
    
        return canbas
        
        
        
        
    }
    
    func updateUIView(_ uiView: PKCanvasView, context: Context) {
        
      uiView.tool = isDraw ? ink : eraser
        
    }
    
    
    
}




