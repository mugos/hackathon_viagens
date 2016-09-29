<template>
  <section class="out-message__container">
    <section class="columns">
      <section class="column is-offset-8">
        <message-box>
          {{ message.text }}
        </message-box>
      </section>
    </section>
  </section>
</template>

<script>
// Import components
import MessageBox from './MessageBox'

//
export default {
  props: {
    message: Object
  },
  //
  components: {
    MessageBox
  }
}
</script>

<style lang="sass">
.out-message
  &__container
    text-align: right
</style>
