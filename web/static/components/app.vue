<template>
  <div>
    <AppHeader />

    <div class="container">
      <router-view></router-view>
    </div>
  </div>
</template>

<script>
import AppHeader from './layout/app-header.vue'
export default {
  components: {AppHeader}
}
</script>