//
//  BoiteMeuh.swift
//  BoiteAMeuh
//
//  Created by Philippe MICHEL on 13/12/2020.
//

import SwiftUI

struct BoiteMeuh: View {
    @Binding var basculeAnim:Bool
    
    var body: some View {
        
        VStack {
            Text("title")
                .foregroundColor(.white)
                .bold()
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                //Appel de la fontion secousse
                .onShake {
                    withAnimation {
                        self.basculeAnim.toggle()
                    }
                    JouerSon(nomDuSon: "cow", typeSon: "mp3")
                }
            
                Image(Ressources.images.meuh.rawValue)
                    .resizable()
                    // si boulean est vrai on bascule l'image à 180° sinon basculement vers 0°
                    .rotationEffect(.degrees(basculeAnim ? 180 : 0))
                    .animation(Animation.easeIn(duration: 2).delay(0.5),value:basculeAnim)
                    .aspectRatio(contentMode: .fit)
                   .frame(width: 220, height: 330)
                    
        }
        
    }
}

//----------------------------------------------------//
// Gestion de secouse de l'iphone en swiftUI          //
//----------------------------------------------------//
//notification envoyé pour un gesste de secousse
extension UIDevice {
    static let deviceDidShakeNotification = Notification.Name(rawValue: "deviceDidShakeNotification")
}

//fonction de secousse (UIKIT
extension UIWindow {
    open override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            NotificationCenter.default.post(name: UIDevice.deviceDidShakeNotification, object: nil)
        }
    }
}
// modificateur de vue qui encapsule le modificateur de vue
extension View {
    func onShake(perform action: @escaping () -> Void) -> some View {
        self.modifier(DeviceShakeViewModifier(action: action))
    }
}

//modificateur de vue pour surveiller si un geste est émis
struct DeviceShakeViewModifier: ViewModifier {
    let action: () -> Void
    
    func body(content: Content) -> some View {
        content
            .onAppear()
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.deviceDidShakeNotification)) { _ in
                action()
            }
    }
}

struct BoiteMeuh_Previews: PreviewProvider {
    static var previews: some View {
        BoiteMeuh(basculeAnim: .constant(false))
    }
}
