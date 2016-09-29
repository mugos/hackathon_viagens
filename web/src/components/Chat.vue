<template>
  <section class="container">
    <section class="chat__container">
      <template v-for="message in currentMessages">
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
import { mapGetters } from 'vuex'

//
export default {
  // Use the components
  components: {
    InMessage,
    OutMessage,
    SendMessage
  },
  computed: {
    ...mapGetters(['currentMessages'])
  }
}
</script>

<style lang="sass">
.chat
  &__container
    background: #fff
    padding: 10px
</style>
