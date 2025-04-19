<template>
  <el-main class="content">

    <keep-alive>
      <router-view />
    </keep-alive>

  </el-main>
</template>

<script>
export default {
  name: 'Content'
}
</script>

<style>
.content {
  background-color: #f1f4f5;
}
.card {
  height: 100%;
}
</style>