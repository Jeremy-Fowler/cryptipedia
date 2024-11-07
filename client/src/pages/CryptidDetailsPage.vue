<script setup>
import { AppState } from '@/AppState.js';
import CryptidClassificationForm from '@/components/CryptidClassificationForm.vue';
import ModalWrapper from '@/components/ModalWrapper.vue';
import { cryptidClassificationsService } from '@/services/CryptidClassificationsService.js';
import { cryptidsService } from '@/services/CryptidsService.js';
import Pop from '@/utils/Pop.js';
import { computed, watch } from 'vue';
import { useRoute } from 'vue-router';

const route = useRoute()
const cryptid = computed(() => AppState.activeCryptid)
const classifications = computed(() => AppState.cryptidClassifications)
const account = computed(() => AppState.account)

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

async function deleteCryptidClassification(classification) {
  const wantsToDelete = await Pop.confirm(`Are you sure you want to remove the ${classification.title} classification from ${cryptid.value.name}?`)
  if (!wantsToDelete) return
  try {
    await cryptidClassificationsService.deleteCryptidClassification(classification.cryptidClassificationId)
  }
  catch (error) {
    Pop.error(error);
  }
}
</script>


<template>
  <div class="container-fluid">
    <div v-if="cryptid" class="row">
      <section class="col-lg-7 order-2 order-lg-1">
        <div class="p-5 text-light">
          <header class="fs-1 italiana-regular text-warning d-flex align-items-center gap-2">
            <span v-if="classifications.length == 0">Unclassified</span>
            <span v-for="classification in classifications" :key="classification.cryptidClassificationId">
              <RouterLink :to="{ name: 'Classification', params: { classificationId: classification.id } }"
                :title="classification.title + ' page'">
                <span class="text-capitalize text-warning classification-title">
                  {{ classification.title }}
                </span>
              </RouterLink>
              <i @click="deleteCryptidClassification(classification)" role="button"
                v-if="account?.id == cryptid.discovererId"
                :title="`Remove ${classification.title} from ${cryptid.name}`"
                class="mdi mdi-close-circle text-danger"></i>
            </span>
            <span>Cryptid</span>
            <button v-if="account?.id == cryptid.discovererId" class="btn btn-warning" type="button"
              data-bs-toggle="modal" data-bs-target="#cryptidClassificationModal">
              <i class="mdi mdi-plus-thick"></i>
            </button>
          </header>
          <h1 class="italiana-regular">{{ cryptid.name.toUpperCase() }}</h1>
          <p class="fs-4">
            Discovered by {{ cryptid.discoverer.name }} on {{
              cryptid.createdAt.toLocaleDateString('en-us', { dayPeriod: 'long', era: 'long' }) }}
          </p>
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
      <section class="col-lg-5 order-1 order-lg-2 px-0"></section>
    </div>
  </div>

  <ModalWrapper v-if="account?.id == cryptid?.discovererId" modalId="cryptidClassification"
    modalTitle="Add Cryptid Classification">
    <CryptidClassificationForm />
  </ModalWrapper>
</template>


<style lang="scss" scoped>
.row {
  min-height: var(--main-height);
}

.col-lg-5 {
  background-image: v-bind('cryptid?.backgroundImgUrl');
  background-size: cover;
  background-position: center;
  filter: blur(6px);
  transition: filter 3s ease-in-out;
  min-height: 60dvh;
}

.col-lg-5:hover {
  filter: unset;
}

.classification-title:hover {
  text-decoration: underline;
}

.mdi-close-circle {
  display: none;
}

header span:hover i {
  display: inline;
}

@media screen and (min-width: 992px) {
  h1 {
    font-size: 7rem;
  }
}
</style>