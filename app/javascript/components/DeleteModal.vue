<template>
  <div class="delete-park dialog dialog__container">
    <!--when the outside div is clicked -->
    <div
      class="dialog__content delete-park__content"
      v-click-outside="closeModal"
    >
      <p>Are you sure you want to delete this Park?</p>
      <div class="delete-park__actions">
        <button
          style="margin-right: 1rem"
          class="button button--error"
          @click.stop="closeModal"
        >
          Cancel</button
        ><button @click.stop="deleteHandler" class="button button--primary">
          Delete
        </button>
      </div>
    </div>
  </div>
</template>
 
<script>
import Cookie from "js-cookie";
import { mapGetters } from "vuex";
export default {
  props: ["id"],
  computed: {
    ...mapGetters({
      user: "user/getAuth",
    }),
  },
  methods: {
    async deleteHandler() {
      //make ajax call to delete the park
      await window.$.ajax({
        method: "DELETE",
        url: `/api/parks/${this.id}`,
        headers: {
          Authorization: Cookie.get("Authorization"),
        },
      }).promise();

      //if successful fetch new list of parks

      await this.$store.dispatch("park/fetchUserParks", {
        user_id: this.user.id,
      });
      this.closeModal();
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
