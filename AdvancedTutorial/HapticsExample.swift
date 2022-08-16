//
//  HapticsExample.swift
//  AdvancedTutorial
//
//  Created by Traian on 16.08.2022.
//

import SwiftUI


class HapticManager{
    static let instance  = HapticManager()
    
    func notification(type:UINotificationFeedbackGenerator.FeedbackType){
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    func impact(style:UIImpactFeedbackGenerator.FeedbackStyle){
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()

    }
}
struct HapticsExample: View {
    var body: some View {
        VStack{
            CustomButton(title: "Notification") {
                HapticManager.instance.notification(type: .success)
            }
            Divider()
            CustomButton(title: "Vibration") {
                HapticManager.instance.impact(style: .heavy)

            }
            
        }
    }
}

struct HapticsExample_Previews: PreviewProvider {
    static var previews: some View {
        HapticsExample()
    }
}
