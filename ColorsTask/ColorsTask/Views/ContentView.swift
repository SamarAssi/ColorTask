//
//  ContentView.swift
//  ColorsTask
//
//  Created by Samar Assi on 17/03/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var colorViewModel: ColorViewModel = ColorViewModel()
    
    @State var description: String
    @State var background: Color
    @State var showSheet: Bool = false
    
    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
    @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?
    
    var body: some View {
        NavigationStack {
            if (horizontalSizeClass == .compact && verticalSizeClass == .regular) {
                portraitMode
            } else {
                landscapeMode
            }
        }
        .sheet(isPresented: $showSheet) {
            AddNewColor(colorViewModel: colorViewModel, showSheet: $showSheet)
        }
        .onAppear {
            colorViewModel.loadColorViewModel()
            description = colorViewModel.colorViewModel[0].description
            background = Color(colorViewModel.colorViewModel[0].color)
        }
        .onChange(of: colorViewModel.colorViewModel) { oldValue, newValue in
            guard !newValue.isEmpty else {
                description = "The list is empty"
                return
            }
            description = newValue[0].description
            background = Color(newValue[0].color)
        }
    }
}

extension ContentView {
    var portraitMode: some View {
        VStack(alignment: .leading, spacing: 0) {
            ListView(
                colorViewModel: colorViewModel,
                description: $description,
                background: $background,
                showSheet: $showSheet,
                amountOfPadding: 0
            )
            .navigationTitle("Colors")
            .navigationBarItems(
                leading: EditButton(),
                trailing:
                    Button {
                        showSheet.toggle()
                    } label: {
                        Text("Add")
                    }
            )
            .foregroundStyle(.black)
            .fontWeight(.bold)
                
            descriptionView.padding(20)
        }
        .background(background)
    }
    
    var landscapeMode: some View {
        GeometryReader { geo in
            HStack {
                ListView(
                    colorViewModel: colorViewModel,
                    description: $description,
                    background: $background,
                    showSheet: $showSheet,
                    amountOfPadding: 40
                )
                .ignoresSafeArea()
                
                descriptionView
                    .frame(width: geo.size.width * 2 / 3)
                    .padding()
            }
            .background(background)
        }
    }
    
    var descriptionView: some View {
        VStack(alignment: .leading) {
            Text("Descpription")
                .fontWeight(.bold)
                .padding(.bottom)
            Text(description)
            Spacer()
        }
        .foregroundStyle(Color.white)
    }
}

#Preview {
    ContentView(description: "", background: Color.white)
}
