<template>
  <!--
      v-loading、element-loading-text、element-loading-background、element-loading-spinner 用于定义加载的样式
   -->
  <el-container class="container" v-loading="false" element-loading-text="拼命加载中"
                element-loading-background="rgba(0, 0, 0, 0.8)"
                element-loading-spinner="el-icon-loading">
    <!-- 侧边栏 -->
    <Aside :foldAside="foldAside"/>
    <!--
        direction="vertical"  用于垂直布局
    -->
    <el-container direction="vertical">
      <!-- 头部导航栏 -->
      <Header @foldOrOpenAside="foldOrOpen"/>
      <!-- 内容 -->
      <Content/>
    </el-container>
  </el-container>
</template>

<script>
import Header from '@/views/home/Header.vue'
import Aside from '@/views/home/Aside.vue'
import Content from '@/views/home/Content.vue'

export default {
  name: 'Home',
  components: {
    Header,
    Aside,
    Content
  },
  data() {
    return {
      foldAside: false
    }
  },
  methods: {
    foldOrOpen(data) {
      this.foldAside = data
    }
  },
  created() {
    // //在页面加载时读取localStorage里的状态信息
    // if (localStorage.getItem("store") ) {
    //   this.$store.replaceState(Object.assign({}, this.$store.state,JSON.parse(localStorage.getItem("store"))))
    // }
    //
    // //在页面刷新时将vuex里的信息保存到localStorage里
    // window.addEventListener("beforeunload",()=>{
    //   localStorage.setItem("store",JSON.stringify(this.$store.state))
    // })
  }
}
</script>
<style>
.container {
  height: 100%;
}
</style>