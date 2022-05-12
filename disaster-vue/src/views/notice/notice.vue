<template>
  <el-container style="min-height: 100vh">
    <el-main>
      <el-card>
        <div style="margin: 0px 0">
          <el-input style="width: 200px" placeholder="请输入名称" suffix-icon="el-icon-search" v-model="title"></el-input>
          <el-button class="ml-5" type="primary" @click="load">搜索</el-button>
          <el-button type="warning" @click="reset">重置</el-button>
        </div>

        <div style="margin: 10px 0">
          <el-popconfirm
              class="ml-5"
              confirm-button-text='确定'
              cancel-button-text='我再想想'
              icon="el-icon-info"
              icon-color="red"
              title="您确定批量删除这些数据吗？"
              @confirm="delBatch"
          >
            <el-button type="danger" v-if="user.role === 'ROLE_ADMIN'" slot="reference">批量删除 <i class="el-icon-remove-outline"></i></el-button>
          </el-popconfirm>
        </div>

        <el-table :data="tableData" border stripe :header-cell-class-name="headerBg" @selection-change="handleSelectionChange">
          <el-table-column type="selection" width="55"></el-table-column>
          <el-table-column prop="id" label="ID" width="80"></el-table-column>
          <el-table-column prop="title" label="公告标题" width="140"></el-table-column>
          <el-table-column prop="summary" label="公告摘要"></el-table-column>
          <el-table-column prop="createTime" label="发布时间" sortable></el-table-column>
          <el-table-column prop="updateTime" label="完成时间" sortable></el-table-column>
          <el-table-column label="操作"  v-if="user.role === 'ROLE_ADMIN'" width="300" align="center">
            <template slot-scope="scope">
              <el-button type="primary" @click="view(scope.row.content)">公告内容<i class="el-icon-s-comment"></i></el-button>
              <el-button type="success" @click="handleEdit(scope.row.id)">编辑 <i class="el-icon-edit"></i></el-button>
              <el-popconfirm
                  class="ml-5"
                  confirm-button-text='确定'
                  cancel-button-text='我再想想'
                  icon="el-icon-info"
                  icon-color="red"
                  title="您确定删除吗？"
                  @confirm="del(scope.row.id)"
              >
                <el-button type="danger" slot="reference">删除 <i class="el-icon-remove-outline"></i></el-button>
              </el-popconfirm>
            </template>
          </el-table-column>
        </el-table>
        <div style="padding: 10px 0">
          <el-pagination
              @size-change="handleSizeChange"
              @current-change="handleCurrentChange"
              :current-page="pageNum"
              :page-sizes="[2, 5, 10, 20]"
              :page-size="pageSize"
              layout="total, sizes, prev, pager, next, jumper"
              :total="total">
          </el-pagination>
        </div>
      </el-card>

      <el-dialog title="公告信息" :visible.sync="dialogFormVisible"  width="60%" >
        <el-form label-width="80px" :model="form" :rules="addRules" size="small" >
          <el-form-item label="公告名称" style="width: 350px">
            <el-input v-model="form.title"></el-input>
          </el-form-item>

          <el-form-item label="公告摘要 "  style="width: 350px">
            <el-input type="textarea" v-model="form.summary"></el-input>
          </el-form-item>
          <el-form-item label="有效时间">
            <div class="block">
              <el-date-picker
                  type="daterange"
                  range-separator="至"
                  v-model="range"
                  start-placeholder="开始日期"
                  end-placeholder="结束日期">
              </el-date-picker>
            </div>
          </el-form-item>

          <el-form-item label="公告权重">
            <el-input-number v-model="form.sorted" @change="handleChange" :min="1" :max="10" label="描述文字"></el-input-number>
          </el-form-item>
          <el-form-item label="公告内容">
            <mavon-editor ref="md" v-model="form.content" :ishljs="true" @imgAdd="imgAdd"/>
          </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
          <el-button @click="dialogFormVisible = false">取 消</el-button>
          <el-button type="primary" @click="save">确 定</el-button>
        </div>
      </el-dialog>

      <el-dialog title="公告内容" :visible.sync="dialogView" width="50%">
        <el-card>
          <div>
            <mavon-editor
                class="md"
                :value="content"
                :subfield="false"
                :defaultOpen="'preview'"
                :toolbarsFlag="false"
                :editable="false"
                :scrollStyle="true"
                :ishljs="true"
            />
          </div>
        </el-card>
      </el-dialog>
    </el-main>

  </el-container>
