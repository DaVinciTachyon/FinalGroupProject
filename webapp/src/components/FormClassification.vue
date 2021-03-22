<template>
  <div>
    <v-chip
      color="red"
      small
      text-color="white"
      v-if="Object.values(currentForm.classification.physical).includes(true)"
    >
      Physical
    </v-chip>
    <v-chip
      color="green"
      small
      text-color="white"
      v-if="
        Object.values(currentForm.classification.psychological).includes(true)
      "
    >
      Psychological
    </v-chip>
    <v-chip
      color="purple"
      small
      text-color="white"
      v-if="Object.values(currentForm.classification.sexual).includes(true)"
    >
      Sexual
    </v-chip>
    <v-chip
      color="yellow"
      small
      v-if="currentForm.classification.forcedMarriage == true"
    >
      Forced Marriage
    </v-chip>
  </div>
</template>

<script>
export default {
  props: ["currentForm"],
};
</script>
