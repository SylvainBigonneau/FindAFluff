<template>
    <div>
        <h5>{{ pet.name }}</h5>
        <div class="row">
            <div class="col">
                <img class="responsive-img" v-bind:src="pet.img_url || 'http://placehold.it/320x450/000000/ffffff?text=Photo+introuvable'">
            </div>
            <div class="col">
                <p><span class="bold">Éspèce :</span> {{ pet.species && pet.species.name }}</p>
                <p><span class="bold">Sexe :</span> {{ pet.gender === 'M' ? 'Male' : 'Femelle' }}</p>
                <p><span class="bold">Race :</span> {{ pet.race && pet.race.name }}</p>
                <p><span class="bold">Région :</span> {{ pet.shelter && pet.shelter.region.name }}</p>
                <p><span class="bold">Refuge :</span> {{ pet.shelter && pet.shelter.name }}</p>
                <p class="bold"><a v-bind:href="pet.link" target="_blank">Page d'adoption</a></p>
            </div>
        </div>
    </div>
</template>
<script>
    import Vue from 'vue'

    export default {
        props: ['id'],
        data() {
            return {
                pet: {}
            }
        },
        beforeRouteEnter(to, from, next) {
            let resource = Vue.resource('pets{/id}');
            resource.get({
                id: to.params.id
            }).then((response) => {
                next(vm => {
                    vm.pet = response.body.data;
                })
            });
        },
        watch: {
            $route() {
                this.pet = {};
                let resource = this.$resource('pets{/id}');
                resource.get({
                    id: this.id
                }).then((response) => {
                    this.pet = response.body.data;
                });
            }
        }
    }
</script>