//
//  RemoteContentView.swift
//  Networking x Kristiania
//
//  Created by Konstantin Loginov on 13.09.2021.
//

import SwiftUI

struct RemoteContentView: View {
    
    @ObservedObject var viewModel = RemoteContentViewModel()
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Button {
                    viewModel.loadTranferConfig()
                } label: {
                    Text("Download Transfer Config")
                }
                
                Button {
                    viewModel.loadBTC()
                } label: {
                    Text("Download BTC-rate")
                }
                
                Button {
                    viewModel.loadLiveTicker()
                } label: {
                    Text("Download LiveTicker")
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

struct RemoteContentView_Previews: PreviewProvider {
    static var previews: some View {
        RemoteContentView()
    }
}
