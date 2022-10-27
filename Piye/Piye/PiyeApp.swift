//
//  PiyeApp.swift
//  Piye
//
//  Created by Pauline Broängen on 2022-10-24.
//


//här inne lägger vi till firebaseinfon och importerar FirebaseCore. detta körs innan appen överhuvudtaget startar.
import SwiftUI
import FirebaseCore

//nedanför lägger vi till infon från firebaseinfon
class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}





@main
struct PiyeApp: App {
    //nedanför har jag lagt till UIApplicationDelegate-raden från googlesidan.
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
