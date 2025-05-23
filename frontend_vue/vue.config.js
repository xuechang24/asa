const { defineConfig } = require('@vue/cli-service')
module.exports = defineConfig({
  transpileDependencies: true,
  lintOnSave: false,
  devServer: {
    port: 9000,
    proxy:{
      '/api':{
        target:"http://localhost:8888",
        changeOrigin:true,
        ws:true,
        pathRewrite:{
          '^/api':''
        }
      }
    //   '/ai':{
    //     target:"http://localhost:5000",
    //     changeOrigin:true,
    //     pathRewrite:{
    //       '^ai':''
    //     }
    //   }
    }
  }
})
