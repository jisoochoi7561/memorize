//
//  Grid.swift
//  memorize
//
//  Created by choijisoo on 2021/04/12.
//

import SwiftUI

struct Grid<Item,ItemView>: View where Item:Identifiable,ItemView:View  {
    var items:[Item]
    var viewForItem: (Item) -> ItemView
    init(_ items:[Item],viewForItem:@escaping (Item) -> ItemView) {
        self.items = items
        self.viewForItem = viewForItem
    }
    var body: some View {
        GeometryReader{ geometry in
            body(layout: GridLayout(itemCount: items.count, in: geometry.size))
        }
    }
    
    func body(layout:GridLayout)->some View{
        return ForEach(items){item in
            viewForItem(item)
                .frame(width:layout.itemSize.width, height: layout.itemSize.height)
                .position(layout.location(ofItemAt: items.firstIndex(of: item)!))
                
        }
        
    }
    
    
}

