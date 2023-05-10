//
//  DrawerMenu.swift
//  OakProject
//
//  Created by Akın Aksoy on 10.05.2023.
//

import Foundation

struct DrawerMenuModel : Decodable,Identifiable {
    var id: Int
    let title : String
    let subTitle : String
    let icon : String
}
