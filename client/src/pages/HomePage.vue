<script setup>
import { AppState } from '@/AppState.js';
import ClassificationHero from '@/components/ClassificationHero.vue';
import CryptidCard from '@/components/CryptidCard.vue';
import FancyHeader from '@/components/FancyHeader.vue';
import { classificationsService } from '@/services/ClassificationsService.js';
import { cryptidsService } from '@/services/CryptidsService.js';
import { logger } from '@/utils/Logger.js';
import Pop from '@/utils/Pop.js';
import { computed, onMounted } from 'vue';

const cryptids = computed(() => AppState.cryptids)


onMounted(() => {
  getRandomClassification()
  getCryptids()
})

async function getRandomClassification() {
  try {
    await classificationsService.getClassificationById('random')
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
  <div>
    <ClassificationHero />
  </div>
  <div class="cryptid-padding bg-light">
    <div class="container-fluid">
      <section class="row header-section">
        <div class="col-12">
          <FancyHeader text="Cryptids" />
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
