<template>
  <section class="home__featured-content">
    <section class="container">
      <section class="home__featured">
        <section class="columns">
          <section class="column is-half home__main-featured">
            MAIN VIDEO
          </section>
          <section class="column is-half home__featureds">
            <section class="columns is-multiline">
              <section v-for="video in featuredVideos" class="column is-half">
                HELLO
              </section>
            <!-- end .columns.is-multiline -->
            </section>
          <!-- end colum.is-half.home__featureds -->
          </section>
        <!-- end .columns -->
        </section>
      <!-- end .home__featured -->
      </section>
    <!-- end .container -->
    </section>
  <!-- end .home__featured-content -->
  </section>
</template>

<script>
//
import { mapGetters } from 'vuex'

//
export default {
  // Use the components
  components: {
  },
  computed: {
    ...mapGetters(['featuredVideos'])
  }
}
</script>

<style lang="sass">
</style>
