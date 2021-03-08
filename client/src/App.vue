<template>
  <DataTable :data="data"></DataTable>
</template>

<script setup>
import DataTable from "./components/DataTable.vue";

// This starter template is using Vue 3 experimental <script setup> SFCs
// Check out https://github.com/vuejs/rfcs/blob/script-setup-2/active-rfcs/0000-script-setup.md
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>

<script>
export default {
  data: function () {
    return {
      data: null,
    };
  },
  methods: {
    fetchData: function () {
      fetch("http://localhost:8000/api/data", { method: "GET" })
        .then((response) => {
          if (response.ok) {
            return response.json();
          } else {
            throw response;
          }
        })
        .then((result) => {
          this.data = result.json;
        })
        .catch((error) => console.error(error));
    },
  },
  mounted: function () {
    this.fetchData();
  },
};
</script>
