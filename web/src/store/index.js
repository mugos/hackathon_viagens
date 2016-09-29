//
import Vue from 'vue'
import Vuex from 'vuex'

// Vuex stuff
import * as getters from './getters'
import * as actions from './actions'
import * as types from './mutation-types'

//
Vue.use(Vuex)

//
const state = {
  // {text: 'Hey guy', self: false},
  messages: [],
  profiles: [
    { id: 1, name: 'Gabriel', nickname: 'gabriel', desc: 'Descricao', tags: ['total', 'dinner'], selected: false }
  ],
  step: 0
}

// Mutations that could happen
const mutations = {
  //
  [types.RECEIVE_MESSAGE] (state, message) {
    // Push to the node of images
    state.messages.push(message)
  },
  [types.NEXT_STEP] (state) {
    state.step++
  }
}

// Export all of them
export default new Vuex.Store({
  state,
  getters,
  actions,
  mutations
})
