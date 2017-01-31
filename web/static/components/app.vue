<template>
  <div>
    <SideBar :update-species="updateSpecies" :update-region="updateRegion" :update-race="updateRace" />
    <main>
      <AppHeader />
      <div class="container">
        <router-view keep-alive :species="species" :race="race" :region="region"></router-view>
      </div>
    </main>
  </div>
</template>
<script>
  import AppHeader from './layout/app-header.vue'
  import SideBar from './layout/side-bar.vue'
  export default {
    components: {
      AppHeader,
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
  
  @media only screen and (max-width: 992px) {
    header,
    main,
    footer {
      padding-left: 0;
    }
  }
</style>