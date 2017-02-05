<template>
    <ul id="slide-out" class="side-nav fixed">
        <li class="logo">
            <a href="/" id="logo-container" class="brand-logo">
                <object id="front-page-logo" type="image/svg+xml" data="images/pet-friendly.svg">Your browser does not support SVG</object>
            </a>
        </li>
        <li class="row">
            <div class="col s12">
                <label>Région</label>
                <div class="input-field">
                    <select v-model.lazy="filters.region" class="browser-default" v-on:change="onFilterChange" :disabled="lock">
            <option :value="undefined">Toutes Régions</option>
            <option v-for="reg in regionsList" :value="reg.id" v-if="reg.pet_count">{{ reg.name }} ({{ reg.pet_count }})</option>
          </select>
                </div>
            </div>
        </li>
        <li class="row">
            <div class="col s12">
                <label>Espèce</label>
                <div class="input-field">
                    <select v-model.lazy="filters.species" class="browser-default" v-on:change="onSpeciesChange" :disabled="lock">
            <option :value="undefined">Toutes Espèces</option>
            <option v-for="spec in speciesList" :value="spec.id">{{ spec.name }} ({{ spec.pet_count }})</option>
          </select>
                </div>
            </div>
        </li>
        <li class="row">
            <div class="col s12">
                <label>Race</label>
                <div class="input-field">
                    <select v-model.lazy="filters.race" class="browser-default" v-on:change="onFilterChange" :disabled="lock || !filters.species">
            <option :value="undefined">Toutes Races</option>
            <option v-for="race in racesList" :value="race.id">{{ race.name }} ({{ race.pet_count }})</option>
          </select>
                </div>
            </div>
        </li>
        <li class="row">
            <div class="col s12">
                <label>Age Max : {{compAge}}</label>
                <div class="input-field">
                    <p class="range-field">
                        <input type="range" v-model.lazy="filters.age" v-on:change="onFilterChange" id="age" min="1" max="10" />
                    </p>
                </div>
            </div>
        </li>
        <li class="row">
            <div class="input-field col s12 photo">
                <input v-model="filters.photo" type="checkbox" v-on:change="onFilterChange" id="photo" />
                <label for="photo">Photo fournie</label>
            </div>
        </li>
    </ul>
</template>
<script>
    let alphabetic = (a, b) => a.name.toLowerCase().localeCompare(b.name.toLowerCase());

    export default {
        props: ['filters'],
        data() {
            return {
                speciesList: [],
                racesList: [],
                regionsList: [],
                lock: false
            }
        },
        created() {
            this.resourceSpecies = this.$resource('species');
            this.resourceRaces = this.$resource('races');
            this.resourceRegions = this.$resource('regions');
            this.fetchData();
        },
        watch: {
            filters() {
                this.fetchData();
            }
        },
        computed: {
            compAge() {
                return this.filters.age < 10 ? this.filters.age : '10+';
            }
        },
        methods: {
            fetchData() {
                this.lock = true;
                let saveFilters = Object.assign({}, this.filters);
                saveFilters.age = saveFilters.age < 10 ? saveFilters.age : undefined;
                return this.resourceSpecies.get(saveFilters).then((resp) => {
                        this.speciesList = resp.body.data.sort(alphabetic);
                    })
                    .finally(() => {
                        return this.resourceRegions.get(saveFilters).then((resp) => {
                                this.regionsList = resp.body.data.sort(alphabetic);
                            })
                            .finally(() => {
                                return this.resourceRaces.get(saveFilters).then((resp) => {
                                        this.racesList = resp.body.data.sort(alphabetic);
                                    })
                                    .finally(() => {
                                        return this.lock = false;
                                    })
                            });

                    });
            },
            onSpeciesChange() {
                delete this.filters.race;
                this.onFilterChange();
            },
            onFilterChange() {
                let saveFilters = Object.assign({}, this.filters);
                this.$router.push({
                    name: 'home'
                });
                this.$router.replace({
                    name: 'home',
                    query: {
                        species: saveFilters.species,
                        region: saveFilters.region,
                        race: saveFilters.race,
                        photo: saveFilters.photo,
                        age: saveFilters.age
                    }
                })
            },
        }
    }
</script>
<style>
    ul.side-nav.fixed li.logo {
        text-align: center;
        margin-top: 32px;
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
        height: 70px;
        margin-bottom: 19px;
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
    ul.side-nav.fixed li.row .photo {
        margin-top: 0;
    }
    
</style>