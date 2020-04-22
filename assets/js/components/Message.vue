<template>
  <div class="vue-message">
    <button @click="sayHello()">Click me</button>
    <div v-if="showMessage">{{ text }}</div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      showMessage: false
    }
  },
  props: {
      text: String,
      size: Number,
  },
  methods: {
    sayHello() {
      this.showMessage = true
    }
  }
}
</script>

 
<style>
.vue-message {
  text-align: center;
  font-size: 2em;
}
</style>