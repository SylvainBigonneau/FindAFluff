<template>
    <div>
        <div class="row">
            <h5>Animaux ({{ count }})</h5>
            <div class="col s12 m6 l4" v-for="pet in pets">
                <PetCard v-bind:pet="pet" />
            </div>
            <div class="white-text" v-infinite-scroll="loadMore" infinite-scroll-disabled="busy" infinite-scroll-distance="10">.</div>
        </div>
        <div class="row center-align">
            <div class="preloader-wrapper" v-bind:class="{ active: preloading }">
                <div class="spinner-layer spinner-blue">
                    <div class="circle-clipper left">
                        <div class="circle"></div>
                    </div>
                    <div class="gap-patch">
                        <div class="circle"></div>
                    </div>
                    <div class="circle-clipper right">
                        <div class="circle"></div>
                    </div>
                </div>
                <div class="spinner-layer spinner-red">
                    <div class="circle-clipper left">
                        <div class="circle"></div>
                    </div>
                    <div class="gap-patch">
                        <div class="circle"></div>
                    </div>
                    <div class="circle-clipper right">
                        <div class="circle"></div>
                    </div>
                </div>
                <div class="spinner-layer spinner-yellow">
                    <div class="circle-clipper left">
                        <div class="circle"></div>
                    </div>
                    <div class="gap-patch">
                        <div class="circle"></div>
                    </div>
                    <div class="circle-clipper right">
                        <div class="circle"></div>
                    </div>
                </div>
                <div class="spinner-layer spinner-green">
                    <div class="circle-clipper left">
                        <div class="circle"></div>
                    </div>
                    <div class="gap-patch">
                        <div class="circle"></div>
                    </div>
                    <div class="circle-clipper right">
                        <div class="circle"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
    import PetCard from '../ui/pet-card.vue'

    export default {
        components: {
            PetCard
        },
        props: ['updateFilters'],
        data() {
            return {
                pets: [],
                count: 0,
                preloading: false
            }
        },
        created() {
            this.resource = this.$resource('pets{/id}');
            // fetch the data when the view is created and the data is
            // already being observed
            this.fetchData();
        },
        watch: {
            // call again the method if the route changes
            $route() {
                this.updateFilters(this.$route.query);
                this.fetchData();
            }
        },
        methods: {
            fetchData() {
                this.preloading = true;
                this.resource.get({
                    offset: 0,
                    race: this.$route.query.race || undefined,
                    species: this.$route.query.species || undefined,
                    region: this.$route.query.region || undefined,
                    photo: this.$route.query.photo
                }).then((response) => {
                    this.pets = response.body.pets;
                    this.count = response.body.count;
                }).finally(() => {
                    this.preloading = false;
                });
            },
            loadMore() {
                if (this.pets.length < this.count && !this.preloading) {
                    this.preloading = true;
                    this.resource.get({
                        offset: this.pets.length,
                        race: this.$route.query.race || undefined,
                        species: this.$route.query.species || undefined,
                        region: this.$route.query.region || undefined,
                        photo: this.$route.query.photo
                    }).then((response) => {
                        this.pets = this.pets.concat(response.body.pets);
                        this.count = response.body.count;
                    }).finally(() => {
                        this.preloading = false;
                    });
                }
            }
        }
    }
</script>