// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

// import socket from "./socket"

import Vue from 'vue'
import VueRouter from 'vue-router'
import VueResource from 'vue-resource'

import App from "../components/app.vue"
import Home from "../components/pages/home.vue"
import View from "../components/pages/view.vue"

Vue.use(VueRouter)
Vue.use(VueResource)

Vue.http.options.root = '/api'

// Create the main component
Vue.component('app', App)

const router = new VueRouter({
    routes: [{
        name: 'home',
        path: '/',
        component: Home
    }, {
        path: '/pets/:id',
        name: 'viewPet',
        component: View,
        props: true
    }]
});

// And create the top-level view model:
new Vue({
    el: '#app',
    router,
    render(createElement) {
        return createElement(App, {})
    }
});