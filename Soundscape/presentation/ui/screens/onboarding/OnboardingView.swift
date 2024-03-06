//
//  OnboardingView.swift
//  Soundscape
//
//  Created by Aman Kumar on 02/03/24.
//

import SwiftUI

struct OnboardingView: View {
    @State var selectedOnboarding: Onboarding = OnboardingData.sampleOnboardingData
    @State var selectedIndex: Int = 0
    @State var openLoginSelectView: Bool = false
    
    var body: some View {
        ZStack {
            if openLoginSelectView {
                LoginSelectionView()
            } else {
                VStack {
                    TabView(selection: $selectedOnboarding) {
                        ForEach(OnboardingData.onboardingList) { onboarding in
                            OnboardingListView(onboarding: onboarding)
                                .tag(onboarding)
                        }
                    }
                    .animation(.default)
                    .tabViewStyle(.page(indexDisplayMode: .never))
                    .onChange(of: selectedOnboarding) { newValue in
                        withAnimation(.easeInOut) {
                            selectedIndex = newValue.position - 1
                        }
                    }
                    
                    HStack(spacing: 5) {
                        ForEach(OnboardingData.onboardingList.indices, id: \.self) { index in
                            Capsule()
                                .fill(index == selectedIndex ? Color.white : Color.gray.opacity(0.5))
                                .frame(width: index == selectedIndex ? 30 : 10, height: 10)
                        }
                        
                        Spacer()
                        
                        Button {
                            if selectedIndex < 3 {
                                withAnimation(.easeInOut) {
                                    selectedIndex += 1
                                }
                                selectedOnboarding = OnboardingData.onboardingList[selectedIndex]
                            }
                        } label: {
                            if selectedIndex == 3 {
                                OnboardingNextButtonView()
                                    .onTapGesture {
                                        withAnimation(.easeInOut) {
                                            openLoginSelectView = true
                                        }
                                    }
                            } else {
                                OnboardingArrowButtonView()
                            }
                        }
                    }
                    .padding()
                }
            }
        }
        .background(
            ZStack {
                Image(selectedOnboarding.backgroundImage)
                    .resizable()
                    .scaledToFill()
            }
        )
    }
}

#Preview {
    OnboardingView(selectedOnboarding: OnboardingData.sampleOnboardingData)
}
