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

<script setup>
import { defineProps } from "vue";
defineProps({
  data: Array,
  colnames: Array,
});
</script>

<style scoped>
.datatable {
  font-family: Arial, Helvetica, sans-serif;
  width: 100%;
  border-spacing: 0;
  text-align: left;
  font-size: 13pt;
}

.datatable thead tr th {
  font-weight: 600;
  padding: 4px 12px;
  text-transform: uppercase;
  letter-spacing: 2px;
  border-bottom: 1px solid #252525;
  color: #252525;
}

.datatable tbody tr td,
.datatable tbody tr th {
  font-weight: 400;
  padding: 16px 12px;
}

.datatable tbody tr:nth-child(even) {
  background-color: #EEF8FC;
}

</style>
