<template>
    <div class="row">
        <h5>Pets ({{ count }})</h5>
        <div class="col s12 m6 l4" v-for="pet in pets">
            <PetCard v-bind:pet="pet" />
        </div>
        <div v-infinite-scroll="loadMore" infinite-scroll-disabled="busy" infinite-scroll-distance="10">
            ...
        </div>
    </div>
</template>
<script>
    import PetCard from '../ui/pet-card.vue'

    export default {
        components: {
            PetCard
        },
        props: ['species', 'region', 'race'],
        data() {
            return {
                pets: [],
                count: 0
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
            '$route': 'fetchData',
            'species': 'fetchData',
            'region': 'fetchData',
            'race': 'fetchData'
        },
        methods: {
            fetchData() {
                this.resource.get({offset: 0, race: this.race || undefined, species: this.species || undefined, region: this.region || undefined}).then((response) => {
                    this.pets = response.body.pets;
                    this.count = response.body.count;
                });
            },
            loadMore() {
                this.resource.get({offset: this.pets.length, race: this.race || undefined, species: this.species || undefined, region: this.region || undefined}).then((response) => {
                    this.pets = this.pets.concat(response.body.pets);
                    this.count = response.body.count;
                });
            }
        }
    }
</script>