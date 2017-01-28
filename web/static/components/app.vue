<template>
  <div>
    <AppHeader />

    <div class="container">

      <p class="alert alert-info" role="alert"></p>
      <p class="alert alert-danger" role="alert"></p>

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