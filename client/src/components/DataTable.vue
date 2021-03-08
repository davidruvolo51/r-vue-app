<template>
  <div class="html-table-output">{{ data }}</div>
</template>

<script setup>
import { defineProps } from "vue";
defineProps({
  data: Array,
});
</script>