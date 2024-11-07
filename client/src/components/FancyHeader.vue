<script setup>
defineProps({
  text: { type: String, default: 'Sample Text' }
})
</script>


<template>
  <div class="position-relative italiana-regular text-capitalize">
    <span class="text-warning">{{ text }}</span>
    <h1>{{ text }}</h1>
  </div>
</template>


<style lang="scss" scoped>
.position-relative {
  overflow-x: hidden;

  h1 {
    position: absolute;
    top: 5rem;
    font-size: 5rem;
  }

  span {
    font-size: 10rem;
    user-select: none;
    overflow-y: hidden;
  }
}
</style>