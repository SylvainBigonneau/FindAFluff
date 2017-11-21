<template>
    <header class="navbar-fixed">
        <nav>
            <div class="nav-wrapper container">
                <a href="#" data-activates="slide-out" class="button-collapse top-nav hide-on-large-only"><i class="fa fa-bars fa-2x"></i></a>
                <a href="/" class="brand-logo">
                                <img src="images/pet-friendly-white.svg" class="brand-image" />
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
      $(".button-collapse").sideNav();
    });
  }
};
</script>
<style scoped>

.navbar-fixed nav {
  /* width is 100% minus the fixed left navbar (240px) */
  width: -moz-calc(100% - 300px);
  /* Firefox */
  width: -webkit-calc(100% - 300px);
  /* Chrome, Safari */
  width: calc(100% - 300px);
  /* IE9+ and future browsers */
  background-color: #994d00;
}

.navbar-fixed nav .brand-logo {

}

@media (max-width: 992px) {
  /* width is 100% because the fixed left navbar is not displayed */
  .navbar-fixed nav {
    width: 100%;
  }
}

nav .button-collapse i {
  color: #fff3e0;
}

.brand-logo {
  font-family: "Comfortaa", cursive;
  color: #fff3e0;
}

.brand-image {
  height: 50px;
  margin-bottom: -14px;
}

@media (max-width: 460px) {
  .brand-logo {
    font-size: 20px !important;
    width: 200px;
    left: 55% !important;
  }

  .brand-image {
    height: 36px;
    margin-bottom: -10px;
  }
}

@media (min-width: 461px) {
  .brand-logo {
    min-width: 282px;
  }
}

</style>