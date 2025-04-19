<template>
  <div class="functionPage1">

    <!-- ai功能展示ui -->
    <el-card class="uploadAndPred">
      <h1>上传图片进行预测</h1>

      <!--uploadUrl:"http://192.168.31.185:8888/files/upload", -->
      <el-upload
          class="upload_demo"
          action= "http://192.168.31.185:8888/files/upload"

          :on-success="getAllFiles"

          :file-list="fileList">
        <el-button size="mini" type="primary">点击上传</el-button>
        <div slot="tip" class="el-upload__tip">只能上传jpg/png文件，且不超过500kb</div>
      </el-upload>
      
      <!--图片展示-->
      <el-container>
        <!-- <el-aside width="300px"></el-aside> -->
        <el-main>
          <!-- <el-card class="block" style="width: 250px;height: 250px;"> -->
            <el-image class="imagePreview" :src=this.storagePath>
              <div slot="placeholder" class="image-slot">
                加载中<span class="dot">...</span>
              </div>
            </el-image>
          <!-- </el-card> -->
        </el-main>

        <el-aside style="width: 60px;">
          <span>
            <el-button size="mini" type="primary" style="margin-top:50px;" @click="getPredict" round>预测</el-button>
          </span>
          <span>
            <el-button size="mini" type="primary"  @click="deleteFileById" round>清除</el-button>
          </span>
        </el-aside>

        <el-main style="width:50px;margin-left: 10px;">
          <!-- <el-card style="width: 250px;height: 250px;"> -->
            <h1 style="margin-top: 50px;">{{ this.pred }}</h1>
          <!-- </el-card>   -->
        </el-main>
        <!-- <el-aside width="100px"></el-aside> -->
      </el-container>

      <el-row>
        <el-col :span="24">
          <div class="grid-content">
            <!-- <h1>常规异常示例</h1> -->
            <!-- 获取问题的按钮 -->
            <span>
              <el-button size="mini" type="primary"  @click="getQuestionsByItemId" round>查询该类常用问题</el-button>
            </span>
            
            <el-row v-for="question in questionList" :key="question.id">
              <!-- 悬停显示内容 -->
              <el-popover
                placement="top-start"
                title="回答"
                width="150"
                trigger="hover"
                :content= question.answer>
                <el-button slot="reference">
                  {{question.question}}
                </el-button>
              </el-popover>
            </el-row>
          </div>
        </el-col>
      </el-row>
    </el-card>

    <el-card>
      <el-row>
        <el-col :span="24">
        <div class="grid-content">
          智能问答助手
        </div>
        <!-- 嵌入bot iframe-->
        <iframe :src="pageUrl" width="100%" height="500px" frameborder="0"></iframe>
        </el-col>
        <!-- <iframe
        src="http://192.168.189.130/chatbot/30dzvcFlZHyRDX6E"
        style="width: 100%; height: 100%; min-height: 700px"
        frameborder="0"
        allow="microphone">
        </iframe> -->
      </el-row>
    </el-card>

  </div>
</template>

<script>
import axios from 'axios'

// 创建 axios 实例
const http_python = axios.create({
    // 统一 url 配置，定义访问前缀 baseURL
    baseURL: 'http://192.168.31.185:5000',
    // 定义请求超时时间
    timeout: 10000,
    // proxy:{
    //     host:'192.168.31.185',
    //     port:5000
    // },
    // // 请求带上 cookie
    // withCredentials: true,
    // // 定义消息头
    // headers: {
    //     'Content-Type': 'application/json; charset=utf-8'
    // }
})

export default {
  name: "Trouble",
  data(){
    return{
      files:[],
      link:'',
      fileList:[],
      srcList: [],
      file:{},
      fileId:'',
      storagePath:'',
      pred:'',
      questionItem:{},
      questionList:[],
      pageUrl:'../../../../bot.html'
    }
  },
  methods:{
    getAllFiles(){
      let that = this

      this.$http.file.getAllFiles().then(res => {
        // console.log(res.data.data.message)
        if(res.data.data.message){
          // console.log(res.data.data.message[0])
          that.file = res.data.data.message[0]
          that.fileId = res.data.data.message[0].id
          that.storagePath = res.data.data.message[0].storagePath
          that.pred = ''
        }else {
          console.log("获取files失败")
        }
      }).catch(error => {
        console.log(error)
      })
    },
    getPredict(){
      let that = this
      if(this.storagePath!=''){
        http_python({
          url: '/app/classification',
          method: 'post',
          data:{
            storagePath:this.storagePath
          }
        }).then(res=>{
        // console.log(res.data)
        that.pred = res.data
      })
      }else{
        this.$message({
            message:'请先上传图片',
            type: 'info'
        })
      }

    },
    deleteFileById(){
      let that = this

      if(this.storagePath!=''){
        this.$http.file.deleteFileById(this.fileId).then(res=>{
        // console.log(res)
        if(res.data.success){
          // console.log("删除成功")
          // alert("删除成功")
          // this.getAllFiles()

          this.storagePath = ''
          this.pred = ''
          this.questionList=[]

        }else{
          console.log("删除失败")
        }
        }).catch(error=>{
          console.log(error)
        })
      }else{
        this.$message({
            message:'没东西需要清除',
            type: 'info'
        })
      }
    },
    
    getQuestionItemByItem(){

    },
    getQuestionsByItemId(){
      // 如果没有进行预测 就提示
      if(this.pred!=''){
        this.$http.questionItem.getQuestionItemByItem(this.pred).then(response=>{
          // console.log(response.data.data.data.itemId);
          if(response.data.data.data!=null){
              this.$http.questions.getQuestionsByItemId(response.data.data.data.itemId).then(response=>{
                // console.log(response.data.data.data)
                this.questionList = response.data.data.data
                // console.log(this.questionList);
            })
          }else{
            this.$message({
              message:'没有查询到任何数据',
              type:'error'
            })
          }

        })
      }else{
        this.$message({
          message:'请先进行预测',
          type:'info'
        })
      }
    },

    preview(path){
      this.srcList = []
      this.srcList.push(path)
    },

    handleRemove(file, fileList) {
      console.log(file, fileList);
    },
    handlePreview(file) {
      console.log(file);
    },
    handleExceed(files, fileList) {
      this.$message.warning(`当前限制选择 3 个文件，本次选择了 ${files.length} 个文件，共选择了 ${files.length + fileList.length} 个文件`);
    },
    beforeRemove(file, fileList) {
      return this.$confirm(`确定移除 ${ file.name }？`);
    }
  },
  mounted() {
    // this.getAllFiles()
  }
}
</script>

<style scoped>
.bg-purple {
  background: #d3dce6;
  height: 100vh;
}
.bg-purple-light {
  background: #e5e9f2;
  height: 100vh;
}

/* ai功能ui */
.time {
  font-size: 13px;
  color: #999;
}

.bottom {
  margin-top: 13px;
  line-height: 12px;
}

/* .button {
  padding: 5px;
  float: right;
} */

.image {
  width: 100%;
  display: block;
}

.clearfix:before,
.clearfix:after {
  display: table;
  content: "";
}

.clearfix:after {
  clear: both
}

.block {
  width: 400px;
}

.imagePreview{
  width: 100px;
  height: 100px;
}

.functionPage{
  height: 100vh;
  overflow-y: scroll;
  max-width: 100vw;
  margin: 0 auto;
  background: white;
}

.troubleShooting{
  margin-top: 10px;
}

</style>