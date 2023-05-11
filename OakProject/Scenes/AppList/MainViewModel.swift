//
//  MainViewModel.swift
//  OakProject
//
//  Created by Akın Aksoy on 10.05.2023.
//

import Foundation

class MainViewModel : ObservableObject{
    @Published var appList = [AppModel]()
    @Published var backupFlashlightList = [AppModel]()
    @Published var backupColorLightList = [AppModel]()
    @Published var backupSosAlertList = [AppModel]()
    @Published var isLoading = false
    var selectedType : NetworkConstants.Pages = .flashLight
    
    
    func fetchApps(_ appType : NetworkConstants.Pages?,isRefresh : Bool) {
        if let appType = appType,!isRefresh {
            selectedType = appType
            if checkBackupList(selectedType) {
                return
            }
        }
        isLoading = true
        ApiService.ApiRequest(urlPage: selectedType, method: .GET) { apps,_ in
            guard let apps = apps else {return}
            self.appList = apps
            self.setBackupList(self.selectedType)
            self.isLoading = false
        }
    }
    
    private func checkBackupList(_ appType : NetworkConstants.Pages) -> Bool {
        switch appType {
        case .flashLight:
            if backupFlashlightList.count > 0 {
                appList = backupFlashlightList
                return true
            }
        case .colorLight:
            if backupColorLightList.count > 0 {
                appList = backupColorLightList
                return true
            }
        case .sosAlert:
            if backupSosAlertList.count > 0 {
                appList = backupSosAlertList
                return true
            }
        }
        return false
    }
    
    private func setBackupList(_ appType : NetworkConstants.Pages) {
        switch appType {
        case .flashLight:
            backupFlashlightList = appList
        case .colorLight:
            backupColorLightList = appList
        case .sosAlert:
            backupSosAlertList = appList
        }
    }
    
}
