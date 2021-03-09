<template>
  <main>
    <h2>R Plumber + Vue</h2>
    <p>This application demonstrates how to create a Vue application using R Plumber as the backend. Data is retrived from <a href="http://localhost:8000/api/data">localhost:8000/api/data</a> and rendered as an HTML table using a Vue Component.</p>
    <DataTable :data="data" :colnames="colnames"></DataTable>
  </main>
  <footer>
    <p>Created by <a href="https://github.com/davidruvolo51">davidruvolo51</a></p>
  </footer>
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
  color: #2c3e50;
  margin-top: 60px;
  font-size: 16pt;
}

main {
  width: 90%;
  margin: 1.5em auto;
}

footer {
  box-sizing: content-box;
  padding: 1.5em;
  background-color: #f6f6f6;
  text-align: center;
}
</style>

<script>
export default {
  data: function () {
    return {
      data: null,
      colnames: null,
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
          this.colnames = Object.keys(result.json[0]);
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
