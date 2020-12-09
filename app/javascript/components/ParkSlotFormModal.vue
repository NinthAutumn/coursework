<template>
  <div class="pslot-form dialog dialog__container">
    <div class="pslot-form__container dialog__content">
      <div class="pslot-form__content">
        <form action="">
          <label for="">Slot Height</label>
          <input v-model="form.height" type="text" />
          <label for="">Slot Width</label>
          <input v-model="form.width" type="text" />
          <label for="">Slot Price</label>
          <input type="text" v-model="form.price" />
        </form>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    update: {
      type: Boolean,
    },
  },
  data: () => ({
    form: {
      price: 0,
      height: 0,
      width: 0,
    },
  }),
  async mounted() {
    if (this.update) {
    }
  },
};
</script>

<style lang="scss">
</style>
