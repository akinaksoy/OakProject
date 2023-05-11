//
//  ContentView.swift
//  OakProject
//
//  Created by Akın Aksoy on 10.05.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                NavigationLink(
                    destination: AppListView(title:"Flashlights",pageType: .flashLight),
                    label: {
                        Text("Flashlights")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, minHeight: 50)
                            .background(Color.blue)
                            .cornerRadius(8)
                    })
                
                NavigationLink(
                    destination: AppListView(title:"Colorlights",pageType: .colorLight),
                    label: {
                        Text("Color lights")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, minHeight: 50)
                            .background(Color.green)
                            .cornerRadius(8)
                    })
                
                NavigationLink(
                    destination: AppListView(title:"SOS Alerts",pageType: .sosAlert),
                    label: {
                        Text("SOS Alerts")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, minHeight: 50)
                            .background(Color.orange)
                            .cornerRadius(8)
                    })
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .center)
            .background(Color.white)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

