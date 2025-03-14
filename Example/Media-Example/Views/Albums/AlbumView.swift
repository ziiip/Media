//
//  AlbumView.swift
//  Media-Example
//
//  Created by Christian Elies on 01.05.21.
//  Copyright © 2021 Christian Elies. All rights reserved.
//

import MediaCore
import SwiftUI

struct AlbumView: View {
    let album: Album

    var body: some View {
        VStack(spacing: 0) {
            Text("\(album.allMedia.count) media items").font(.footnote).padding(.vertical)

            List {
                let audios = album.audios
                if audios.count > 0 {
                    Section {
                        NavigationLink(destination: AudiosView(audios: audios)) {
                            Text("Audios (\(audios.count))")
                        }
                    }
                }

                let livePhotos = album.livePhotos
                if livePhotos.count > 0 {
                    Section {
                        NavigationLink(destination: LivePhotosView(livePhotos: livePhotos)) {
                            Text("Live Photos (\(livePhotos.count))")
                        }
                    }
                }

                let photos = album.photos
                if photos.count > 0 {
                    Section {
                        NavigationLink(destination: PhotosView(photos: photos)) {
                            Text("Photos (\(photos.count))")
                        }
                    }
                }

                let videos = album.videos
                if videos.count > 0 {
                    Section {
                        NavigationLink(destination: VideosView(videos: videos)) {
                            Text("Videos (\(videos.count))")
                        }
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
        }
        .navigationBarTitle(Text(album.localizedTitle ?? ""), displayMode: .inline)
    }
}
