<template>
  <section class="">
    <header class="nav header">
      <section class="nav-center">
        <section class="header__logo">
          BOT!!!
        <!-- end .header__logo -->
        </section>
      <!-- end .nav-center -->
      </section>
    <!-- end .header -->
    </header>

    <router-view></router-view>

    <footer class="footer">
      <section class="container">
        <section class="content has-text-centered">
          Made with &lt;3 by HACKATOUR
        <!-- end .content.has-text-centered -->
        </section>
      <!-- end .container -->
      </section>
    <!-- end .footer -->
    </footer>
  </section> 
</template>

<script>
export default {
}
</script>

<style lang="sass">
@import './../node_modules/bulma/bulma'

.header
  &__logo
    padding: 10px
    font-size: 20px
    font-weight: bold
</style>
