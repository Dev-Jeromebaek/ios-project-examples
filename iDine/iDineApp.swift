//
//  iDineApp.swift
//  iDine
//
//  Created by 백승엽 on 2020/11/16.
//

import SwiftUI

@main
struct iDineApp: App {
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppView().environmentObject(order)
        }
    }
}
