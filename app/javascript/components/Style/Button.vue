<template>
  <button
    @click.prevent="$emit('click')"
    class="button"
    :class="`button--${color} button--${type} button--${size} ${
      shadow ? 'button--shadow' : ''
    }`"
  >
    <slot></slot>
  </button>
</template>

<script >
export default {
  props: {
    color: {
      type: String,
      default: "primary",
    },
    type: String,
    icon: String,
    size: String,
    shadow: Boolean,
  },
};
</script>

<style lang="scss">
@import "../../../assets/stylesheets/variable";

.button {
  display: flex;
  align-items: center;
  justify-content: center;
  font-weight: bold;
  white-space: nowrap;
  &--primary {
    background: $primary;
    color: white;
  }
  &--secondary {
    background: $secondary;
    color: white;
  }
  &--green {
    background: $success;
    color: white;
  }
  &--very_round {
    border-radius: 100px;
  }
  &--round {
    border-radius: 5px;
  }
  &--normal {
    height: 3.5rem;
    padding: 0 2.5rem;
    font-size: 1.6rem;
    // width: 100px;
  }
  &--shadow {
    box-shadow: rgba(0, 0, 0, 0) 0px 0px 0px 0px,
      rgba(0, 0, 0, 0) 0px 0px 0px 0px, rgba(0, 0, 0, 0.12) 0px 1px 1px 0px,
      rgba(60, 66, 87, 0.16) 0px 0px 0px 1px, rgba(0, 0, 0, 0) 0px 0px 0px 0px,
      rgba(0, 0, 0, 0) 0px 0px 0px 0px, rgba(60, 66, 87, 0.08) 0px 2px 5px 0px;
    // @include themify($themes) {
    //   box-shadow: themed("smallBoxShadow");
    // }
  }
  &--small {
    height: 3rem;
    padding: 0 2rem;
    font-size: 1.4rem;
    white-space: nowrap;
    // width: 100px;
  }
  &--big {
    height: 4rem;
    padding: 0 3rem;
    font-size: 1.8rem;
    // width: 100px;
  }
}
</style>
