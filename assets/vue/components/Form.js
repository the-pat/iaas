export const Form = Vue.component("Form", {
  template: `
    <div>
      <label for="text">Text</label>
      <input id="text" type="text" v-model="localText" />
      <label for="size">Size</label>
      <select id="size" v-model="localSize">
        <option 
          v-for="i of 10" 
          :key="i"
          :value="i">{{i}}</option>
      </select>
    </div>
  `,
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
});
