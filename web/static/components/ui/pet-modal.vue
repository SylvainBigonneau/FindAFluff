<template>
    <div class="modal-content">
        <h5>{{ pet.name }}</h5>
        <div class="row">
            <div class="col m6">
                <img class="responsive-img" v-bind:src="pet.img_url || 'http://placehold.it/450x350/000000/ffffff?text=Photo+introuvable'">
            </div>
            <div class="col m6">
                <p><span class="bold">Éspèce :</span> {{ pet.species && pet.species.name }}</p>
                <p><span class="bold">Sexe :</span> {{ pet.gender === 'M' ? 'Male' : 'Femelle' }}</p>
                <p><span class="bold">Age :</span> {{ pet.age || "Moins d'1" }} an{{ pet.age > 1 ? 's' : ''}}</p>
                <p><span class="bold">Race :</span> {{ pet.race_details }}</p>
                <p><span class="bold">Région :</span> {{ pet.shelter && pet.shelter.region.name }}</p>
                <p><span class="bold">Refuge :</span> {{ pet.shelter && pet.shelter.name }}</p>
                <p class="bold"><a v-bind:href="pet.link" target="_blank">Page d'adoption</a></p>
            </div>
        </div>
    </div>
</template>
<script>
    export default {
        props: ['pet']
    }
</script>