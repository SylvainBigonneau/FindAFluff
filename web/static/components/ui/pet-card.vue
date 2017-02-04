<template>
    <a :title="pet.name" class="pet-card">
        <div class="card medium hoverable" v-on:click="triggerModal">
            <div class="card-image valign-wrapper">
                <img class="valign" v-bind:src="pet.img_url || 'http://placehold.it/450x320/000000/ffffff?text=Photo+introuvable'">
            </div>
            <div class="card-content">
                <span class="card-title truncate grey-text text-darken-4">{{ pet.name }}</span>
                <div class="chip">
                    {{ pet.species && pet.species.name }}
                </div>
                <div class="chip">{{ pet.gender === 'M' ? 'Male' : 'Femelle' }}</div>
                <div class="chip" v-if="pet.birthdate">
                    {{ age || "Moins d'1" }} an{{ age > 1 ? 's' : '' }}
                </div>
            </div>
        </div>
        <div :id="'modal' + pet.id" class="modal  modal-fixed-footer">
            <PetModal :pet="pet" />
            <div class="modal-footer">
                <a class="modal-action modal-close waves-effect waves-green btn-flat">Fermer</a>
            </div>
        </div>
    </a>
</template>
<script>
    import PetModal from './pet-modal.vue'

    export default {
        components: {
            PetModal
        },
        props: ['pet'],
        mounted() {
            $(`#modal${this.pet.id}`).modal();
        },
        computed: {
            age() {
                let age = Math.floor((new Date() - new Date(this.pet.birthdate)) / 31557600000);
                return age;
            }
        },
        methods: {
            triggerModal() {
                $(`#modal${this.pet.id}`).modal('open');
            }
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
        cursor: pointer;
    }
    
    .card-title {
        text-transform: capitalize;
    }
    
    .pet-card .card.medium .card-content {
        max-height: 28%;
    }
    
    .pet-card .card.medium .card-image {
        height: 72%;
        max-height: 72%;
        background: #000;
    }
    
    .pet-card .chip {
        height: 25px;
        line-height: 25px;
        padding: 0 8px;
    }

    .pet-card a.modal-close {
        cursor: pointer;
    }
</style>