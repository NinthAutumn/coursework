<template>
  <input :class="`${size} ${theme}`" />
</template>

<script >
export default {
  props: {
    customStyle: {
      default: () => {},
      type: Object,
    },
    size: {
      type: String,
      default: "normal",
    },
    theme: {
      type: String,
      default: "white",
    },
  },
};
</script>

<style lang="scss">
@import "../../../assets/stylesheets/variable";

input.normal {
  height: 4rem;
  font-size: 1.5rem;
  width: 100%;
  padding: 0 1.2rem;
  border-radius: 0.5rem;
  &:active,
  &:focus {
    border-radius: 0.5rem;
  }
}
input.white {
  // background:white;
  // border: 1px solid rgb(173, 173, 173);
  background-color: white;
  box-shadow: rgba(0, 0, 0, 0) 0px 0px 0px 0px, rgba(0, 0, 0, 0) 0px 0px 0px 0px,
    rgba(0, 0, 0, 0) 0px 0px 0px 0px, rgba(60, 66, 87, 0.16) 0px 0px 0px 1px,
    rgba(0, 0, 0, 0) 0px 0px 0px 0px, rgba(0, 0, 0, 0) 0px 0px 0px 0px,
    rgba(0, 0, 0, 0) 0px 0px 0px 0px;
  // @include themify($themes) {
  //   background-color: themed("containerBackgroundColor");
  //   box-shadow: themed("verySmallBoxShadow");
  //   // box-shadow: themed('smallBoxShadow');
  // }
}
input.primary {
  border: 1px solid rgb(247, 247, 247);
  background-color: $light-primary;
  // @include themify($themes) {
  //   background-color: themed("backgroundColor");
  // }
}
input {
  border: none;
  box-sizing: border-box;
  margin-bottom: 1rem;
  margin-top: 0.5rem;
  &:active,
  &:focus {
    outline: 0;
  }
}
</style>
