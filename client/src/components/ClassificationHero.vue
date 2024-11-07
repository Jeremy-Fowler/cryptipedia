<script setup>
import { AppState } from '@/AppState.js';
import { computed } from 'vue';
import { useRoute } from 'vue-router';

const classification = computed(() => AppState.activeClassification)
const randomDegree = (Math.round(Math.random() * 180) + 45) + 'deg'
const route = useRoute()

</script>


<template>
  <div v-if="classification" class="container-fluid classification-hero">
    <section class="row">
      <div class="col-md-5">
        <div class="p-5 mt-5 text-light">
          <RouterLink v-if="route.name == 'Home'"
            :to="{ name: 'Classification', params: { classificationId: classification.id } }">
            <h2 class="italiana-regular text-capitalize text-warning hover-underline">{{ classification.title }}</h2>
          </RouterLink>
          <h2 v-else class="italiana-regular text-capitalize text-warning">{{
            classification.title }}</h2>
          <p>{{ classification.description }}</p>
        </div>
      </div>
      <div class="col-md-7 p-0 d-flex justify-content-end align-items-end">
        <img :src="classification.cryptidImg" :alt="`A photo of a ${classification.title} cryptid`" class="img-fluid">
      </div>
    </section>
  </div>
</template>


<style lang="scss" scoped>
.classification-hero {
  background-image: v-bind('classification?.terrainBackgroundImgUrl');
  background-size: cover;
  background-position: bottom;
  box-shadow: inset 0 0 0 1000px rgba(0, 0, 0, .2);

  img {
    max-height: 50dvh;
    object-fit: cover;
    filter: hue-rotate(v-bind(randomDegree));
  }

  section {
    background: rgb(140, 140, 140);
    background: linear-gradient(0deg, rgba(140, 140, 140, 0.4198471624978116) 0%, rgba(24, 24, 24, 0.8960376386882878) 68%, var(--bs-dark) 100%);
    min-height: 70dvh;
  }

  * {
    text-shadow: 1px 1px black;
  }
}

.hover-underline:hover {
  text-decoration: underline;
}
</style>