//
//  MainTabView.swift
//  Sam's Twitter
//
//  Created by Sam Grover on 19/07/22.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedIndex: Int = 0
    var body: some View {
        TabView(selection: $selectedIndex) {
            
            //MARK: Main Home screen
            FeedView().onTapGesture {
                self.selectedIndex = 0
            }.tabItem {
                Image(systemName: "house")
            }.tag(0)
            
            ExploreTabView().onTapGesture {
                self.selectedIndex = 0
            }.tabItem {
                Image(systemName: "magnifyingglass")
            }.tag(1)
            
            NotificationTabView().onTapGesture {
                self.selectedIndex = 0
            }.tabItem {
                Image(systemName: "bell")
            }.tag(2)
            
            MessageTabView().onTapGesture {
                self.selectedIndex = 0
            }.tabItem {
                Image(systemName: "envelope")
            }.tag(3)
            
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
