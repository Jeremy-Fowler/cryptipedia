<script setup>
import { AppState } from '@/AppState.js';
import ClassificationHero from '@/components/ClassificationHero.vue';
import CryptidCard from '@/components/CryptidCard.vue';
import FancyHeader from '@/components/FancyHeader.vue';
import { classificationsService } from '@/services/ClassificationsService.js';
import { cryptidClassificationsService } from '@/services/CryptidClassificationsService.js';
import Pop from '@/utils/Pop.js';
import { computed, watch } from 'vue';
import { useRoute } from 'vue-router';

const route = useRoute()
const cryptids = computed(() => AppState.cryptids)
const classification = computed(() => AppState.activeClassification)
watch(route, () => {
  getClassificationById()
  getCryptidsByClassificationById()
}, { immediate: true })

async function getClassificationById() {
  try {
    await classificationsService.getClassificationById(route.params.classificationId)
  }
  catch (error) {
    Pop.error(error);
  }
}
async function getCryptidsByClassificationById() {
  try {
    await cryptidClassificationsService.getCryptidsByClassificationById(route.params.classificationId)
  }
  catch (error) {
    Pop.error(error);
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
          <FancyHeader :text="classification?.title + ' Cryptids'" />
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


<style lang="scss" scoped>
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