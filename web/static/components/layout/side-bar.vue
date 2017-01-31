<template>
    <ul id="slide-out" class="side-nav fixed">
        <li class="logo">
            <router-link :to="{ name: 'home'}" id="logo-container" class="brand-logo">
                <object id="front-page-logo" type="image/svg+xml" data="http://materializecss.com/res/materialize.svg">Your browser does not support SVG</object>
            </router-link>
        </li>
        <li class="row">
            <div class="input-field col s12">
                <select v-model.lazy="regionVal" class="browser-default" v-on:change="onRegionChange">
            <option :value="null">Toutes Régions</option>
            <option v-for="reg in regionsList" :value="reg.id">{{ reg.name }}</option>
          </select>
            </div>
        </li>
        <li class="row">
            <div class="input-field col s12">
                <select v-model.lazy="speciesVal" class="browser-default" v-on:change="onSpeciesChange">
            <option :value="null">Toutes Espèces</option>
            <option v-for="spec in speciesList" :value="spec.id">{{ spec.name }}</option>
          </select>
            </div>
        </li>
        <li class="row">
            <div class="input-field col s12">
                <select v-model.lazy="raceVal" class="browser-default" v-on:change="onRaceChange">
            <option :value="null">Toutes Races</option>
            <option v-for="race in racesList" :value="race.id">{{ race.name }}</option>
          </select>
            </div>
        </li>
    </ul>
</template>
<script>
    export default {
        props: ['updateSpecies', 'updateRegion', 'updateRace'],
        data() {
            return {
                speciesVal: null,
                speciesList: [],
                regionVal: null,
                regionsList: [],
                raceVal: null
            }
        },
        created() {
            let resourceSpecies = this.$resource('species');

            resourceSpecies.get().then((resp) => {
                this.speciesList = resp.body.data;
            })
            let resourceRegions = this.$resource('regions');

            resourceRegions.get().then((resp) => {
                this.regionsList = resp.body.data;
            })
        },
        computed: {
            racesList() {
                if (this.speciesVal) {
                    return this.speciesList.find((spec) => spec.id === this.speciesVal).races.sort((a, b) => a.name.toLowerCase().localeCompare(b.name.toLowerCase()));
                }
                return [];
            }
        },
        updated() {
            $('select').material_select();
        },
        mounted() {
            $(document).ready(() => {
                $('select').material_select();
            });
        },
        methods: {
            onSpeciesChange() {
                this.updateSpecies(this.speciesVal);
            },
            onRegionChange() {
                this.updateRegion(this.regionVal);
            },
            onRaceChange() {
                this.updateRace(this.raceVal);
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