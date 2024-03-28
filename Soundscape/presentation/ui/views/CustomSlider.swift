//
//  CustomSlider.swift
//  Soundscape
//
//  Created by Aman Kumar on 28/03/24.
//

import SwiftUI

struct CustomSlider<T: BinaryFloatingPoint>: View {
    @Binding var value: T
    let inRange: ClosedRange<T>
    let activeFillColor: Color
    let fillColor: Color
    let emptyColor: Color
    let height: CGFloat
    let onEditingChanged: (Bool) -> Void
    
    // private variables
    @State private var localRealProgress: T = 0
    @State private var localTempProgress: T = 0
    @GestureState private var isActive: Bool = false
    @State private var progressDuration: T = 0
    
    init(value: Binding<T>,
         inRange: ClosedRange<T>,
         activeFillColor: Color,
         fillColor: Color,
         emptyColor: Color,
         height: CGFloat,
         onEditingChanged: @escaping (Bool) -> Void
    ) {
        self._value = value
        self.inRange = inRange
        self.activeFillColor = activeFillColor
        self.fillColor = fillColor
        self.emptyColor = emptyColor
        self.height = height
        self.onEditingChanged = onEditingChanged
    }
    
    var body: some View {
        GeometryReader { bounds in
            ZStack {
                VStack {
                    ZStack(alignment: .center) {
                        Capsule()
                            .fill(emptyColor)
                            .frame(width: bounds.size.width, height: 5)
                        
                        HStack(spacing: 0) {
                            Capsule()
                                .fill(isActive ? activeFillColor : fillColor)
                                .frame(width: max(bounds.size.width * CGFloat((localRealProgress + localTempProgress)), 0), height: 5)
                                .overlay {
                                    Color.clear
                                        .frame(width: 80, height: 80)
                                }
                            
                            Circle()
                                .fill(.white)
                                .frame(width: 15, height: 15)
                                .offset(x: -5)
                            
                            Spacer()
                        }
                    }
                }
            }
            .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
                .updating($isActive) { value, state, transaction in
                    state = true
                }
                .onChanged { gesture in
                    localTempProgress = T(gesture.translation.width / bounds.size.width)
                    let prg = max(min((localRealProgress + localTempProgress), 1), 0)
                    progressDuration = inRange.upperBound * prg
                    value = max(min(getPrgValue(), inRange.upperBound), inRange.lowerBound)
                }.onEnded { value in
                    localRealProgress = max(min(localRealProgress + localTempProgress, 1), 0)
                    localTempProgress = 0
                    progressDuration = inRange.upperBound * localRealProgress
                })
            .onChange(of: isActive) { newValue in
                value = max(min(getPrgValue(), inRange.upperBound), inRange.lowerBound)
                onEditingChanged(newValue)
            }
            .onAppear {
                localRealProgress = getPrgPercentage(value)
                progressDuration = inRange.upperBound * localRealProgress
            }
            .onChange(of: value) { newValue in
                if !isActive {
                    localRealProgress = getPrgPercentage(newValue)
                }
            }
        }
        .frame(height: height, alignment: .center)
    }
    
    private func getPrgPercentage(_ value: T) -> T {
        let range = inRange.upperBound - inRange.lowerBound
        let correctedStartValue = value - inRange.lowerBound
        let percentage = correctedStartValue / range
        return percentage
    }
    
    private func getPrgValue() -> T {
        return ((localRealProgress + localTempProgress) * (inRange.upperBound - inRange.lowerBound)) + inRange.lowerBound
    }
}

#Preview {
    CustomSlider(value: .constant(10), inRange: 0...20, activeFillColor: .white, fillColor: .white, emptyColor: .gray, height: 30, onEditingChanged: { _ in })
        .padding(.horizontal, 100)
}