</template>

<script>
import request from "@/utils/request";
import axios from "axios";
import {serverIp} from "../../../public/config";
export default {
  name: 'Home',
  data() {
    return {
      user: [],
      range: [],
      content: '',
      tableData: [],
      total: 0,
      pageNum: 1,
      pageSize: 10,
      title: "",
      form: {},
      dialogFormVisible: false,
      dialogView: false,
      multipleSelection: [],
      collapseBtnClass: 'el-icon-s-fold',
      isCollapse: false,
      sideWidth: 200,
      logoTextShow: true,
      headerBg: 'headerBg',
      addRules: {
        title: [
          { required: true, message: "请输入公告标题", trigger: "blur" },
          { min: 3, max: 10, message: "长度在 3 到 10 个字符", trigger: "blur" }
        ],
        content: [
          { required: true, message: "请输入公告内容", trigger: "blur" },
          { min: 4, max: 12, message: "长度在 4 到 12 个字符", trigger: "blur" }
        ],
      } //添加验证
    }
  },
  created() {
    let user = localStorage.getItem("user") ? JSON.parse(localStorage.getItem("user")) : null
    this.user = user
    // 请求分页查询数据
    this.load()
  },
  methods: {
    handleChange(value) {
      console.log(value);
    },
    collapse() {  // 点击收缩按钮触发
      this.isCollapse = !this.isCollapse
      if (this.isCollapse) {  // 收缩
        this.sideWidth = 64
        this.collapseBtnClass = 'el-icon-s-unfold'
        this.logoTextShow = false
      } else {   // 展开
        this.sideWidth = 200
        this.collapseBtnClass = 'el-icon-s-fold'
        this.logoTextShow = true
      }
    },
    load() {
      request.get("/notice/", {
        params: {
          pageNum: this.pageNum,
          pageSize: this.pageSize,
          title: this.title,
        }
      }).then(res => {
        console.log(res);
        this.tableData = res.data.records;
        this.total = res.data.total;
      })
    },
    handleSelectionChange(val) {
      console.log(val)
      this.multipleSelection = val
    },
    //重置
    reset() {
      this.title = "";
    },
    //添加的表单数据
    handleAdd() {
      this.dialogFormVisible = true;
      this.form = {}
    },
    //刪除
    del(id) {
      request.delete("/notice/"+id).then(res => {
        if(res) {
          this.$message.success("删除成功");
          this.load();
        } else {
          this.$message.error("删除成功");
        }
      })
    },
    view(content){
      this.content = content;
      this.dialogView = true;
    },
    handleSizeChange(pageSize) {
      console.log(pageSize)
      this.pageSize = pageSize
      this.load()
    },
    handleCurrentChange(pageNum) {
      console.log(pageNum)
      this.pageNum = pageNum
      this.load()
    },
    handleEdit(id) {
      request.get("/notice/getNotice/"+id).then(res =>{
        this.form = res.data;
        this.range[0] = res.data.startTime;
        this.range[1] = res.data.endTime;
        this.$set(this.range,res.data.startTime,res.data.endTime)
      })
      this.dialogFormVisible = true
    },
    save() {
      request.post("/notice/",this.form).then(res => {
        if (res) {
          this.$message.success("保存成功")
          this.dialogFormVisible = false
          this.load()
        } else {
          this.$message.error("保存失败")
        }
      })
    },
    //批量刪除
    delBatch() {
      let ids = this.multipleSelection.map(v => v.id)  // [{}, {}, {}] => [1,2,3]
      this.request.post("/notice/del/batch", ids).then(res => {
        if (res.code === '200') {
          this.$message.success("批量删除成功")
          this.load()
        } else {
          this.$message.error("批量删除失败")
        }
      })
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

<style>
.headerBg {
  background: #eee!important;
}
</style>
