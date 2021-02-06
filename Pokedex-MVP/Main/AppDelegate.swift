//
//  AppDelegate.swift
//  Pokedex-MVP
//
//  Created by Adriano Souza Costa on 21/01/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Public Properties
    
    var window: UIWindow?
    
    // MARK: - Private Properties
    
    private var applicationCoordinator: ApplicationCoordinator!
    
    // MARK: - Public Methods

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        setupApplicationCoordinator()
        return true
    }
    
    // MARK: - Private Methods
    
    private func setupApplicationCoordinator() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        self.applicationCoordinator = ApplicationCoordinator(mainWindow: window)
        applicationCoordinator.start()
        window.makeKeyAndVisible()
    }

}

