<template>
  <section class="in-message__container">
    <section class="columns">
      <section class="column">
        <section class="in-message__photo">
          <img src="./../assets/robot.jpeg">
        </section>
        <message-box>
          <template v-if="!message.last">
            {{ message.text }}
          </template>
          <template v-else>
            <router-link to="/match">Veja os agentes</router-link>
          </template>
        </message-box>
      </section>
    </section>
  </section>
</template>

<script>
// Import components
import MessageBox from './MessageBox'

// Default
export default {
  //
  props: {
    message: Object
  },
  components: {
    MessageBox
  }
}
</script>

<style lang="sass">
.in-message
  &__photo
    display: inline-block
    vertical-align: middle
    width: 50px
    height: 50px
    border-radius: 100px
    overflow: hidden
  &__box
    box-shadow: 0px 1px 0px 0px rgba(50, 50, 50, 0.3)
    border-radius: 2px
    color: #fff
    background: #F44336
    padding: 10px
</style>
