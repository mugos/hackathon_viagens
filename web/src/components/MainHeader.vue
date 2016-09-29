<template>
  <section class="main-header__container">
    <section class="container"> 
      <section class="nav">
        <section class="main-header__logo">
          Unitravel
        </section>
      <!-- end .nav -->
      </section>

      <section class="nav main-header__menu-container">
        <section class="main-header__menu">
          <a class="nav-item main-header__menu-item" href="#">Couses</a>
          <a class="nav-item main-header__menu-item" href="#">Discovery</a>
        </section>
      <!-- end .nav -->
      </section>
    <!-- end .container -->
    </section>
  <!-- end .header__container -->
  </section>
</template>

<script>
// Default
export default {
}
</script>

<style lang="sass">
.main-header
  &__container
    background: #fff
  &__logo
    margin: 0 auto
    padding: 10px
    font-weight: bold
    font-size: 20px
  &__menu
    text-align: center
    padding: 5px 0
    &-container
      background: #f1f1f1
    &-item
      display: inline-block
</style>
