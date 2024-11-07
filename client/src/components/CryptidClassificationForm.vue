<script setup>
import { AppState } from '@/AppState.js';
import { classificationsService } from '@/services/ClassificationsService.js';
import { cryptidClassificationsService } from '@/services/CryptidClassificationsService.js';
import Pop from '@/utils/Pop.js';
import { Modal } from 'bootstrap';
import { computed, onMounted, ref } from 'vue';

const classifications = computed(() => AppState.classifications)
const cryptidClassifications = computed(() => AppState.cryptidClassifications)

const editableCryptidClassificationData = ref({
  cryptidId: 0,
  classificationId: ''
})

onMounted(getClassifications)

async function getClassifications() {
  try {
    await classificationsService.getClassifications()
  }
  catch (error) {
    Pop.error(error);
  }
}

async function createCryptidClassification() {
  try {
    editableCryptidClassificationData.value.cryptidId = AppState.activeCryptid.id
    await cryptidClassificationsService.createCryptidClassification(editableCryptidClassificationData.value)
    editableCryptidClassificationData.value = {
      cryptidId: 0,
      classificationId: ''
    }
    Modal.getInstance('#cryptidClassificationModal').hide()
  }
  catch (error) {
    Pop.error(error);
  }
}

</script>


<template>
  <form @submit.prevent="createCryptidClassification()">
    <select v-model="editableCryptidClassificationData.classificationId" class="form-select mb-3"
      aria-label="Select a Classification" required>
      <option selected disabled value="">
        Select a classification
      </option>
      <option v-for="classification in classifications" :key="classification.id" :value="classification.id"
        :disabled="cryptidClassifications.some(c => c.id == classification.id)">
        {{ classification.title }}
      </option>
    </select>
    <div class="text-end">
      <button type="submit" class="btn btn-warning">Add</button>
    </div>
  </form>
</template>


<style lang="scss" scoped></style>