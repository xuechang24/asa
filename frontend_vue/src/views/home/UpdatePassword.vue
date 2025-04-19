<template>
  <el-dialog title="修改密码" :visible.sync="visible" :append-to-body="true">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="100px">
      <el-form-item label="账号">
        <span>{{ $store.state.userName }}</span>
      </el-form-item>
      <el-form-item label="原密码" prop="password">
        <el-input type="password" v-model="dataForm.password" placeholder="原密码"></el-input>
      </el-form-item>
      <el-form-item label="新密码" prop="newPassword">
        <el-input type="password" v-model="dataForm.newPassword" placeholder="新密码"></el-input>
      </el-form-item>
      <el-form-item label="确认密码" prop="confirmPassword">
        <el-input type="password" v-model="dataForm.confirmPassword" placeholder="确认密码"></el-input>
      </el-form-item>
    </el-form>
    <span slot="footer" class="dialog-footer">
            <el-button @click="visible = false">取消</el-button>
            <el-button type="primary" @click="updatePassword()">确定</el-button>
        </span>
  </el-dialog>
</template>

<script>
export default {
  data() {
    return {
      // userName: ,
      visible: false,
      dataForm: {
        password: '',
        newPassword: '',
        confirmPassword: ''
      },
      dataRule: {
        password: [{
          required: true,
          message: '原密码不能为空',
          trigger: 'blur'
        }],
        newPassword: [{
          required: true,
          message: '新密码不能为空',
          trigger: 'blur'
        }],
        confirmPassword: [{
          required: true,
          message: '确认密码不能为空',
          trigger: 'blur'
        }]
      }
    }
  },
  methods: {
    // 初始化
    init() {
      this.visible = true
      // 初始化清空表单内容
      this.$nextTick(() => {
        this.$refs['dataForm'].resetFields()
      })
    },
    // 表单提交，回到登录界面
    updatePassword() {

      if(this.dataForm.newPassword !== this.dataForm.confirmPassword){
        this.$message({
          message:'两次密码输入不同',
          type: 'error'
        })
        this.dataForm.newPassword = ''
        this.dataForm.confirmPassword = ''
      }else{
        this.$http.updatePassword(this.$store.state.userName,this.dataForm.newPassword).then(response=>{
          // console.log(response)
          //修改密码成功
          if(response.data.success){
            this.$message({
              message:'密码修改成功',
              type: 'success'
            })
            this.$router.push({name: 'Login'})
          }else{
            this.$message({
              message:'密码修改失败',
              type: 'error'
            })
            // 清空输入框
            this.dataForm.password = ''
            this.dataForm.newPassword = ''
            this.dataForm.confirmPassword = ''
          }
        })
      }
    }
  }
}
</script>
