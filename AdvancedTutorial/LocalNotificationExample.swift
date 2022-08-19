//
//  LocalNotificationExample.swift
//  AdvancedTutorial
//
//  Created by Traian on 18.08.2022.
//

import SwiftUI
import UserNotifications
import CoreLocation

class NotidicationManager{
    static let instance = NotidicationManager()
    
    func requestAuthorisation(){
        let options: UNAuthorizationOptions = [.sound, .badge, .alert]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { success, error in
            if let error = error {
                print("Error: \(error)")
            }else{
                //prints true
                print(success)
            }
        }
    }
    
    
    func scheduleNotification(){
        let content = UNMutableNotificationContent()
        content.title = "This is my first scheduled notification"
        content.subtitle = "This is  a subtitle"
        content.sound = .default
        content.badge = 1
        
        //time
        //let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
        //calendar
//        var dateComponents = DateComponents()
//        dateComponents.hour = 23
//        dateComponents.minute = 20
//        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        //location
        let coordinates  = CLLocationCoordinate2D(latitude: 40.00, longitude: 50.00)
        let region = CLCircularRegion(center: coordinates, radius: 50, identifier: UUID().uuidString)
        region.notifyOnEntry = true
        let trigger = UNLocationNotificationTrigger(region: region, repeats: true)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
    
    //this is how you cancel all notiffications
    func cancelNotifications(){
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
    }
}
struct LocalNotificationExample: View {
    var body: some View {
        VStack{
            CustomButton(title: "Request Auth") {
                NotidicationManager.instance.requestAuthorisation()
            }
            CustomButton(title: "Schedule Notification") {
                NotidicationManager.instance.scheduleNotification()
            }
            CustomButton(title: "Cancel Notification") {
                NotidicationManager.instance.cancelNotifications()
            }
        }
        .onAppear{
            //removes the app badge number after the notification trigger
            UIApplication.shared.applicationIconBadgeNumber = 0
        }
    }
}

struct LocalNotificationExample_Previews: PreviewProvider {
    static var previews: some View {
        LocalNotificationExample()
    }
}
