//
//  AspectVGrid.swift
//  Memorize
//
//  Created by Brio Taliaferro on 26.10.22.
//

import SwiftUI

struct AspectVGrid<Item: Identifiable, ItemView: View>: View {
    var items: [Item]
    var aspectRatio: CGFloat
    var content: (Item) -> ItemView
    var body: some View {
        let width: CGFloat = 100
        LazyVGrid(columns: [GridItem(.adaptive(minimum: width))]) {
            ForEach(items) { item in
                content(item).aspectRatio(aspectRatio, contentMode: .fit)
            }
        }
    }
}

/*
struct AspectVGrid_Previews: PreviewProvider {
    static var previews: some View {
        AspectVGrid()
    }
}
 */
