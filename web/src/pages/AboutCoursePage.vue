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
          Receba a melhor certificação do mercado.
          Inicie sua carreira em Turismo com as melhores práticas.
        <!-- end .about__banner-desc -->
        </section>
      <!-- end .container -->
      </section>
    <!-- end .about__banner -->
    </section>

    <section class="about__program">
      <section class="container">
        <section class="about__program-title">
          Como funcionam os programas Tripdegree?
        </section>
        <section class="about__program-item">
          <section class="about__program-item-icon">
            <img class="image is-64x64" src="">
          </section>
          <section class="about__program-item-title">
            Escolha seu programa Tripdegree
          </section>
          <section class="about__program-item-desc">
            Cada programa é criado com as melhores práticas do mercado em parcerias com as empresas de turismo.
          </section>
        <!-- end .about__program-item -->
        </section>
      <!-- end .container -->
      </section>
    <!-- end .about__program -->
    </section>

    <section class="about__courses">
      <section class="container">
        <section class="columns is-mobile">
          <section class="column is-half">
            <section class="about__courses-item">
              <section class="about__courses-item-icon">
                <img class="image is-64x64" src="">
              </section>
              <section class="about__courses-item-title">
                Tripdegree
                Atendimento One-to-One
              </section>
              <section class="about__courses-item-desc">
                Aprenda sobre experiências altamente personalizadas para Viajantes
              </section>
              <a class="button about__courses-item-link">
                Explore os cursos
              </a>
            <!-- end .about__courses-item -->
            </section>
          <!-- end .column.is-half -->
          </section>

          <section class="column is-half">
            <section class="about__courses-item">
              <section class="about__courses-item-icon">
                <img class="image is-64x64" src="">
              </section>
              <section class="about__courses-item-title">
                Tripdegree
                Cuba
              </section>
              <section class="about__courses-item-desc">
                Tudo sobre o turismo de Cuba. Desde hotéis a experiências. 
                Planeje os melhores destinos e pacotes.
              </section>
              <a class="button about__courses-item-link">
                Explore os cursos
              </a>
            <!-- end .about__courses-item -->
            </section>
          <!-- end .column.is-half -->
          </section>
        <!-- end .columns.is-mobile -->
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
  computed: {
    ...mapGetters(['featuredVideos', 'operationAreas'])
  }
}
</script>

<style lang="sass">
.about
  &__banner
    color: #fff
    padding: 20px
    height: 400px
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
  &__program
    text-align: center
    padding: 10px
    &-item
      display: inline-block
      vertical-align: top
      padding: 10px
      &-icon
        img
          margin: 0 auto
      &-title
        color: #2C3E50
        font-weight: bold
      &-desc
        text-align: justify
  &__courses
    padding: 10px
    background: linear-gradient(#614385, #516395)
    &-item
      background: #fff
      padding: 10px
      &-title
        color: #2C3E50
        font-weight: bold
        text-align: center
        font-size: 15px 
      &-desc
        text-align: center
      &-icon
        margin: 0 0 5px
        img
          margin: 0 auto
      &-link
        display: block
        text-aling: center
        margin: 5px 0 0
</style>
