<template>
  <div>
    <!-- 添加问题 -->
    <el-card>
      <el-row>
        <el-col :span="24"><div class="grid-content bg-purple-dark" align="left">
          <h1>常规异常管理</h1>
        </div></el-col>
      </el-row>

      <!-- 表单 -->
      <el-form ref="form" :model="form" label-width="80px">

        <el-form-item label="类别选择">
          <el-select v-model="value" placeholder="请选择">
            <el-option
              v-for="item in items"
              :key="item.itemId"
              :label="item.item"
              :value="item.itemId">
            </el-option>
          </el-select>
          <el-button type="primary" @click="getQuestionsByItemId" style="margin-left:10px">查询相关问题</el-button>
        </el-form-item>

        <el-form-item label="问题">
          <el-input v-model="form.question"></el-input>
        </el-form-item>

        <el-form-item label="答案">
          <el-input v-model="form.answer" type="textarea"></el-input>
        </el-form-item>

        <el-form-item>
          <el-button type="primary" @click="addQuestion">添加</el-button>
          <el-button>取消</el-button>
        </el-form-item>
      </el-form>  
    </el-card>
    <!-- 相关问题展示及管理 -->
    <el-card>
      <el-row>
        <el-col :span="24">
          <div class="grid-content bg-purple-dark" align="left">
            <h1>相关问题</h1>
            <!-- <el-button type="primary" @click="getQuestionItems" style="margin-left:10px">查询</el-button> -->
          </div>
        </el-col>

        <!--    显示表格-->
        <el-table
            :data="questionList"
            style="width: 100%">

          <el-table-column
              label="问题"
              width="200">
            <template slot-scope="scope">
              <span style="margin-left: 10px">{{ scope.row.question }}</span>
            </template>
          </el-table-column>
          <el-table-column
              label="答案"
              width="500">
            <template slot-scope="scope">
              <span style="margin-left: 10px">{{ scope.row.answer }}</span>
            </template>
          </el-table-column>

          <el-table-column label="操作">
            <template slot-scope="scope">
              <el-button
                  size="mini"
                  @click="handleEdit(scope.$index, scope.row)">编辑</el-button>
              <el-button
                  size="mini"
                  type="danger"
                  @click="handleDelete(scope.$index, scope.row)">删除</el-button>
            </template>
          </el-table-column>

        </el-table>
      </el-row>
    </el-card>

    <el-dialog
      title="更新"
      :visible.sync="dialogVisible"
      width="80%"
      :before-close="handleClose">

      <el-form :model="updateQues" label-width="100px">
          <!-- <el-form-item label="id">
           {{this.dataForm.id}}
          </el-form-item> -->
        <el-form-item label="问题">
          <el-input v-model="updateQues.question" placeholder="问题"></el-input>
        </el-form-item>
        <el-form-item label="答案">
          <el-input v-model="updateQues.answer" placeholder="答案" type="textarea"></el-input>
        </el-form-item>

      </el-form>

      <span slot="footer" class="dialog-footer">
        <el-button @click="dialogVisible = false">取 消</el-button>
        <el-button type="primary" @click="updateQuestion">确 定</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>

/**
 *     "0": "����daisy",
    "1": "�ѹ�Ӣdandelion",
    "2": "õ�廨roses",
    "3": "���տ�sunflowers",
    "4": "������tulips"
 */

export default {
  name: "TroubleShooting",
  data() {
    return {
      dialogVisible: false,
      form:{
        question:'',
        answer:''
      },
      items: [],
      value: '',
      questionList:[],
      updateQues:{},
      dataForm: {}
    }
  },
  methods:{
    handleClose(done) {
        this.$confirm('确认关闭？')
          .then(_ => {
            done();
          })
          .catch(_ => {});
      },
    addQuestion(){
      
      this.$http.questions.addQuestion(this.form.question,this.form.answer,this.value).then(response=>{
          // console.log(response)
          if(response.data.success){
            this.$message({
            message:'添加成功',
            type: 'success'
          })
          this.form.question = ''
          this.form.answer = ''

          }else{
            this.$message({
            message:'添加失败',
            type: 'error'
          })
          }
      })
    },
    // (1,{})
    handleEdit(index,row){
      this.dialogVisible = true
      // console.log(index,row)
      //将该row的数据赋值给dataForm
      this.dataForm = row
      this.updateQues = row
    },
    handleDelete(index,row){
      console.log(index,row)
      
      this.$http.questions.deleteQuestionById(row.id).then(response=>{
        console.log(response)
      })
    },
    getQuestionItems(){
      this.$http.questionItem.getQuestionItems().then(response=>{
        // console.log(response.data.data['message'])
        this.items = response.data.data['data']
      })
    },
    getQuestionsByItemId(){
      this.$http.questions.getQuestionsByItemId(this.value).then(response=>{
        // console.log(response.data.data.data)
        this.questionList = response.data.data.data
      })
    },
    updateQuestion(){
      
      this.$http.questions.updateQuestion(this.dataForm.id,this.updateQues.question,this.updateQues.answer).then(response=>{
        // console.log(response.data.success)
        if(response.data.success){
          this.$message({
            message:'更新成功',
            type: 'success'
          })
        }else{
          this.$message({
            message:'更新失败',
            type: 'error'
          })
        }
    })

      // 关闭dialog
      this.dialogVisible = false
    },
  },
  mounted(){
    this.getQuestionItems()
  },
  component:{
    
  }
}
</script>

<style scoped>

</style>