<template>
  <el-card>

    <el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
      <el-form-item label="公告名称" style="width: 350px">
        <el-input v-model="ruleForm.title"></el-input>
      </el-form-item>

      <el-form-item label="公告摘要 "  style="width: 350px">
        <el-input type="textarea" v-model="ruleForm.summary"></el-input>
      </el-form-item>
      <el-form-item label="有效时间">
        <div class="block">
          <el-date-picker
              v-model="range"
              type="daterange"
              range-separator="至"
              start-placeholder="开始日期"
              end-placeholder="结束日期">
          </el-date-picker>
        </div>
      </el-form-item>

      <el-form-item label="公告权重">
        <el-input-number v-model="ruleForm.sorted" @change="handleChange" :min="1" :max="10" label="描述文字"></el-input-number>
      </el-form-item>
      <el-form-item label="公告内容">
        <mavon-editor ref="md" v-model="ruleForm.content" :ishljs="true" @imgAdd="imgAdd"/>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="addNotice">发布公告</el-button>
      </el-form-item>
    </el-form>
  </el-card>
</template>

<script>
import {serverIp} from "../../../public/config";
import request from "@/utils/request";
import axios from "axios";
import router from "@/router";
export default {
  data() {
    return {
      num: 1,
      range: [],
      pickerOptions: {
        shortcuts: [{
          text: '最近一周',
          onClick(picker) {
            const end = new Date();
            const start = new Date();
            start.setTime(start.getTime() - 3600 * 1000 * 24 * 7);
            picker.$emit('pick', [start, end]);
          }
        }, {
          text: '最近一个月',
          onClick(picker) {
            const end = new Date();
            const start = new Date();
            start.setTime(start.getTime() - 3600 * 1000 * 24 * 30);
            picker.$emit('pick', [start, end]);
          }
        }, {
          text: '最近三个月',
          onClick(picker) {
            const end = new Date();
            const start = new Date();
            start.setTime(start.getTime() - 3600 * 1000 * 24 * 90);
            picker.$emit('pick', [start, end]);
          }
        }]
      },
      ruleForm: {},
      rules: {
        title: [
          { required: true, message: '请输入活动名称', trigger: 'blur' },
          { min: 3, max: 5, message: '长度在 3 到 5 个字符', trigger: 'blur' }
        ]
      }
    };
  },
  methods: {
    handleChange(value) {
      console.log(value);
    },
    addNotice() {
      if(this.range!=null&&this.range.length===1){
        this.ruleForm.startTime=this.range[0];
      }else if(this.range!=null&&this.range.length===2){
        this.ruleForm.startTime=this.range[0];
        this.ruleForm.endTime=this.range[1];
      }
      request.post("/notice/",this.ruleForm).then(res =>{
        if(res) {
          this.$message.success("保存成功")
          this.$router.push({path: '/notice'})
        } else {
          this.$message.error("保存失败")
        }
      })
    },
    resetForm(formName) {
      this.$refs[formName].resetFields();
    },
    // 绑定@imgAdd event
    imgAdd(pos, $file) {
      let $vm = this.$refs.md
      // 第一步.将图片上传到服务器.
      const formData = new FormData();
      formData.append('file', $file);
      axios({
        url: 'http://' + serverIp +':8889/file/upload',
        method: 'post',
        data: formData,
        headers: {'Content-Type': 'multipart/form-data'},
      }).then((res) => {
        // 第二步.将返回的url替换到文本原位置![...](./0) -> ![...](url)
        $vm.$img2Url(pos, res.data);
      })
    },
  }
}
</script>