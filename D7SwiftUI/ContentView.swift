//
//  ContentView.swift
//  Mimicry
//
//  Created by User on 18.03.2024.
//

import SwiftUI

struct ContentView: View {
    @State var isNeedExpanded: Bool = true
    @Namespace var expansionAnimation
    private var rectangleId = "Rectangle"
    private var titleId = "title"

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            if isNeedExpanded {
                smallSizeView()
            } else {
                largeSizeView()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    @ViewBuilder
    func smallSizeView() -> some View {
        ZStack {
            Button(action: {
                withAnimation {
                    isNeedExpanded.toggle()
                }
            }, label: {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundStyle(.blue)
                    .matchedGeometryEffect(id: rectangleId, in: expansionAnimation)
                    .frame(width: 100, height: 60)
                    .padding(12)
                    .overlay {
                        Text("Open")
                            .matchedGeometryEffect(id: titleId,
                                                   in: expansionAnimation,
                                                   properties: .position, anchor: .leading)
                            .foregroundStyle(.white)
                            .font(.title2)
                    }

            })
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
    }

    @ViewBuilder
    func largeSizeView() -> some View {
        ZStack(alignment: .topLeading) {
            RoundedRectangle(cornerRadius: 12)
                .fill(.blue)
                .matchedGeometryEffect(id: rectangleId, in: expansionAnimation)
                .frame(width: 285, height: 280)
            Button(action: {
                withAnimation() {
                    isNeedExpanded.toggle()
                }

            }, label: {
                Group {
                    Text(Image(systemName: "arrowshape.backward.fill")) +
                    Text("Back")
                }
                .matchedGeometryEffect(id: titleId, in: expansionAnimation, properties: .position, anchor: .leading)
                .font(.headline)
                .foregroundStyle(.white)
                .padding(.all, 10)
            })
            .frame(width: 90, height: 40, alignment: .bottomLeading)
        }
    }
}

#Preview {
    ContentView()
}
