//
import * as types from './mutation-types'
import mock from './mock'
import Vue from 'vue'

// Request
const req = function (path) {
  return Vue.http.get(`http://127.0.0.1:8000/${path}`)
}

//
export const sendBotMessage = ({ commit, state }) => {
  // no message
  let msg = ''

  // Commit a new bot message
  if (mock[state.step] !== undefined) {
    msg = { text: mock[state.step], self: false }
  } else {
    msg = { text: mock.default, last: true, self: false }
  }

  // Send messag
  commit(types.RECEIVE_MESSAGE, msg)
  commit(types.NEXT_STEP)
}

//
export const sendMessage = ({commit, state}, message) => {
  // Mock
  // store.commit(types.RECEIVE_MESSAGE, message)
  // sendBotMessage(store)

  req('hello').then(res => {
    const msg = { text: res.body, self: false }
    commit(types.RECEIVE_MESSAGE, msg)
  })
}
