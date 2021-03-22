<template>
  <div class="home">
    <br>
    <h2>Home Page</h2>
    <br>
    <FormTable></FormTable>
  </div>

</template>

<script>
import FormTable from '../components/FormTable'

export default {
  name: 'Home',
  components: {
    FormTable
  }

}
</script>
<style>
.home{
  padding: 15px;
}
</style>