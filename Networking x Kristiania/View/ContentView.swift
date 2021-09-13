//
//  ContentView.swift
//  Networking x Kristiania
//
//  Created by Konstantin Loginov on 13.09.2021.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = ContentViewModel()
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Button {
                    viewModel.parseTransfersConfig(viewModel.provideJson("TransfersConfig"))
                } label: {
                    Text("Parse Transfer Config")
                }
                
                Button {
                    viewModel.parseBTC(viewModel.provideJson("BTC"))
                } label: {
                    Text("Parse BTC-rate")
                }
                
                Button {
                    viewModel.parseLiveTicker(viewModel.provideJson("LiveTicker"))
                } label: {
                    Text("Parse LiveTicker")
                }
            }
            
            Spacer()
            
            switch viewModel.state {
            case .initial:
                EmptyView()
            case .success:
                Image(systemName: "checkmark.circle.fill")
                    .resizable()
                    .frame(width: 200, height: 200)
            case .failure:
                Image(systemName: "xmark.circle.fill")
                    .resizable()
                    .frame(width: 200, height: 200)
            }
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
