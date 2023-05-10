//
//  ContentView.swift
//  OakProject
//
//  Created by Akın Aksoy on 10.05.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingMenu = false
    @State var items = [DrawerMenuModel]()
    @ObservedObject var viewModel = MainViewModel()
    var body: some View {
        NavigationView {
            
            
            ScrollView {
                ForEach(viewModel.appList,id: \.id) { item  in
                    ProductCell(product: item)
                }
            }
            .navigationTitle("Oak Project")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        isShowingMenu.toggle()
                    }) {
                        Image(systemName: "list.bullet").imageScale(.large)
                    }
                }
            }
            .listStyle(.plain)
            .fullScreenCover(isPresented: $isShowingMenu) {
                DrawerMenuView(isShowingMenu: $isShowingMenu,items: $items)
            }
            .onAppear {
                items = generateDrawerMenuList()
                viewModel.fetchApps(.flashLight)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
extension ContentView {
    func generateDrawerMenuList() -> [DrawerMenuModel] {
        var modelList = [DrawerMenuModel]()
        modelList.append(DrawerMenuModel(id: 0, title: "Flashlights", subTitle: "Check Flashlights app", icon: ""))
        modelList.append(DrawerMenuModel(id: 1, title: "Color Lights", subTitle: "Check Flashlights app", icon: ""))
        modelList.append(DrawerMenuModel(id: 2, title: "Sos Alerts", subTitle: "Check Flashlights app", icon: ""))
        return modelList
    }
}
