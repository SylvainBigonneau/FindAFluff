<template>
    <div class="row">
        <div class="col s12 m6 l3" v-for="pet in pets">
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
        data() {
            return {
                pets: [],
                fullPets: []
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
            '$route': 'fetchData'
        },
        methods: {
            fetchData() {
                this.resource.get().then((response) => {
                    this.fullPets = response.body.data;
                    this.pets = this.fullPets.slice(0, 12);
                });
            },
            loadMore: function () {
                let start = this.pets.length;
                this.pets = this.pets.concat(this.fullPets.slice(start, start + 12));
            }
        }
    }
</script>