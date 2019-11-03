//
//  SongRow.swift
//  Hack2019
//
//  Created by Surya Kukkapalli on 11/2/19.
//  Copyright © 2019 Surya Kukkapalli. All rights reserved.
//

import SwiftUI

struct SongRow: View {
    var song: Song
    
    var body: some View {
        HStack {
            //song.item.album.images[0]
            Text(song.item.name)
        }
        
    }
}

struct SongRow_Previews: PreviewProvider {
    static var previews: some View {
        SongRow(song: songData[0])
            .previewLayout(.fixed(width: 300, height: 70))
    }
}

