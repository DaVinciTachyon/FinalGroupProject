<template>
  <v-card class="more-info">
    <h3>Form ID: {{ currentForm._id }}</h3>
    <v-divider></v-divider>
    <b>Incident Date:</b> {{ currentForm.incidentDate }}
    <br />
    <b>Gender:</b> {{ currentForm.gender }}
    <br />
    <b>Age Range:</b> {{ currentForm.ageRange }}
    <br />
    <b>Community:</b> {{ currentForm.community }}
    <br />
    <v-divider></v-divider>
    
    <div
      v-if="Object.values(currentForm.classification.physical).includes(true)"
    >
    <h3>Classification</h3>
      <b>Physical</b>
      <ul>
        <li v-if="currentForm.classification.physical.hitting">
          Hitting.
        </li>
        <li v-if="currentForm.classification.physical.pushing">
          Pushing.
        </li>
        <li v-if="currentForm.classification.physical.choking">
          Choking.
        </li>
        <li v-if="currentForm.classification.physical.burning">
          Burning.
        </li>
        <li v-if="currentForm.classification.physical.weaponUsage">
          Weapon usage.
        </li>
        <li v-if="currentForm.classification.physical.acid">
          Acid.
        </li>
        <li v-if="currentForm.classification.physical.painfulAttack">
          Painful attack.
        </li>
      </ul>
    </div>
    <div
      v-if="Object.values(currentForm.classification.psychological).includes(true)"
    >
      <b>Psychological</b>
      <ul>
        <li v-if="currentForm.classification.psychological.violenceThreats">
          Violence threats.
        </li>
        <li v-if="currentForm.classification.psychological.murderThreats">
          Murder threats.
        </li>
        <li v-if="currentForm.classification.psychological.intimidation">
          Intimidation.
        </li>
        <li v-if="currentForm.classification.psychological.humiliation">
          Humiliation.
        </li>
        <li v-if="currentForm.classification.psychological.stalking">
          Stalking.
        </li>
        <li v-if="currentForm.classification.psychological.verbalHarrassment">
          Verbal harassment.
        </li>
        <li v-if="currentForm.classification.psychological.unwantedAttention">
          Unwanted attention.
        </li>
        <li v-if="currentForm.classification.psychological.nonVerbalThreats">
          Non-verbal threats.
        </li>
        <li v-if="currentForm.classification.psychological.propertyDestruction">
          Property destruction.
        </li>
        <li v-if="currentForm.classification.psychological.custody">
          Custody.
        </li>
        <li v-if="currentForm.classification.psychological.childThreats">
          Child threats.
        </li>
      </ul>
    </div>
    <div
      v-if="Object.values(currentForm.classification.sexual).includes(true)"
    >
      <b>Sexual</b>
      <ul>
        <li v-if="currentForm.classification.sexual.genitalTouching">
          Genital touching.
        </li>
        <li v-if="currentForm.classification.sexual.genitalMutilation">
          Genital mutilation.
        </li>
        <li v-if="currentForm.classification.sexual.attemptedRape">
          Attempted rape.
        </li>
        <li v-if="currentForm.classification.sexual.rape">
          Rape.
        </li>
      </ul>
    </div>
    <div
      v-if="currentForm.classification.forcedMarriage"
    >
      <b>Forced Marriage</b>
    </div>
    <v-divider></v-divider>
    <div
      v-if="Object.values(currentForm.seekedAttention).includes(true)"
    >
    <h3>Seeked Attention</h3>
      <ul>
        <li v-if="currentForm.seekedAttention.information">
          Information.
        </li>
        <li v-if="currentForm.seekedAttention.legal">
          Legal.
        </li>
        <li v-if="currentForm.seekedAttention.psychosocial">
          Psychosocial.
        </li>
        <li v-if="currentForm.seekedAttention.medical">
          Medical.
        </li>
        <li v-if="currentForm.seekedAttention.other">
          Other.
        </li>
      </ul>
    </div>
    <v-divider></v-divider>
    <div
      v-if="Object.values(currentForm.offeredAttention).includes(true)"
    >
    <h3>Offered Attention</h3>
      <ul>
        <li v-if="currentForm.offeredAttention.information">
          Information.
        </li>
        <li v-if="currentForm.offeredAttention.legal">
          Legal.
        </li>
        <li v-if="currentForm.offeredAttention.psychosocial">
          Psychosocial.
        </li>
        <li v-if="currentForm.offeredAttention.medical">
          Medical.
        </li>
        <li v-if="currentForm.offeredAttention.refuge">
          Refuge.
        </li>
        <li v-if="currentForm.offeredAttention.other">
          Other.
        </li>
      </ul>
    </div>
    <v-divider></v-divider>
    <div
      v-if="Object.values(currentForm.referredAttention).includes(true)"
    >
    <h3>Referred Attention</h3>
      <ul>
        <li v-if="currentForm.referredAttention.legal">
          Legal.
        </li>
        <li v-if="currentForm.referredAttention.psychosocial">
          Psychosocial.
        </li>
        <li v-if="currentForm.referredAttention.medical">
          Medical.
        </li>
        <li v-if="currentForm.referredAttention.other">
          Other.
        </li>
      </ul>
    </div>
    <v-divider></v-divider>
    <div
      v-if="Object.values(currentForm.rightDenied).includes(true)"
    >
    <h3>Rights Denied</h3>
      <ul>
        <li v-if="currentForm.rightDenied.economicResources">
          Economic resources.
        </li>
        <li v-if="currentForm.rightDenied.opportunities">
          Opportunities.
        </li>
        <li v-if="currentForm.rightDenied.education">
          Education.
        </li>
        <li v-if="currentForm.rightDenied.healthcare">
          Healthcare.
        </li>
        <li v-if="currentForm.rightDenied.resourceConflict">
          Resource conflict.
        </li>
        <li v-if="currentForm.rightDenied.other">
          Other.
        </li>
      </ul>
    </div>
    <v-divider></v-divider>
    <div>
    <h3>Perpetrator Information</h3>
      <ul>
        <li>
          <b>Gender:</b> {{currentForm.perpetrator.gender}}.
        </li>
        <li v-if="currentForm.perpetrator.isKnown">
          Perpetrator is known.
        </li>
        <li v-else>
          Perpetrator is not known.
        </li>
        <li>
          <b>Relationship:</b> {{currentForm.perpetrator.relationship}}.
        </li>
        <li v-if="currentForm.rightDenied.resourceConflict">
          Resource conflict.
        </li>
        <li v-if="currentForm.rightDenied.other">
          Other.
        </li>
      </ul>
    </div>
    <br />
  </v-card>
</template>

<script>
export default {
  props: ["currentForm"],
};
</script>

<style>
.more-info{
    padding: 15px;
}
</style>
