<template>
  <div class="login-wrapper">
    <div class="login-content">
      <div class="login-main">
        <h2 class="login-main-title">登录</h2>
        <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" status-icon>
          <el-form-item prop="userName">
            <el-input v-model="dataForm.userName" placeholder="帐号"></el-input>
          </el-form-item>
          <el-form-item prop="password">
            <el-input v-model="dataForm.password" type="password" placeholder="密码"></el-input>
          </el-form-item>
          <el-form-item>
            <el-button class="login-btn-submit" type="primary" @click="dataFormSubmit()">登录</el-button>
<!--            <el-button class="registry-btn-submit" type="primary" @click="registryPage()">注册</el-button>-->
          </el-form-item>
          <el-form-item>
            <el-link class="registryTag" type="primary" href="/Registry">注册</el-link>
            <el-link class="updatePasswordTag" type="primary" href="/UpdatePassword">修改密码</el-link>
          </el-form-item>

        </el-form>
      </div>
    </div>
  </div>
</template>
<script>
import{mapActions} from "vuex";
import { setToken } from '@/http/auth.js'

export default {
  data() {
    return {
      dataForm: {
        userName: '',
        password: ''
      },
      dataRule: {
        userName: [{
          required: true,
          message: '帐号不能为空',
          trigger: 'blur'
        }],
        password: [{
          required: true,
          message: '密码不能为空',
          trigger: 'blur'
        }]
      }
    }
  },
  methods: {

    //引入vuex中user.js中的updateName方法
    ...mapActions(['updateName']),
    // 提交表单
    dataFormSubmit() {

      this.$http.login.getToken(this.dataForm.userName,this.dataForm.password).then(response=>{
        // console.log(response)
        if(response.data.data['token'] != null){
          this.$message({
            message:'登录成功',
            type: 'success'
          })
          // 保存token值
          setToken(response.data.data.token)
          this.updateName(this.dataForm.userName)
          //将更新后的state存入localStorage
          // localStorage.setItem("store",JSON.stringify(this.$store.state))
          this.$router.push({name: 'Home'})
        }else {
          this.$message({
            message:'登录失败',
            type: 'error'
          })
          // 清空输入框
          this.dataForm.userName = ''
          this.dataForm.password = ''
        }
      })
    },

    registryPage(){
      this.$router.push({name: 'Registry'})
    }

  }
}
</script>
<style>
.login-wrapper {
  position: absolute;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  overflow: hidden;
  background-color: rgba(38, 50, 56, .6);
  background: url(~@/assets/login_bg.jpg) no-repeat;
  background-size: 100% 100%;
}

.login-content {
  position: absolute;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  margin: auto;
  height: 350px;
  width: 400px;
  background-color: #112234;
  opacity: .8;
}

.login-main {
  color: beige;
  padding: 20px 20px 10px 20px;
}

.updatePasswordTag{
  padding: 0px 0px 0px 10px;
}
</style>