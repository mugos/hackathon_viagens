<template>
  <section class="app__container">
    <main-header></main-header>
    <router-view></router-view>
    <main-footer></main-footer>
  </section>
</template>

<script>
// Components
import MainHeader from './components/MainHeader'
import MainFooter from './components/MainFooter'

//
export default {
  components: {
    MainHeader,
    MainFooter
  }
}
</script>

<style lang="sass">
@import './../node_modules/bulma/bulma'
</style>
