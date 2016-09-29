//
import * as types from './mutation-types'
import mock from './mock'

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
export const sendMessage = (store, message) => {
  // Just commit it
  store.commit(types.RECEIVE_MESSAGE, message)

  //
  sendBotMessage(store)
}
