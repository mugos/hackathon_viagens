//
export const featuredVideos = (state) => {
  // Slice the first four videos
  return state.videos.slice(0, 4)
}

// Operation areas
export const operationAreas = (state) => {
  return state.operationAreas
}
