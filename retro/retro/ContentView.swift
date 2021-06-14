//
//  ContentView.swift
//  retro
//
//  Created by An Trinh on 13/06/2021.
//

import SwiftUI

struct ContentView: View {
    private let menuTitles = ["File", "Edit", "Goodies", "Font", "FontSize", "Style"]
    private let toolNames = ["lasso", "rectangle.dashed",
                             "hand.raised", "character",
                             "paintbrush.fill", "aqi.low",
                             "paintbrush.pointed", "pencil",
                             "line.diagonal", "scribble.variable",
                             "rectangle", "rectangle.fill",
                             "oval", "oval.fill"]
    private let selectedToolName = "pencil"
    private let layout = [GridItem(.fixed(44), spacing: 0), GridItem(.fixed(44), spacing: 0)]
    
    var body: some View {
        ZStack {
            // background
            Color.black
            
            // menu & texture bg
            VStack(spacing: 0) {
                HStack(spacing: 20) {
                    Text("")
                        .font(.system(size: 26))
                    ForEach(menuTitles, id: \.self) { menuTitle in
                        Text(menuTitle)
                    }
                    .font(.custom("FA Sysfont C", size: 26))
                    Spacer()
                }
                .padding(EdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 0))
                Rectangle()
                    .frame(height: 1.5)
                Image("grid")
                    .resizable(resizingMode: .tile)
            }
            .foregroundColor(.black)
            .background(Color.white)
            
            // tools
            HStack {
                VStack {
                    ZStack(alignment: .topLeading) {
                        Rectangle()
                            .foregroundColor(.black)
                            .frame(width: 90, height: 254)
                        Rectangle()
                            .overlay(LazyVGrid(columns: layout, spacing: 0) {
                                ForEach(toolNames, id: \.self) { toolName in
                                    Rectangle()
                                        .foregroundColor(toolIsSelected(toolName) ? .black : .white)
                                        .overlay(Image(systemName: toolName)
                                                    .imageScale(.large)
                                                    .foregroundColor(toolIsSelected(toolName) ? .white : .black))
                                        .frame(width: 44, height: 36)
                                        .border(.black, width: 1)
                                }
                            })
                            .frame(width: 88, height: 252, alignment: .topLeading)
                        
                    }
                    Spacer()
                }
                .padding(EdgeInsets(top: 50, leading: 25, bottom: 15, trailing: 0))
                Spacer()
            }
            
            // hello
            HStack {
                VStack {
                    ZStack(alignment: .topLeading) {
                        Rectangle()
                            .foregroundColor(.black)
                            .frame(width: 662, height: 302, alignment: .topLeading)
                        Rectangle()
                            .foregroundColor(.white)
                            .overlay(VStack(spacing: 0) {
                                ZStack {
                                    VStack(spacing: 1.5) {
                                        ForEach(0..<6) { _ in
                                            Rectangle()
                                                .foregroundColor(.black)
                                                .frame(height: 1.5)
                                        }
                                    }
                                    .padding(3)
                                    HStack {
                                        Rectangle()
                                            .foregroundColor(.black)
                                            .frame(width: 20, height: 20)
                                            .border(.white, width: 1.5)
                                            .overlay(Rectangle()
                                                        .foregroundColor(.white)
                                                        .frame(width: 14, height: 14))
                                        Spacer()
                                        Text("Macintosh")
                                            .foregroundColor(.black)
                                            .font(.custom("FA Sysfont C", size: 26))
                                            .background(Color.white
                                                            .padding(.horizontal, -10))
                                        Spacer()
                                    }
                                    .padding(.horizontal, 13)
                                }
                                .frame(height: 30)
                                Rectangle()
                                    .foregroundColor(.black)
                                    .frame(height: 1.5)
                                Spacer()
                                Image("hello")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 400, height: 200)
                                    .overlay(Image(systemName: "cursorarrow")
                                                .foregroundColor(.black)
                                                .offset(x: 0, y: -30), alignment: .bottomTrailing)
                                Spacer()
                            })
                            .border(.black, width: 1)
                            .frame(width: 660, height: 300, alignment: .topLeading)
                    }
                    Spacer()
                }
                .padding(EdgeInsets(top: 50, leading: 135, bottom: 15, trailing: 0))
                Spacer()
            }
            
            // retro tint
            Color.green.opacity(0.1)
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
    
    func toolIsSelected(_ toolName: String) -> Bool {
        toolName == selectedToolName
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
