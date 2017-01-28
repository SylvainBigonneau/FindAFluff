<template>
    <div>
        <h5>{{ pet.name }}</h5>
        <div class="row">
            <div class="col">
                <img class="responsive-img" v-bind:src="pet.img_url">
            </div>
            <div class="col">
                <p class="bold">{{ pet.gender === 'M' ? 'Male' : 'Femelle' }}</p>
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