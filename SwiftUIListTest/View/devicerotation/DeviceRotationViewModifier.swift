//
//  DeviceRotationViewModifier.swift
//  SwiftUIListTest
//
//  Created by Masud  Parvez on 2/6/24.
//

import Foundation
import SwiftUI



struct DeviceRotationViewModifier : ViewModifier {
    let action : (UIDeviceOrientation) -> Void
    
    func body(content : Content) -> some View{
        content
            .onAppear()
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification), perform: { _ in
                action(UIDevice.current.orientation)
            })
    }
}


class DeviceRotationInfo : ObservableObject{
    
    @Published
    var orientation : UIDeviceOrientation = UIDeviceOrientation.unknown
    
    func getDeviceOrientation() -> UIDeviceOrientation {
        return UIDevice.current.orientation
    }
}

extension View {
    func onRotate(perform action : @escaping (UIDeviceOrientation) -> Void) -> some View{
       self.modifier(DeviceRotationViewModifier(action: action))
    }
}

struct DeviceRotationVew : View {
    @State private var orientation = UIDeviceOrientation.unknown
    
    @StateObject var deviceOrientationInfo = DeviceRotationInfo()
    
    var body: some View{
        Text("\(deviceOrientationInfo.getDeviceOrientation().rawValue)")

        Group{
            if orientation.isPortrait{
                Text("Portrait")
            } else if orientation.isLandscape {
                Text("Landscape")
            } else if orientation.isFlat {
                Text("Flat")
            } else {
                Text("Unknown")
            }
        }
        
        .onRotate{ newOrientation in
            self.orientation = newOrientation
        }
        
    }
}

#Preview {
    DeviceRotationVew()
}



