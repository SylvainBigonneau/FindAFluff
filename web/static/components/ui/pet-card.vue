<template>
    <router-link :to="{ name: 'viewPet', params: { id: pet.id }}" :title="pet.name" class="pet-card">
        <div class="card medium hoverable">
            <div class="card-image valign-wrapper">
                <img class="valign" v-bind:src="pet.img_url || 'http://placehold.it/450x320/000000/ffffff?text=Photo+introuvable'">
            </div>
            <div class="card-content">
                <span class="card-title truncate grey-text text-darken-4">{{ pet.name }}</span>
                <div class="chip">
                    {{ pet.species && pet.species.name }}
                </div>
                <div class="chip">
                    {{ pet.age || "Moins d'1" }} an{{ pet.age > 1 ? 's' : ''}}
                </div>
                <div class="chip">{{ pet.gender === 'M' ? 'Male' : 'Femelle' }}</div>
                <p class="bold">{{ pet.race_details }}</p>
                <p><span class="bold">Refuge :</span> {{ pet.shelter && pet.shelter.name }} ({{ pet.shelter && pet.shelter.region && pet.shelter.region.name }})</p>
            </div>
        </div>
    </router-link>
</template>
<script>
    export default {
        props: ['pet'],
        created() {
            this.pet.age = ~~((Date.now() - new Date(this.pet.birthdate)) / (31557600000));
        }
    }
</script>
<style>
    .bold {
        font-weight: bold;
    }
    
    .pet-card,
    .pet-card:hover {
        text-decoration: none;
        color: rgb(51, 51, 51);
    }
    
    .card-title {
        text-transform: capitalize;
    }
    .pet-card .card.medium .card-content {
        max-height: 60%!important;
    }
    .pet-card .card.medium .card-image {
        max-height: 40%!important;
    }
</style>