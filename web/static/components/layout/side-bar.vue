<template>
    <ul id="slide-out" class="side-nav fixed">
        <li class="logo">
            <router-link :to="{ name: 'home'}" id="logo-container" class="brand-logo">
                <object id="front-page-logo" type="image/svg+xml" data="http://materializecss.com/res/materialize.svg">Your browser does not support SVG</object>
            </router-link>
        </li>
        <li class="row">
            <div class="input-field col s12">
                <select v-model.lazy="filters.region" class="browser-default" v-on:change="onRegionChange">
            <option :value="undefined">Toutes Régions</option>
            <option v-for="reg in regionsList" :value="reg.id" v-if="reg.pet_count">{{ reg.name }} ({{ reg.pet_count }})</option>
          </select>
            </div>
        </li>
        <li class="row">
            <div class="input-field col s12">
                <select v-model.lazy="filters.species" class="browser-default" v-on:change="onSpeciesChange">
            <option :value="undefined">Toutes Espèces</option>
            <option v-for="spec in speciesList" :value="spec.id">{{ spec.name }} ({{ spec.pet_count }})</option>
          </select>
            </div>
        </li>
        <li class="row">
            <div class="input-field col s12">
                <select v-model.lazy="filters.race" class="browser-default" v-on:change="onRaceChange" :disabled="filters.species ? false : true">
            <option :value="undefined">Toutes Races</option>
            <option v-for="race in racesList" :value="race.id">{{ race.name }} ({{ race.pet_count }})</option>
          </select>
            </div>
        </li>
    </ul>
</template>
<script>
    let alphabetic = (a, b) => a.name.toLowerCase().localeCompare(b.name.toLowerCase());

    export default {
        props: ['updateSpecies', 'updateRegion', 'updateRace'],
        data() {
            return {
                filters: {
                    species: undefined,
                    region: undefined,
                    race: undefined
                },
                speciesList: [],
                racesList: [],
                regionsList: [],
            }
        },
        created() {
            this.resourceSpecies = this.$resource('species');
            this.resourceRaces = this.$resource('races');
            this.resourceRegions = this.$resource('regions');

            this.fetchData();
        },
        methods: {
            fetchData() {
                this.resourceSpecies.get(this.filters).then((resp) => {
                    this.speciesList = resp.body.data.sort(alphabetic);
                })

                this.resourceRegions.get(this.filters).then((resp) => {
                    this.regionsList = resp.body.data.sort(alphabetic);
                })

                this.resourceRaces.get(this.filters).then((resp) => {
                    this.racesList = resp.body.data.sort(alphabetic);
                })
            },
            onSpeciesChange() {
                this.filters.race = undefined;
                this.updateSpecies(this.filters.species);
                this.updateRace(undefined);
                this.fetchData();
            },
            onRegionChange() {
                this.updateRegion(this.filters.region);
                this.fetchData();
            },
            onRaceChange() {
                this.updateRace(this.filters.race);
                this.fetchData();
            }
        }
    }
</script>
<style>
    ul.side-nav.fixed li.logo {
        text-align: center;
        margin-top: 32px;
        margin-bottom: 80px;
    }
    
    ul.side-nav.fixed li {
        line-height: 44px;
    }
    
    ul.side-nav.fixed {
        overflow: hidden;
    }
    
    ul.side-nav.fixed li a {
        font-size: 13px;
        line-height: 44px;
        height: 44px;
        padding: 0 30px;
    }
    
    #logo-container {
        height: 57px;
        margin-bottom: 32px;
    }
    
    #front-page-logo {
        display: inline-block;
        height: 100%;
        pointer-events: none;
    }
    
    ul.side-nav.fixed li.logo #logo-container:hover {
        background-color: transparent;
    }
    
    ul.side-nav.fixed li.row {
        line-height: 1.5;
    }
</style>