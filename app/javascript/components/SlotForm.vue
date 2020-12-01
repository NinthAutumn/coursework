<template>
  <div class="dialog dialog__container">
    <div class="dialog__content">
      <div class="slot-farm">
        <div class="slot-farm__name">
          {{ `${parkSlot.width}cm x ${parkSlot.height}cm` }}
        </div>
        <div class="slot-farm__price">{{ `$${parkSlot.price}` }}</div>
        <div class="flex-divider">
          <div
            class="slot-farm__button button button--small button--primary button--pill"
            @click="handleSlot"
          >
            Book a Slot
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    parkSlot: {
      type: Object,
      default: () => ({}),
    },
  },
  async mounted() {
    if (this.parkSlot.id) {
      console.log("SSS");
    }
  },
  // data: () => ({
  //   parkSlot: {
  //     price: 100,
  //     id: 12,
  //     width: 100,
  //     height: 50,
  //   },
  // }),
};
</script>

<style lang="scss">
.slot-farm {
  width: 25rem;
  .flex-divider {
    display: flex;
    justify-content: flex-end;
  }
  &__name {
    font-size: 1.8rem;
  }
  &__price {
    font-size: 1.6rem;
    text-align: right;
  }
  &__button {
    text-align: center;
    cursor: pointer;
    user-select: none;
  }
}
.dialog {
  $self: &;

  @media screen and (max-width: 450px) {
    body {
      height: 100%;
    }

    &__content {
      width: 100% !important;
      height: 100% !important;
      padding: 1rem !important;
      border-radius: 0 !important;
    }
  }

  &--disabled {
    visibility: hidden;
    transition: 300ms;
  }

  &__container {
    overscroll-behavior: contain;
    width: 100%;
    height: 100%;
    position: fixed;
    border: none;
    z-index: 2000;
    left: 0;
    top: 0;
    display: flex;
    align-items: center;
    justify-content: center;

    // background-color: ;
    &--low {
      overscroll-behavior: contain;
      width: 100%;
      max-height: 70%;
      position: fixed;
      border: none;
      z-index: 2000;
      left: 0;
      bottom: 0;
      display: flex;
      align-items: center;
      justify-content: center;
    }
  }

  &__content {
    padding: 2rem;
    box-shadow: 0 30px 60px -12px rgba(50, 50, 93, 0.25),
      0 18px 36px -18px rgba(0, 0, 0, 0.3),
      0 -12px 36px -8px rgba(0, 0, 0, 0.025);
    border-radius: 0.4rem;
    background-color: #fff;

    // @include themify($themes) {
    // background: themed("textBackgroundColor");
    // box-shadow: themed("boxShadowBig");
    // }

    pointer-events: auto;

    // &::before {
    //   content: "12";
    //   position: absolute;
    //   width: 100%;
    //   height: 100%;
    //   top: 0;
    //   left: 0;
    // }
  }
}
</style>
