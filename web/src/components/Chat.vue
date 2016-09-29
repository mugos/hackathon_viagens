<template>
  <section class="container">
    <section class="chat__container">
      <template v-for="message in messages">
        <out-message v-if="message.self" :message="message"></out-message>
        <in-message v-else :message="message"></in-message>
      </template>
      <send-message></send-message>
    </section>
  </section>
</template>

<script>
// Import components
import InMessage from './InMessage'
import OutMessage from './OutMessage'
import SendMessage from './SendMessage'

//
export default {
  // Use the components
  components: {
    InMessage,
    OutMessage,
    SendMessage
  },
  data () {
    return {
      messages: [
        {text: 'Hey guy', self: false},
        {text: 'Hey... Whats up?', self: true}
      ]
    }
  }
}
</script>

<style lang="sass">
.chat
  &__container
    background: #fff
    padding: 10px
</style>
