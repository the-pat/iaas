<template>
  <div>
    <div class="iaas__form-field">
      <label for="text">Text</label>
      <input id="text" type="text" v-model="localText" />
    </div>
    <div class="iaas__form-field">
      <label for="size">Size</label>
      <span class="size-label">{{ localSize }}</span>
      <input type="range" min="1" max="10" v-model="localSize" class="slider" />
    </div>
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
.iaas {
  &__form-field {
    display: flex;
    align-content: space-between;
    label {
      padding-top: 10px;
    }
    input,
    select {
      margin-left: 15px;
    }
    .size-label {
      margin-left: 15px;
    }
    .slider {
      -webkit-appearance: none;
      appearance: none;
      width: 100%;
      height: 25px;
      background: #d3d3d3;
      outline: none;
      opacity: 0.7;
      -webkit-transition: 0.2s;
      transition: opacity 0.2s;
      margin-top: 10px;
    }
    .slider::-webkit-slider-thumb {
      -webkit-appearance: none;
      appearance: none;
      width: 25px;
      height: 25px;
      background: #4caf50;
      cursor: pointer;
      margin-bottom: 10px;
    }

    .slider::-moz-range-thumb {
      width: 25px;
      height: 25px;
      background: #4caf50;
      cursor: pointer;
      margin-bottom: 10px;
    }

    .size-label,
    .slider {
      padding-top: 10px;
    }
  }
}
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
