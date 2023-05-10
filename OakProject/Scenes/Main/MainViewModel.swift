//
//  MainViewModel.swift
//  OakProject
//
//  Created by Akın Aksoy on 10.05.2023.
//

import Foundation

class MainViewModel : ObservableObject{
    @Published var appList = [AppModel]()
    @Published var isLoading = false
    var selectedType : NetworkConstants.Pages = .flashLight
    
    
    func fetchApps(_ appType : NetworkConstants.Pages?) {
        if let appType = appType {
            selectedType = appType
        }
        isLoading = true
        ApiService.ApiRequest(urlPage: selectedType, method: .GET) { apps,_ in
            guard let apps = apps else {return}
            self.appList = apps
            self.isLoading = false
        }
    }
}
