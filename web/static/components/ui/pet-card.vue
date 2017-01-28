<template>
    <div class="card medium hoverable">
        <div class="card-image valign-wrapper">
            <img class="valign" v-bind:src="pet.img_url">
        </div>
        <div class="card-content">
            <router-link :to="{ name: 'viewPet', params: { id: pet.id }}" class="card-title grey-text text-darken-4">{{ pet.name }}</router-link>
            <p class="bold">{{ pet.species.name }}</p>
            <p class="bold">{{ pet.age || "Moins d'1" }} an{{ pet.age > 1 ? 's' : ''}}</p>
            <p class="bold">{{ pet.gender === 'M' ? 'Male' : 'Femelle' }}</p>
            <p class="bold">{{ pet.race_details }}</p>
        </div>
    </div>
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
.card-title {
    text-transform: capitalize;
}
</style>