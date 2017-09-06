<template>
  <div id="layout">
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
  import AppHeader from './components/layout/app-header.vue'
  import AppFooter from './components/layout/app-footer.vue'
  import SideBar from './components/layout/side-bar.vue'
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
      if (this.filters.photo === 'false') {
        this.filters.photo = false;
      }
      if (!this.filters.age) {
        this.filters.age = 10;
      }
    },
    methods: {
      updateFilters(val) {
        if (val.photo === 'false') {
          val.photo = false;
        }
        this.filters = val;
      }
    }
  }
</script>
<style>
  html, body {
    height: 100%;
  }

  #layout {
    position: relative;
    min-height: 100%;
  }

  header,
  main,
  footer {
    padding-left: 300px;
  }

  footer {
    position: absolute;
    bottom: 0;
    width: 100%;
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