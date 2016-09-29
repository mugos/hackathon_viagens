<template>
  <section class="column is-narrow">
    <div class="card profile__card">
      <div class="card-content profile__card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-32x32">
              <img src="http://placehold.it/64x64" alt="Image">
            </figure>
          </div>
          <div class="media-content profile__card-media-content">
            <p class="title is-5">{{ profile.name }}</p>
            <p class="subtitle is-6">@{{ profile.nickname }}</p>
          </div>
        </div>
        <div class="content">
          {{ profile.desc }}
          <div class="profile__tags">
            <span v-for="tag in profile.tags" class="tag is-dark is-small">{{ tag }}</span>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
// Import components
import MessageBox from './MessageBox'

// Default
export default {
  //
  props: {
    profile: Object
  },
  components: {
    MessageBox
  }
}
</script>

<style lang="sass">
.profile
  &__card
    cursor: pointer
    &--selected
      background: #F44336
      color: #fff
  &__tags
    margin: 5px 0 0
    .tag
      margin: 0 3px
</style>
