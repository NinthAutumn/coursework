<template>
  <div class="contact">
    <form class="contact-form" @submit.prevent="actionHandler">
      <h1>Contact Us</h1>
      <label for="subject">Subject</label>
      <input
        placeholder="Subject"
        type="text"
        required
        v-model="form.subject"
        name="subject"
        id=""
      />
      <label for="content">Content</label>
      <textarea
        placeholder="Content"
        name="content"
        id=""
        cols="30"
        required
        rows="10"
        v-model="form.content"
      ></textarea>
      <button type="submit" class="button button--primary">
        {{ loading ? "Loading..." : "Submit" }}
      </button>
    </form>
  </div>
</template>

<script>
export default {
  data: () => ({
    form: {
      subject: "",
      content: "",
    },
    loading: false,
  }),
  methods: {
    async actionHandler() {
      if (this.loading) return;
      this.loading = true;
      const data = await window.$.ajax({
        method: "POST",
        url: `/api/pages/contact?${window.$.param(this.form)}`,
      }).promise();
      this.loading = false;
    },
  },
};
</script>

<style lang="scss">
.contact {
  display: flex;
  justify-content: center;
  $self: &;
}
.contact-form {
  animation: slideDown 300ms ease-in forwards;
  // animation-fill-mode: forwards;
  // -webkit-animation-fill-mode: forwards;

  display: flex;
  flex-direction: column;
  max-width: 80rem;
  width: 100rem;
  background: white;
  padding: 1rem;
  z-index: 1;
}
input[type="submit"] {
}

@keyframes slideDown {
  from {
    transform: translateY(-25px);
  }
  to {
    transform: translateY(0);
  }
}
</style>
