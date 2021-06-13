//
//  ContentView.swift
//  retro
//
//  Created by An Trinh on 13/06/2021.
//

import SwiftUI

struct ContentView: View {
    let menuTitles = ["", "File", "Edit", "Goodies", "Font", "FontSize", "Style"]
    
    var body: some View {
        HStack {
            ForEach(menuTitles, id: \.self) { menuTitle in
                Text(menuTitle)
            }
            .font(Font.body.bold())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
