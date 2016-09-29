//
import * as types from './mutation-types'

//
export const sendMessage = ({ commit }, message) => {
  // Just commit it
  commit(types.RECEIVE_MESSAGE, message)
}
