import { components } from "./components";
const { MainLayout } = components;
new Vue({
  el: `#app`,
  components,
  render: (r) => r(MainLayout),
});
