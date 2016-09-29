<template>
  <section class="about__page">
    <section class="about__banner">
      <section class="container">
        <section class="about__banner-title">
          Programas Tripdegree
        </section>

        <section class="about__banner-subtitle">
          Certificações da indústria para os empregos atuais
        </section>

        <section class="about__banner-desc">
          Tenha as habilidades que estão em alta e são as mais procuradas pelas empresas de turismo.
          Explore diversos destinos e crie experiências incríveis.
        <!-- end .about__banner-desc -->
        </section>
      <!-- end .container -->
      </section>
    <!-- end .about__banner -->
    </section>

    <section class="about__search-container">
      <form @submit="search">
        <section class="container">
          <input type="text" class="input about__search" placeholder="Search">
          <button type="submit" class="button about__search-submit">Buscar</button>
        <!-- end .container -->
        </section>
      <!-- end form -->
      </form>
    <!-- end .about__search-container -->
    </section>

    <section v-for="area in getAreas" class="about__courses">
      <section class="container">
        <section class="about__courses-group">
          <section class="about__courses-area-title">
            {{ area.title }}
          </section>
          <section class="columns is-mobile">
            <section v-for="course in area.courses" class="column is-half">
              <section class="about__courses-item">
                <section class="about__courses-item-icon">
                  <img class="image is-64x64" :src="area.img">
                </section>
                <section class="about__courses-item-title">
                  {{ course.title }}
                </section>
                <section class="about__courses-item-desc">
                  {{ course.desc }}
                </section>
                <router-link :to="'/course/' + area.slug" class="button about__courses-item-link">
                  Explorar curso
                </router-link>
              <!-- end .about__courses-item -->
              </section>
            <!-- end .column.is-half -->
            </section>
          <!-- end .columns.is-mobile -->
          </section>
        <!-- end .about__courses-group -->
        </section>
      <!-- end .container -->
      </section>
    <!-- end .about__courses -->
    </section>
  <!-- end .about__page -->
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
  methods: {
    search (e) {
      e.preventDefault()
    }
  },
  computed: {
    ...mapGetters(['getAreas', 'featuredVideos', 'operationAreas'])
  }
}
</script>

<style lang="sass">
.about
  &__banner
    color: #fff
    padding: 20px
    background: url(./../assets/mountains.jpg) center center
    &-title
      text-align: center
      font-size: 35px
      font-weight: bold
    &-subtitle
      text-align: center
      font-size: 25px
      font-weight: bold
      margin: 0 0 10px
    &-desc
      font-size: 18px
  &__search
    margin: 0 0 5px
    &-container
      margin: 15px
    &-submit
      width: 100%
  &__courses
    // margin: 0 0 30px
    padding: 10px
    // background: linear-gradient(#614385, #516395)
    background: #eaeaea
    &-area-title
      font-size: 16px
      padding: 10px 0
    &-item
      padding: 20px
      background: #fff
      text-align: center
      &-title
        color: #2C3E50
        font-weight: bold
        font-size: 15px 
      &-icon
        margin: 0 0 5px
        img
          margin: 0 auto
      &-desc
        font-size: 12px
      &-link
        text-aling: center
        margin: 10px 0 0
</style>
