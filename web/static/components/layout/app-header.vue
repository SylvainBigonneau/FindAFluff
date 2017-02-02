<template>
    <header class="navbar-fixed">
        <nav class="purple darken-4">
            <div class="nav-wrapper container">
                <a href="#" data-activates="slide-out" class="button-collapse top-nav waves-effect waves-light circle hide-on-large-only"><i class="material-icons">menu</i></a>
                <a href="/" class="brand-logo">
                    Chien ou Chat
                </a>
            </div>
        </nav>
    </header>
</template>
<script>
    export default {
        mounted() {
            $(document).ready(() => {
                $('.button-collapse').sideNav();
            });
        }
    }
</script>
<style>
    .navbar-fixed nav {
        /* width is 100% minus the fixed left navbar (240px) */
        width: -moz-calc(100% - 300px);
        /* Firefox */
        width: -webkit-calc(100% - 300px);
        /* Chrome, Safari */
        width: calc(100% - 300px);
        /* IE9+ and future browsers */
    }
    
    @media only screen and (max-width: 992px) {
        /* width is 100% because the fixed left navbar is not displayed */
        .navbar-fixed nav {
            width: 100%
        }
    }
</style>