package com.help_scout

import android.content.Context
import com.helpscout.beacon.Beacon
import com.helpscout.beacon.ui.BeaconActivity

class HelpScoutImplementation {

    fun setupBeacon(arguments: Map<*, *>) {
        val beaconId: String = arguments["beacon"] as String;
        try {
            Beacon.Builder()
                    .withBeaconId(beaconId)
                    .build();
            identifyUser(email = arguments["email"] as String, name = arguments["name"] as String, attributes = arguments["attributes"] as Map<String, String>?)
        } catch (e: UnknownError) {
            throw(e);
        }
    }

    fun openBeacon(context: Context, arguments: Map<*, *>) {
        val signature: String? = arguments["signature"] as String?;
        try {
            if (signature != null) {
                BeaconActivity.openInSecureMode(context, signature);
            } else {
                BeaconActivity.open(context);
            }
        } catch (e: UnknownError) {
            throw(e);
        }
    }

    fun logoutBeacon() {
        try {
            Beacon.logout();
        } catch (e: UnknownError) {
            throw(e);
        }
    }

    private fun identifyUser(email: String, name: String, attributes: Map<String, String>?) {
        try {
            Beacon.identify(email, name);

            if (attributes != null) {
                for ((key, value) in attributes!!) {
                    Beacon.addAttributeWithKey(key, value);
                }
            }
        } catch (e: UnknownError) {
            throw(e);
        }
    }
}