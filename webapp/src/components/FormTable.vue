<template>
  <v-card class="card">
    <v-card-title>
      Form Table
      <v-spacer></v-spacer>
      <v-text-field
        v-model="search"
        append-icon="mdi-magnify"
        label="Search"
        single-line
        hide-details
      ></v-text-field>
    </v-card-title>
    <v-data-table 
    :items="forms.forms" 
    :headers="headers" 
    class="elevation-1"
    :search="search">
      <template v-slot:item.incidentDate="{ item }">
        {{ timeConverter(item.incidentDate) }}
      </template>
      <template v-slot:item.classification="{ item }">
        <FormClassification v-bind:currentForm="item"></FormClassification>
      </template>
      <template v-slot:item.viewMore="{ item }">
        <ViewMoreBtn v-bind:currentForm="item"></ViewMoreBtn>
      </template>
    </v-data-table>
  </v-card>

  <!--
  <div>
    <v-simple-table>
      <template v-slot:default>
        <thead>
          <tr>
            <th class="text-left">
              Incident Date
            </th>
            <th class="text-left">
              Gender
            </th>
            <th class="text-left">
              Age Range
            </th>
            <th class="text-left">
              Community
            </th>
            <th class="text-left">
              Classification
            </th>
            <th class="text-left"></th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="form in forms.forms" :key="form._id">
            <td>{{ timeConverter(form.incidentDate) }}</td>
            <td>{{ form.gender }}</td>
            <td>{{ form.ageRange }}</td>
            <td>{{ form.community }}</td>
            <td>
              <FormClassification
                v-bind:currentForm="form"
              ></FormClassification>
            </td>
            <td><ViewMoreBtn v-bind:currentForm="form"></ViewMoreBtn></td>
          </tr>
        </tbody>
      </template>
    </v-simple-table>
    {{ forms.forms }}
  </div>
  -->
</template>

<script>
import axios from "axios";
import ViewMoreBtn from "./ViewMoreBtn";
import FormClassification from "./FormClassification";

export default {
  components: {
    ViewMoreBtn,
    FormClassification,
  },
  data() {
    return {
      forms: {},
      errors: [],
      hello: "hello",
      search: '',
      headers: [
        {
          text: "Incident Date",
          align: "start",
          sortable: false,
          value: "incidentDate",
        },
        {
          text: "Gender",
          value: "gender",
        },
        {
          text: "Age Range",
          value: "ageRange",
        },
        {
          text: "Community",
          value: "community",
        },
        {
          text: "Classification",
          value: "classification",
        },
        {
          text: "",
          value: "viewMore",
        },
      ],
    };
  },

  methods: {
    timeConverter: function(UNIX_timestamp) {
      var a = new Date(UNIX_timestamp);
      var months = [
        "Jan",
        "Feb",
        "Mar",
        "Apr",
        "May",
        "Jun",
        "Jul",
        "Aug",
        "Sep",
        "Oct",
        "Nov",
        "Dec",
      ];
      var year = a.getFullYear();
      var month = months[a.getMonth()];
      var date = a.getDate();
      var time = date + " " + month + " " + year + " ";
      return time;
    },
  },

  created() {
    axios
      .get("http://localhost:8080/api/forms/")
      .then((response) => {
        this.forms = response.data;
      })
      .catch((e) => {
        this.errors.push(e);
      });
  },
};
</script>
<style>
  .card{
    padding:5px;
  }
</style>