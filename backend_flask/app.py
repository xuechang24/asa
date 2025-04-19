# 导入Flask类
from flask import Flask,jsonify,request
#跨域
from flask_cors import CORS
import json
import requests
import time

from predict import predict 

# 实例化，可视为固定格式
app = Flask(__name__)
CORS(app, resources=r'/*')
 
# route()方法用于设定路由；类似spring路由配置
@app.route('/app/classification',methods=['POST'])
def classification():

    if request.method == 'POST':

        # 获取vue中传递的值
        # GetMSG = request.get_data(as_text=True)
        GetMSG = request.get_json()['storagePath']
        # print(GetMSG)
        resp = requests.get(GetMSG)
        
        if resp.status_code ==200:
            #获取后缀
            suffix = GetMSG.split(".")[-1]
            filename = "test."+suffix
            #保存图片
            with open(filename, "wb") as file:
                file.write(resp.content)
            #进行预测
            pred = predict(filename)
            #返回预测结果
            return pred
    else:
        return 'defeat'

if __name__ == '__main__':
    # app.run(host, port, debug, options)
    # 默认值：host="127.0.0.1", port=5000, debug=False
    app.run(host="0.0.0.0", port=5000)