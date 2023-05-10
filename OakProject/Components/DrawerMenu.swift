//
//  DrawerMenuView.swift
//  OakProject
//
//  Created by Akın Aksoy on 10.05.2023.
//

import SwiftUI

struct DrawerMenuView: View {
    @Binding var isShowingMenu: Bool
    @Binding var items : [DrawerMenuModel]
    
    var body: some View {
            VStack(alignment: .leading) {
                List {
                    ForEach(items) { item in
                        VStack(alignment: .leading) {
                            Text(item.title)
                                .font(.headline)
                            Text(item.subTitle)
                                .font(.subheadline)
                        }.onTapGesture {
                            didClickMenuItem(menuItem: item)
                        }
                    }
                }
                .listStyle(InsetGroupedListStyle())
                .navigationTitle("Menu")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            isShowingMenu.toggle()
                        }) {
                            Image(systemName: "xmark")
                        }
                    }
                }
                
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
        }
    
    func didClickMenuItem(menuItem : DrawerMenuModel) {
        if menuItem.id == 0 {
            
        } else if menuItem.id == 1 {
            
        } else {
            
        }
        isShowingMenu.toggle()
    }
}

