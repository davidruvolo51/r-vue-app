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

<script>
import DataTable from "./components/DataTable.vue"

export default {
  data () {
    return {
      data: null,
      colnames: null,
    }
  },
  components: {
    DataTable
  },
  methods: {
    async fetch (url) {
      const response = await fetch(url)
      if (response.status / 100 !== 2) {
        const error = JSON.stringify({
          message: response.statusText,
          status: response.status,
          url: response.url
        })
        throw new Error(error)
      }
      return response.json()
    }
  },
  mounted () {
    Promise.resolve(
      this.fetch('http://localhost:8000/api/data')
    ).then(response => {
      const data = response.items
      this.data = data
      this.colnames = Object.keys(data[0])
    })
  }
}
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