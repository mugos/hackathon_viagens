//
import * as types from './mutation-types'
import mock from './mock'

//
export const sendBotMessage = ({ commit, state }) => {
  // no message
  let msg = ''

  // Commit a new bot message
  if (mock[state.step] !== undefined) {
    msg = mock[state.step]
  } else {
    msg = mock.default
  }

  // Send message
  commit(types.RECEIVE_MESSAGE, {text: msg, self: false})
  commit(types.NEXT_STEP)
}

//
export const sendMessage = (store, message) => {
  // Just commit it
  store.commit(types.RECEIVE_MESSAGE, message)

  //
  sendBotMessage(store)
}
