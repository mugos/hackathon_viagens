<template>
  <section class="message-box__container">
    <slot>
      Hey guy, how are you?
    </slot>
  </section>
</template>

<script>
export default {
}
</script>

<style lang="sass">
.message-box
  &__container
    display: inline-block
    vertical-align: middle
    box-shadow: 0px 1px 0px 0px rgba(50, 50, 50, 0.3)
    border-radius: 2px
    color: #fff
    background: #F44336
    padding: 10px
    position: relative
  &__container:before
    border-width: 0 10px 10px 0
    border-color: transparent #F44336 transparent transparent
    position: absolute
    top: 0
    left: -9px
</style>
