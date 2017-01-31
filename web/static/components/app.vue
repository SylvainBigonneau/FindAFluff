<template>
  <div>
    <SideBar :update-species="updateSpecies" :update-region="updateRegion" :update-race="updateRace" />
    <main>
      <AppHeader />
      <div class="container">
        <Home :species="species" :race="race" :region="region" />
      </div>
    </main>
    <footer class="page-footer">
      <div class="container">
        <div class="row">
          <div class="center-align">Icons made by <a href="http://www.freepik.com" title="Freepik">Freepik</a> from <a href="http://www.flaticon.com"
              title="Flaticon">www.flaticon.com</a> is licensed by <a href="http://creativecommons.org/licenses/by/3.0/" title="Creative Commons BY 3.0"
              target="_blank">CC 3.0 BY</a></div>
        </div>
      </div>
    </footer>
  </div>
</template>
<script>
  import AppHeader from './layout/app-header.vue'
  import SideBar from './layout/side-bar.vue'
  import Home from './pages/home.vue'
  export default {
    components: {
      AppHeader,
      Home,
      SideBar
    },
    data() {
      return {
        species: null,
        region: null,
        race: null
      }
    },
    methods: {
      updateSpecies(val) {
        this.species = val;
      },
      updateRace(val) {
        this.race = val;
      },
      updateRegion(val) {
        this.region = val;
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
    background: none!important;
  }
  
  @media only screen and (max-width: 992px) {
    header,
    main,
    footer {
      padding-left: 0;
    }
  }
</style>