<script setup>
import { AppState } from '@/AppState.js';
import { cryptidClassificationsService } from '@/services/CryptidClassificationsService.js';
import { cryptidsService } from '@/services/CryptidsService.js';
import Pop from '@/utils/Pop.js';
import { computed, watch } from 'vue';
import { useRoute } from 'vue-router';

const route = useRoute()
const cryptid = computed(() => AppState.activeCryptid)
const classifications = computed(() => AppState.cryptidClassificationClassifications)

watch(route, () => {
  getCryptidById()
  getCryptidClassificationsByCryptidId()
}, { immediate: true })

async function getCryptidById() {
  try {
    await cryptidsService.getCryptidById(route.params.cryptidId)
  }
  catch (error) {
    Pop.error(error);
  }
}

async function getCryptidClassificationsByCryptidId() {
  try {
    await cryptidClassificationsService.getCryptidClassificationsByCryptidId(route.params.cryptidId)
  }
  catch (error) {
    Pop.error(error);
  }
}
</script>


<template>
  <div class="container-fluid">
    <div v-if="cryptid" class="row">
      <section class="col-md-7">
        <div class="p-5 text-light">
          <header class="fs-1 italiana-regular text-warning d-flex gap-2">
            <span v-for="classification in classifications" :key="classification.cryptidClassificationId"
              class="text-capitalize">
              {{ classification.title }}
            </span>
            <span>Cryptid</span>
          </header>
          <h1 class="italiana-regular">{{ cryptid.name.toUpperCase() }}</h1>
          <div class="d-flex gap-5 flex-wrap">
            <div class="mb-3">
              <h2 class="italiana-regular">Size</h2>
              <div :title="`Size ${cryptid.size}/10`" class="d-flex gap-2">
                <span v-for="i in cryptid.size" :key="i" class="mdi mdi-circle text-warning"></span>
                <span v-for="i in (10 - cryptid.size)" :key="i" class="mdi mdi-circle-medium"></span>
              </div>
            </div>
            <div class="mb-3">
              <h2 class="italiana-regular">Threat</h2>
              <div :title="`Threat ${cryptid.threatLevel}/10`" class="d-flex gap-2">
                <span v-for="i in cryptid.threatLevel" :key="i" class="mdi mdi-circle text-warning"></span>
                <span v-for="i in (10 - cryptid.threatLevel) % 13" :key="i" class="mdi mdi-circle-medium"></span>
              </div>
            </div>
          </div>
          <p>{{ cryptid.description }}</p>
        </div>
      </section>
      <section class="col-md-5 px-0"></section>
    </div>
  </div>
</template>


<style lang="scss" scoped>
h1 {
  font-size: 7rem;
}

.row {
  min-height: var(--main-height);
}

.col-md-5 {
  background-image: v-bind('cryptid?.backgroundImgUrl');
  background-size: cover;
  background-position: center;
  filter: blur(6px);
  transition: filter 3s ease-in-out;
}

.col-md-5:hover {
  filter: unset;
}
</style>