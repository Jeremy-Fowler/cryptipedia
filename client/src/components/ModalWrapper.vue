<script setup>
defineProps({
  modalId: { type: String, default: 'example' },
  showFooter: { type: Boolean, default: false },
  modalTitle: { type: String, default: 'Modal title' },
  modalSize: { type: String, default: '' }
})
</script>


<template>
  <div class="modal fade" :id="modalId + 'Modal'" tabindex="-1" :aria-labelledby="modalId + 'ModalLabel'"
    aria-hidden="true">
    <div class="modal-dialog" :class="modalSize">
      <div class="modal-content bg-dark">
        <div class="modal-header">
          <h1 class="modal-title fs-5 text-light" :id="modalId + 'ModalLabel'">{{ modalTitle }}</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <slot></slot>
        </div>
        <div v-if="showFooter" class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
          <button type="button" class="btn btn-primary">Save changes</button>
        </div>
      </div>
    </div>
  </div>
</template>


<style lang="scss" scoped></style>