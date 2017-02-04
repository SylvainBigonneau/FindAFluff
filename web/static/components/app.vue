<template>
  <div>
    <SideBar :filters="filters" />
    <AppHeader />
    <main>
      <div class="container">
        <router-view :update-filters="updateFilters"></router-view>
      </div>
    </main>
    <AppFooter />
  </div>
</template>
<script>
  import AppHeader from './layout/app-header.vue'
  import AppFooter from './layout/app-footer.vue'
  import SideBar from './layout/side-bar.vue'
  export default {
    components: {
      AppHeader,
      AppFooter,
      SideBar
    },
    data() {
      return {
        filters: {}
      }
    },
    created() {
      this.filters = this.$route.query;
    },
    methods: {
      updateFilters(val) {
        this.filters = val;
      }
    }
  }
</script>
<style>
  header,
  main,
  footer {
    padding-left: 300px;
  }
  
  footer.page-footer {
    background: none;
  }
  
  @media only screen and (max-width: 992px) {
    header,
    main,
    footer {
      padding-left: 0;
    }
  }
  
  @media only screen and (min-width: 993px) {
    .container {
      width: 85%;
    }
  }
</style>