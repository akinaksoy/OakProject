//
//  AppListView.swift
//  OakProject
//
//  Created by Akın Aksoy on 11.05.2023.
//

import SwiftUI

struct AppListView: View {
    @State private var isShowingMenu = false
    @State var title : String
    var pageType : NetworkConstants.Pages
    @State var items = [DrawerMenuModel]()
    @ObservedObject var viewModel = MainViewModel()
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    ForEach(viewModel.appList,id: \.id) { item  in
                        ProductCell(product: item)
                    }
                }
                .navigationTitle(title)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            isShowingMenu.toggle()
                        }) {
                            Image(systemName: "list.bullet").imageScale(.large)
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            viewModel.appList = []
                            viewModel.fetchApps(nil,isRefresh: true)
                        }) {
                            Image(systemName: "arrow.clockwise").imageScale(.large)
                        }
                    }
                }
                .listStyle(.plain)
                .fullScreenCover(isPresented: $isShowingMenu) {
                    DrawerMenuView(isShowingMenu: $isShowingMenu,items: $items,title: $title,viewModel: viewModel)
                }
                .onAppear {
                    items = generateDrawerMenuList()
                    viewModel.fetchApps(pageType,isRefresh: false)
                }
                if viewModel.isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .scaleEffect(2, anchor: .center)
                        .zIndex(1)
                }
            }
            
        }
    }
}

struct AppListView_Previews: PreviewProvider {
    static var previews: some View {
        AppListView(title: "Apps",pageType: .flashLight)
    }
}
extension AppListView {
    func generateDrawerMenuList() -> [DrawerMenuModel] {
        var modelList = [DrawerMenuModel]()
        modelList.append(DrawerMenuModel(id: 0, title: "Flashlights", subTitle: "Check Flashlights app", icon: ""))
        modelList.append(DrawerMenuModel(id: 1, title: "Color Lights", subTitle: "Check Flashlights app", icon: ""))
        modelList.append(DrawerMenuModel(id: 2, title: "Sos Alerts", subTitle: "Check Flashlights app", icon: ""))
        return modelList
    }
}
