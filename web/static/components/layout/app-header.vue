<template>
    <div class="navbar-fixed">
        <nav class="purple darken-4">
            <div class="nav-wrapper container">
                <a href="#" data-activates="slide-out" class="button-collapse top-nav waves-effect waves-light circle hide-on-large-only"><i class="material-icons">menu</i></a>
                <a href="/" class="brand-logo">
                    Chien ou Chat
                </a>
            </div>
        </nav>
    </div>
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