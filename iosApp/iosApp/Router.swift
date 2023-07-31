//
//  Router.swift
//  iosApp
//
//  Created by Sarah Brenner on 7/28/23.
//  Copyright © 2023 orgName. All rights reserved.
//

import SwiftUI

class Router: ObservableObject {
    @Published var path = NavigationPath()
    
    func reset() {
        path = NavigationPath()
    }
}
