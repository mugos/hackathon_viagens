<template>
  <section class="home__container">
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

    <section class="">
    </section>

    <section class="home__operations-content">
      <section class="container">
        <section class="home__operations-text">
          <p class="home__operations-title">
            Areas de Atuacao
          </p>
          <p class="home__operations-desc">
            Nossa missão como uma Universidade focada em Turismo é entregar as melhores práticas do mercado para o seu trabalho no seu dia a dia, além de abrirmos portas no mercado de trabalho. 
          </p>
        <!-- end .home__operations-text -->
        </section>
        <section class="home__operations-areas">
          <section v-for="area in operationAreas" class="home__operations-area">
            <section class="home__operations-area-icon">
              <img :src="area.icon">
            </section>
            <section class="home__operations-area-title">{{ area.title }}</section>
          </section>
        <!-- end .home__operations-areas -->
        </section>
      <!-- end .container -->
      </section>
    <!-- end .home__operations-content -->
    </section>
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
    ...mapGetters(['featuredVideos', 'operationAreas'])
  }
}
</script>

<style lang="sass">
.home__operations
  &-content
    padding: 10px 20px
  &-text
    text-align: center
  &-title
    font: 25px bold Helvetica
    margin: 0 0 5px
  &-areas
    text-align: center
  &-area
    display: inline-block
</style>
