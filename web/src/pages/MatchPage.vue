<template>
  <section class="match-page__container">
    <section class="match-page__title">
      Agentes encontrados...
    </section>

    <section class="columns is-multiline">
      <profile v-for="profile in getProfiles" :profile="profile"></profile>
    </section>
  <!-- end .match-page__container -->
  </section>
</template>

<script>
//
import Profile from './../components/Profile'

//
import { mapGetters } from 'vuex'

//
export default {
  // Use the components
  components: {
    Profile
  },
  computed: {
    ...mapGetters(['getProfiles'])
  }
}
</script>

<style lang="sass">
.match-page
  &__container
    padding: 15px
  &__title
    margin: 10px
    font-size: 18px
    font-weight: bold
    text-align: center
</style>
