<template>
  <section class="course-page__container">
    Hello from course page
  <!-- end .course-page__container -->
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
</style>
