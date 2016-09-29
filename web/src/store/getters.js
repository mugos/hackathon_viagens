//
export const featuredVideos = (state) => {
  // Slice the first four videos
  return state.videos.slice(0, 4)
}
