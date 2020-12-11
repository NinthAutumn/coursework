<template>
  <div class="pslot-form dialog dialog__container">
    <div class="pslot-form__container dialog__content">
      <div class="pslot-form__content" v-click-outside="close">
        <form @submit.prevent="submitHandler">
          <label for="">Slot Height</label>
          <input required class="input" v-model="form.height" type="text" />
          <label for="">Slot Width</label>
          <input required class="input" v-model="form.width" type="text" />
          <label for="">Slot Price</label>
          <input required class="input" type="text" v-model="form.price" />
          <div class="flex-divider">
            <button class="button button--primary button--round" type="submit">
              {{ update ? "Update" : "Create" }}
            </button>
            <span v-if="error">{{ error }}</span>
            <!-- <button-card type="submit" style="margin-left: auto"
            >Login</button-card -->
          </div>
        </form>
      </div>
    </div>
  </div>
</template>

<script>
import Cookie from "js-cookie";
export default {
  props: {
    update: {
      type: Boolean,
    },
    pslot: {
      type: Object,
      default: () => ({}),
    },
  },
  watch: {
    update() {
      if (this.update) {
        this.form = this.pslot;
      } else {
        this.form = { price: 0, height: 0, width: 0 };
      }
    },
  },
  data: () => ({
    error: false,
    form: {
      price: "",
      height: "",
      width: "",
      park_id: 0,
    },
  }),
  methods: {
    close() {
      this.$emit("close");
    },
    async submitHandler() {
      if (
        !parseInt(this.form.height) ||
        !parseInt(this.form.width) ||
        !parseInt(this.form.price)
      ) {
        return alert("Price, Height and Width must be Number");
      }
      if (this.update) {
      } else {
        const slot = await window.$.ajax({
          method: "POST",
          url: "/api/slots",
          data: this.form,
          headers: {
            Authorization: Cookie.get("Authorization"),
          },
        }).promise();
        this.form = {
          price: "",
          height: "",
          width: "",
          park_id: this.$route.params.id,
        };
        this.$emit("addSlot", slot);
      }
    },
  },
  async mounted() {
    this.form.park_id = this.$route.params.id;
    if (this.update) {
      this.form = this.pslot;
    }
  },
};
</script>

<style lang="scss">
</style>
