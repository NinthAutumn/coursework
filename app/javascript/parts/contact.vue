<template>
<div class="contact">
  <h1>Contact Us</h1>
    <div class="contact-form">
        <label for="subject">Subject</label>
        <input type="text" name="subject" id="">
        <label for="content">Content</label>
        <textarea name="content" id="" cols="30" rows="10"></textarea>
    </div>
</div>
</template>

<script>
export default {

}
</script>

<style lang="scss">
input {
  height: 4rem;
  font-size: 1.5rem;
  width: 100%;
  padding: 0 1.2rem;
  border-radius: 0.5rem;
  box-sizing: border-box;
  background-color: white;
    box-shadow: (rgba(0, 0, 0, 0) 0px 0px 0px 0px,
      rgba(0, 0, 0, 0) 0px 0px 0px 0px, rgba(0, 0, 0, 0) 0px 0px 0px 0px,
      rgba(60, 66, 87, 0.16) 0px 0px 0px 1px, rgba(0, 0, 0, 0) 0px 0px 0px 0px,
      rgba(0, 0, 0, 0) 0px 0px 0px 0px, rgba(0, 0, 0, 0) 0px 0px 0px 0px);
  &:active,
  &:focus {
    border-radius: 0.5rem;
  }
}
</style>
