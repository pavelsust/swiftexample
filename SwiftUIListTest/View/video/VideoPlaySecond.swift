//
//  VideoPlaySecond.swift
//  SwiftUIListTest
//
//  Created by Masud  Parvez on 2/7/24.
//

import SwiftUI
import AZVideoPlayer
import AVFoundation


struct VideoPlaySecond: View {
    var player: AVPlayer?
    
    init() {
        self.player = AVPlayer(url: URL(string: "http://lifetvbd.xyz:8080/2x6Mfws7vc/3ENWPmuKmR/1686.m3u8")!)
    }
    
    var body: some View {
        AZVideoPlayer(player: player)
            .aspectRatio(16/9, contentMode: .fit)
            // Adding .shadow(radius: 0) is necessary if
            // your player will be in a List on iOS 16.
            .shadow(radius: 0)
    }
}
