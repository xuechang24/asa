<template>
  <div class="login-wrapper">
    <div class="registry-content">
      <div class="login-main">
        <h2 class="login-main-title">注册</h2>
        <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" status-icon>
          <el-form-item prop="userName">
            <el-input v-model="dataForm.userName" placeholder="帐号"></el-input>
          </el-form-item>
          <el-form-item prop="password">
            <el-input v-model="dataForm.password" type="password" placeholder="密码"></el-input>
          </el-form-item>
          <el-form-item prop="mobile">
            <el-input v-model="dataForm.mobile" placeholder="手机号码"></el-input>
          </el-form-item>
          <el-form-item>
            <el-button class="registry-btn-submit" type="primary" @click="registry()">注册</el-button>
          </el-form-item>
        </el-form>
      </div>
    </div>
  </div>
</template>
<script>

export default {
  data() {
    return {
      dataForm: {
        userName: '',
        password: '',
        mobile:''
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
        }],
        mobile: [{
          required: true,
          message: '手机号不能为空',
          trigger: 'blur'
        }],
      }
    }
  },
  methods: {

    // 提交表单
    registry(){
      this.$http.registry(this.dataForm.userName,this.dataForm.password,this.dataForm.mobile).then(response=>{
        // console.log(response)
        //注册成功
        if(response.data.success){
          this.$message({
            message:'注册成功',
            type: 'success'
          })
          this.$router.push({name: 'Login'})
        }else{
          this.$message({
            message:'注册失败！请尝试更换用户名，或检查手机号码格式是否正确',
            type: 'error'
          })
          // 清空输入框
          this.dataForm.userName = ''
          this.dataForm.password = ''
          this.dataForm.mobile = ''
        }
      })
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

.registry-content {
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
</style>