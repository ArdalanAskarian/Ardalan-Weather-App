//
//  LoadingView.swift
//  ArdalanWeatherApp
//
//  Created by Ardalan Askarian on 2024-01-01.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .white))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    LoadingView()
}
