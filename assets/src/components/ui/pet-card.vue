<template>
    <a :title="pet.name" class="pet-card">
        <div class="card medium hoverable" v-on:click="triggerModal">
            <div class="card-image valign-wrapper" v-bind:style="`background-image:url(${pet.img_url || 'http://placehold.it/450x320/000000/ffffff?text=Photo+introuvable'})`"></div>
            <div class="card-content">
                <span class="card-title truncate grey-text text-darken-4"><i class="fa" :class="genderClasses"></i> {{ pet.name }}</span>
                <div class="chip" v-if="pet.race_details">
                    {{ pet.race_details }}
                </div>
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
            },
            genderClasses() {
                return this.pet.gender === 'M' ? 'fa-mars blue-text' : 'fa-venus pink-text';
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
    
    .pet-card .card.medium {
        border-radius: 15px;
    }

    .card-title {
        text-transform: capitalize;
    }
    
    .pet-card .card.medium .card-content {
        max-height: 28%;
    }
    
    .pet-card .card.medium .card-image {
        border-radius: 15px 15px 0 0;
        height: 72%;
        max-height: 72%;
        background: #000;
        top: 0;
        left: 0;
        bottom: 0;
        right: 0;
        background-size: cover;
        background-repeat: no-repeat;
        background-position: 50% 50%;
    }
    
    .pet-card .chip {
        height: 25px;
        line-height: 25px;
        padding: 0 8px;
        overflow: hidden;
        max-width: 135px;
        text-overflow: ellipsis;
        white-space: nowrap;
    }
    
    .pet-card a.modal-close {
        cursor: pointer;
    }
</style>