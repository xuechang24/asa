<template>
  <div>
    <!-- 系统 Logo -->
    <el-aside class="header-logo" :width="asideWidth">
      <div @click="$router.push({ name: 'Home' })">
        <a v-if="foldAside">售后助手</a>
        <a v-else>
          asa
        </a>
      </div>
    </el-aside>
    <el-aside class="aside" :width="asideWidth" :class='"icon-size-" + iconSize'>
      <el-scrollbar style="height: 100%; width: 100%;">
        <!--
                default-active 表示当前选中的菜单，默认为 home。
                collapse 表示是否折叠菜单，仅 mode 为 vertical（默认）可用。
                collapseTransition 表示是否开启折叠动画，默认为 true。
                background-color 表示背景颜色。
                text-color 表示字体颜色。
            -->
        <el-menu :default-active="menuActiveName || 'home'" :collapse="!foldAside" :collapseTransition="false"
                 background-color="#263238" text-color="#8a979e">
          <el-menu-item index="home" @click="$router.push({ name: 'Home' })">
            <i class="el-icon-s-home"></i>
            <span slot="title">简介</span>
          </el-menu-item>

          <el-menu-item index="Trouble" @click="$router.push({ name: 'Trouble' })">
            <i class="el-icon-s-tools"></i>
            <span slot="title">故障</span>
          </el-menu-item>

          <el-menu-item index="TroubleShooting" @click="$router.push({ name: 'TroubleShooting' })">
            <i class="el-icon-info"></i>
            <span slot="title">问题</span>
          </el-menu-item>

          <el-menu-item index="Info" @click="$router.push({ name: 'Info' })">
            <i class="el-icon-info"></i>
            <span slot="title">信息</span>
          </el-menu-item>


<!--          <el-submenu index="demo">-->
<!--            <template slot="title">-->
<!--&lt;!&ndash;              <i class="el-icon-star-off"></i>&ndash;&gt;-->
<!--              <span>功能</span>-->
<!--            </template>-->
<!--            <el-menu-item index="demo-echarts" @click="$router.push({ name: 'Echarts' })">-->
<!--              <i class="el-icon-s-data"></i>-->
<!--              <span slot="title">echarts</span>-->
<!--            </el-menu-item>-->
<!--            <el-menu-item index="demo-ueditor" @click="$router.push({ name: 'Ueditor' })">-->
<!--              <i class="el-icon-document"></i>-->
<!--              <span slot="title">ueditor</span>-->
<!--            </el-menu-item>-->

<!--          </el-submenu>-->
        </el-menu>
      </el-scrollbar>
    </el-aside>
  </div>
</template>

<script>
export default {
  name: 'Aside',
  props: ['foldAside'],
  data() {
    return {
      // 保存当前选中的菜单
      menuActiveName: 'home',
      // 保存当前侧边栏的宽度
      asideWidth: '100px',
      // 用于拼接当前图标的 class 样式
      iconSize: 'true'
    }
  },
  watch: {
    // 监视是否折叠侧边栏，折叠则宽度为 64px。
    foldAside(val) {
      this.asideWidth = val ? '100px' : '0px'
      this.iconSize = val
    }
  }
}
</script>

<style>
.aside {
  margin-bottom: 0;
  height: 100%;
  max-height: calc(100% - 50px);
  width: 100%;
  max-width: 100px;
  background-color: #263238;
  text-align: left;
  right: 0;
}

.header-logo {
  background-color: #17b3a3;
  text-align: center;
  height: 50px;
  line-height: 50px;
  width: 200px;
  font-size: 24px;
  color: #fff;
  font-weight: bold;
  margin-bottom: 0;
  cursor: pointer;
}

.el-submenu .el-menu-item {
  max-width: 100px !important;
}
.el-scrollbar__wrap {
  overflow-x: hidden !important;
}
.icon-size-false i {
  font-size: 25px !important;
}
.icon-size-true i {
  font-size: 18px !important;
}
</style>