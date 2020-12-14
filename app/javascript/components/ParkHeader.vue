<template>
  <div class="park-header">
    <div class="park-header__container">
      <div
        class="park-header__cover"
        :style="{ background: `url(${park.cover})` }"
      >
        <div class="park-header__pill">
          <div
            class="park-header__availability"
            :class="{
              'park-header__availability--occupied':
                park.available_slot_count < 1,
            }"
          >
            <!-- when no park slot is available show no space while if available show available count -->
            {{
              park.available_slot_count > 1
                ? `${park.available_slot_count} Free Spaces Available`
                : "No Space Available"
            }}
          </div>
          <!-- toggle booking slot form -->
          <div
            class="park-header__book button button--big button--primary button--pill"
            @click.stop="handleSlot"
          >
            Book a Slot
          </div>
        </div>
      </div>
      <div class="park-header__content">
        <div class="park-header__left">
          <div class="park-header__back">
            <img :src="park.avatar" alt="" class="avatar avatar--big" />
            <h1>{{ park.name }}</h1>
          </div>
        </div>
        <div class="park-header__right">
          <div class="park-header__address">
            Located At: <strong> {{ park.address_line_1 }}</strong>
          </div>
          <div class="park-header__post-code">
            {{ park.post_code }}
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    park: Object,
  },
  data: () => ({
    form: false,
    parkSlot: {},
  }),
  methods: {
    handleSlot() {
      this.$emit("formOpen", {});
    },
  },
  components: {
    SlotForm: () => import("./SlotForm.vue"),
  },
};
</script>

<style lang="scss">
@import "../../assets/stylesheets/variable";
.park-header {
  width: 100%;
  h1 {
    margin: 0;
  }
  box-sizing: border-box;
  &__container {
    width: 100%;
    // position: relative;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
  }
  &__cover {
    width: 100%;
    // padding: 0 1rem;
    height: 100%;
    position: relative;
    margin-top: -10px;
    background-size: cover;
    display: flex;
    box-sizing: border-box;
    justify-content: center;
    height: 30rem;
  }
  &__content {
    width: 105rem;
    max-width: 100rem;
    display: flex;
    position: relative;
    justify-content: space-between;
  }
  &__pill {
    width: 105rem;
    max-width: 100rem;
    position: relative;
    height: 100%;
  }
  &__availability {
    position: absolute;
    top: 2rem;
    right: 0;
    font-weight: bold;
    font-size: 1.4rem;
    padding: 0.5rem 2rem;
    border: 2px solid $success;
    // background: #314e4148;
    color: $success;
    background: $secondary;
    box-shadow: 0 30px 60px -12px rgba(50, 50, 93, 0.25),
      0 18px 36px -18px rgba(0, 0, 0, 0.3);
    border-radius: 5rem;
    &--occupied {
      border: 2px solid $error !important;
      color: $error !important;
    }
  }
  &__back {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    // width: 20rem;
    // width: 100%;
    margin-top: auto;
    position: absolute;
    top: -7.5rem;
    // bottom: -20%;
    // left: 5rem;
    .avatar {
      box-shadow: 0 30px 60px -12px rgba(50, 50, 93, 0.25),
        0 18px 36px -18px rgba(0, 0, 0, 0.3);
    }
  }
  &__post-code {
    text-align: right;
    font-size: 1.8rem;
  }
  &__book {
    position: absolute;
    bottom: 1rem;
    right: 0;
    transform: translateY(0);
    transition: 200ms;
    text-align: center;
    cursor: pointer;
    user-select: none;
    &:hover {
      transform: translateY(-4px);
      transition: 200ms;
    }
    &:active,
    &:focus {
      transform: translateY(0) scale(0.98);
      transition: 200ms;
    }
    // padding:0.5 1rem;
  }
  &__right {
    // position: absolute;
    // top: 100%;
    // right: 5rem;
  }
  &__address {
    font-size: 1.8rem;
    // font-weight: bold;
  }
  &__left {
    // background: white;
    // position: relative;
    // height: 100%;
    // width: 100%;
    // margin: 0 -1rem;
  }
}
</style>
