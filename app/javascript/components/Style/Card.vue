<template>
  <div class="card-style">
    <div
      class="card-style__container"
      :class="`card-style__container--${styled}`"
    >
      <slot></slot>
    </div>
  </div>
</template>

<script >
export default {
  props: {
    styled: { type: String, default: "white" },
  },
};
</script>

<style lang="scss">
@import "../../../assets/stylesheets/variable";

.card-style {
  &__container {
    padding: 1rem;
    border-radius: 0.4rem;
    &--white {
      background: white;
      // @include themify($themes) {
      //   background-color: themed("containerBackgroundColor");
      // }
    }
    &--primary {
      background: $light-primary;
      // @include themify($themes) {
      //   background-color: themed("backgroundColor");
      // }
    }
  }
}
</style>