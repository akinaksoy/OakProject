//
//  MainViewModel.swift
//  OakProject
//
//  Created by Akın Aksoy on 10.05.2023.
//

import Foundation

class MainViewModel : ObservableObject{
    @Published var appList = [AppModel]()
    
    func fetchApps(_ appType : NetworkConstants.Pages) {
        ApiService.ApiRequest(urlPage: appType, method: .GET) { apps,_ in
            guard let apps = apps else {return}
            self.appList = apps
        }
    }
}
