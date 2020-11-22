<template>
  <div class="horizontal-bar">
    <div class="horizontal-bar__content">
      <router-link tag="div" to="/" class="logo"> Car Park </router-link>
      <router-link to="/contact" class="contact"> Contact </router-link>
    </div>
  </div>
</template>

<script>
export default {};
</script>

<style lang="scss">
.horizontal-bar {
  .contact {
    font-size: 1.4rem;
    // cursor
  }
  z-index: 5;
  position: fixed;
  top: 0;
  left: 0;
  height: 4rem;
  width: 100%;
  display: flex;
  background: white;
  align-items: center;
  border-bottom-left-radius: 1.5rem;
  border-bottom-right-radius: 1.5rem;
  box-shadow: (
    rgba(0, 0, 0, 0) 0px 0px 0px 0px,
    rgba(0, 0, 0, 0) 0px 0px 0px 0px,
    rgba(0, 0, 0, 0.12) 0px 1px 1px 0px,
    rgba(60, 66, 87, 0.16) 0px 0px 0px 1px,
    rgba(0, 0, 0, 0) 0px 0px 0px 0px,
    rgba(0, 0, 0, 0) 0px 0px 0px 0px,
    rgba(60, 66, 87, 0.08) 0px 2px 5px 0px
  );
  &__content {
    display: flex;
    width: 100%;
    justify-content: space-between;
    align-items: center;
    padding: 0 1rem;
  }
}
</style>
