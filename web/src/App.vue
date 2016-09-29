<template>
  <section class="app__container">
    <main-header></main-header>
    <router-view></router-view>
  </section>
</template>

<script>
// Components
import MainHeader from './components/MainHeader'

//
export default {
  components: {
    MainHeader
  }
}
</script>

<style lang="sass">
@import './../node_modules/bulma/bulma'
</style>
