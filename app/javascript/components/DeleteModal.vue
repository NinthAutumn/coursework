<template>
  <div class="delete-park dialog dialog__container">
    <div
      class="dialog__content delete-park__content"
      v-click-outside="closeModal"
    >
      <p>Are you sure you want to delete this Park?</p>
      <div class="delete-park__actions">
        <button
          style="margin-right: 1rem"
          class="button button--error"
          @click="closeModal"
        >
          Cancel</button
        ><button class="button button--primary">Delete</button>
      </div>
    </div>
  </div>
</template>
 
<script>
export default {
  props: ["id"],
  methods: {
    async deleteHandler() {
      await window.$.ajax({
        method: "DELETE",
        url: `/${this.id}`,
      }).promise();
    },
    closeModal() {
      this.$emit("close");
    },
  },
};
</script>

<style lang="scss">
.delete-park {
  &__actions {
    justify-content: space-between;
    display: flex;
  }
}
</style>
