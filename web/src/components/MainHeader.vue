<template>
  <section class="main-header__container">
    <section class="container"> 
      <section class="columns is-mobile">
        <section class="column is-narrow">
          <button class="button main-header__open">Button</button>
        </section>
        <section class="column">
          <section class="main-header__title">
            Home
          </section>
        </section>
      <!-- end .columns -->
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
    background: #eaeaea
    padding: 5px 0
    border-bottom: 1px solid #bdbdbd
  &__open
    background: #000
  &__title
    text-align: center
</style>
