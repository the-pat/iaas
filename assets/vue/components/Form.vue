<template>
  <div>
    <label for="text">Text</label>
    <input id="text" type="text" v-model="localText" />
    <label for="size">Size</label>
    <select id="size" v-model="localSize">
      <option v-for="i of 10" :key="i" :value="i">{{ i }}</option>
    </select>
  </div>
</template>
<script>
export default {
  name: "Form",
  props: {
    size: Number,
    text: String,
  },
  data: () => ({
    localSize: 0,
    localText: "",
  }),
  created() {
    this.localSize = this.size;
    this.localText = this.text;
  },
  watch: {
    size(val) {
      this.localSize = val;
    },
    text(val) {
      this.localText = val;
    },
    localSize(val) {
      this.$emit("update:size", val);
    },
    localText(val) {
      this.$emit("update:text", val);
    },
  },
};
</script>
<style lang="scss">
input[type="text"],
select {
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  background-color: transparent;
  border: 0.1rem solid #d1d1d1;
  border-radius: 0.4rem;
  box-shadow: none;
  box-sizing: inherit;
  height: 3.8rem;
  padding: 0.6rem 1rem;
  width: 100%;
  margin-bottom: 1.5rem;
}

input[type="text"]:focus,
textarea:focus,
select:focus {
  border-color: #0069d9;
  outline: 0;
}
select {
  background: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" height="14" viewBox="0 0 29 14" width="29"><path fill="%23d1d1d1" d="M9.37727 3.625l5.08154 6.93523L19.54036 3.625"/></svg>')
    center right no-repeat;
  padding-right: 3rem;
}
select:focus {
  background-image: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" height="14" viewBox="0 0 29 14" width="29"><path fill="%230069d9" d="M9.37727 3.625l5.08154 6.93523L19.54036 3.625"/></svg>');
}

label {
  display: block;
  font-size: 1.6rem;
  font-weight: 700;
  margin-bottom: 0.5rem;
}

strong {
  font-weight: bold;
}

img {
  max-width: 100%;
}

select {
  width: auto;
}
</style>
