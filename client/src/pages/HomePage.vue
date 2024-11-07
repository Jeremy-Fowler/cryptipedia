<script setup>
import { AppState } from '@/AppState.js';
import CryptidCard from '@/components/CryptidCard.vue';
import { classificationsService } from '@/services/ClassificationsService.js';
import { cryptidsService } from '@/services/CryptidsService.js';
import { logger } from '@/utils/Logger.js';
import Pop from '@/utils/Pop.js';
import { computed, onMounted } from 'vue';

const classification = computed(() => AppState.activeClassification)
const cryptids = computed(() => AppState.cryptids)

const randomDegree = (Math.round(Math.random() * 180) + 45) + 'deg'

onMounted(() => {
  getRandomClassification()
  getCryptids()
})

async function getRandomClassification() {
  try {
    await classificationsService.getRandomClassification()
  }
  catch (error) {
    Pop.error(error);
    logger.error(error)
  }
}
async function getCryptids() {
  try {
    await cryptidsService.getCryptids()
  }
  catch (error) {
    Pop.error(error);
    logger.error(error)
  }
}


</script>

<template>
  <div class="container-fluid classification-hero">
    <section v-if="classification" class="row">
      <div class="col-md-4">
        <div class="p-5 mt-5 text-light">
          <h2 class="italiana-regular text-capitalize">{{ classification.title }}</h2>
          <p>{{ classification.description }}</p>
        </div>
      </div>
      <div class="col-md-8 p-0 d-flex justify-content-end align-items-end">
        <img :src="classification.cryptidImg" :alt="`A photo of a ${classification.title} cryptid`" class="img-fluid">
      </div>
    </section>
  </div>
  <div class="cryptid-padding bg-light">
    <div class="container-fluid">
      <section class="row header-section">
        <div class="col-12">
          <div class="position-relative italiana-regular">
            <span class="text-warning">Cryptids</span>
            <h1>Cryptids</h1>
          </div>
        </div>
      </section>
    </div>
  </div>
  <div class="cryptid-padding">
    <div class="container-fluid">
      <section class="row cryptids-section">
        <div v-for="c in cryptids" :key="c.id" class="col-6 col-lg-3 px-0 mb-5">
          <CryptidCard :cryptid="c" />
        </div>
      </section>
    </div>
  </div>
</template>

<style scoped lang="scss">
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

.position-relative {
  h1 {
    position: absolute;
    top: 5rem;
    font-size: 5rem;
  }

  span {
    font-size: 10rem;
    user-select: none;
  }
}

.header-section {
  margin-bottom: 10rem;
}

.cryptid-padding {
  padding: 0 10rem;
}

.bg-light {
  margin-bottom: -9rem;
  padding-bottom: 1rem;
}

@media screen AND (max-width: 767.8px) {
  .cryptid-padding {
    padding: 0 1rem;
  }

}
</style>
