//
//  HelpScoutImplementation.swift
//  help_scout
//
//  Created by Baba Yaga on 12/20/20.
//

import Foundation
import Beacon;

 public class HelpScoutImplementation {

    func setupBeacon(arguments: [String:Any?]) -> Void {
        identifyUser(email: arguments["email"] as! String, name: arguments["name"] as! String, attributes: arguments["attributes"] as? [String:String]);
    }
    
    func openBeacon(arguments: [String:Any?])  -> Void {
        let signature = arguments["signature"] as? String

        if (signature != nil) {
            HSBeacon.open(HSBeaconSettings(beaconId: arguments["beacon"] as! String), signature: signature!);
        } else {
            HSBeacon.open(HSBeaconSettings(beaconId: arguments["beacon"] as! String));
        }
    }

    func logoutBeacon()  -> Void {
        HSBeacon.logout()
    }

    func identifyUser(email:String, name:String, attributes: [String:String]?) -> Void {
        let user=HSBeaconUser();
        user.email = email;
        user.name = name;

        if (attributes != nil) {
            for (key, value) in attributes! {
                user.addAttribute(withKey: key, value: value)
            }
        }

        HSBeacon.identify(user);
    }
}
