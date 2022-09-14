//
//  keychain_access_group_team_idApp.swift
//  keychain-access-group-team-id
//
//  Created by Samiran Saha on 15/09/22.
//

import SwiftUI

@main
struct keychain_access_group_team_idApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    
    static func bundleSeedID() -> String? {
            let queryLoad: [String: AnyObject] = [
                kSecClass as String: kSecClassGenericPassword,
                kSecAttrAccount as String: "bundleSeedID" as AnyObject,
                kSecAttrService as String: "" as AnyObject,
                kSecReturnAttributes as String: kCFBooleanTrue
            ]

            var result : AnyObject?
            var status = withUnsafeMutablePointer(to: &result) {
                SecItemCopyMatching(queryLoad as CFDictionary, UnsafeMutablePointer($0))
            }

            if status == errSecItemNotFound {
                status = withUnsafeMutablePointer(to: &result) {
                    SecItemAdd(queryLoad as CFDictionary, UnsafeMutablePointer($0))
                }
            }

            if status == noErr {
                if let resultDict = result as? [String: Any], let accessGroup = resultDict[kSecAttrAccessGroup as String] as? String {
                    let components = accessGroup.components(separatedBy: ".")
                    print("Bundle Seed ID: " + components.first!)
                    return components.first
                }else {
                    return nil
                }
            } else {
                print("Error getting bundleSeedID to Keychain")
                return nil
            }
        }
}
