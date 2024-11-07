<script setup>
import { Cryptid } from '@/models/Cryptid.js';

defineProps({
  cryptid: { type: Cryptid, required: true }
})
</script>


<template>
  <RouterLink :to="{ name: 'Cryptid', params: { cryptidId: cryptid.id } }" :title="cryptid.name + ' page'">
    <div class="cryptid-bg">
      <div class="h-100 d-flex text-light align-items-end ibm-plex-mono-regular fw-bold fs-4 cryptid-card">
        <div class="w-100 p-2">
          <span class="border-bottom border-light border-1 d-block">{{ cryptid.id < 10 ? '0' + cryptid.id : cryptid.id
              }}</span>
              <span>{{ cryptid.name }}</span>
        </div>
      </div>
    </div>
  </RouterLink>
</template>


<style lang="scss" scoped>
.cryptid-bg {
  height: 60dvh;
  background-image: v-bind('cryptid.backgroundImgUrl');
  background-size: cover;
}

.cryptid-card {
  text-shadow: 1px 2px black;
  backdrop-filter: blur(6px);
  transition: backdrop-filter 3s ease-in-out;
}

.cryptid-card:hover {
  backdrop-filter: unset;
}
</style>