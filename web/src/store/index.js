//
import Vue from 'vue'
import Vuex from 'vuex'

// Vuex stuff
import * as getters from './getters'
import * as actions from './actions'
// import * as types from './mutation-types'

// MOCK!!!
import mock from './mock'

//
Vue.use(Vuex)

//
const state = {
  //
  videos: mock.videos,
  areas: mock.areas,
  operationAreas: mock.operationAreas
}

// Mutations that could happen
const mutations = {
}

// Export all of them
export default new Vuex.Store({
  state,
  getters,
  actions,
  mutations
})
