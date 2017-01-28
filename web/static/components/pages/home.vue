<template>
    <div>
        <h5>Pets</h5>
        <ul class="collection">
            <li class="collection-item" v-for="pet in pets">
                <router-link :to="{ name: 'viewPet', params: { id: pet.id }}">{{ pet.name }}</router-link>
            </li>
        </ul>
    </div>
</template>

<script>
    export default {
        data() {
            return {
                pets: []
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
                    this.pets = response.body.data;
                });
            }
        }
    }
</script>
