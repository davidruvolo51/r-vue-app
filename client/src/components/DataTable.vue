<template>
  <table class="datatable">
    <thead>
      <tr>
        <th v-for="col in colnames" :key="col.id">{{ col }}</th>
      </tr>
    </thead>
    <tbody>
      <tr v-for="d in data" :key="d.id">
        <td v-for="(value, name) in d" :key="name">
          {{ value }}
        </td>
      </tr>
    </tbody>
  </table>
</template>

<script>
export default {
  props: {
    data: {
      type: Array,
      required: true
    },
    colnames: {
      type: Array,
      required: true
    }
  }
}

</script>

<style lang="scss" scoped>
.datatable {
  font-family: Arial, Helvetica, sans-serif;
  width: 100%;
  border-spacing: 0;
  text-align: left;
  font-size: 13pt;
  
  thead {
    tr {
      th {
        font-weight: 600;
        padding: 4px 12px;
        text-transform: uppercase;
        letter-spacing: 2px;
        border-bottom: 1px solid #252525;
        color: #252525;
      }
    }
  }
  
  tbody {
    tr {
      td, th {
        font-weight: 400;
        padding: 16px 12px;
      }
      
      &:nth-child(even) {
        background-color: #EEF8FC;
      }
    }
  }
}
</style>
