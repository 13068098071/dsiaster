<template>
  <el-container style="min-height: 100vh">
    <el-container>
      <el-main>
        <el-card>
          <div style="margin: 0px 0">
            <el-select
                clearable
                v-model="departmentId"
                placeholder="请选择所属部门"
            >
              <el-option
                  v-for="department in departments"
                  :label="department.name"
                  :key="department.id"
                  :value="department.id"
              >
                <span style="float: left">{{ department.name }}</span>
                <span style="float: right; color: #8492a6; font-size: 13px">
                <el-tag size="small" effect="plain" type="success">
                  {{ department.total }}人
                </el-tag>
              </span>
              </el-option>
            </el-select>
            <el-input style="width: 200px" placeholder="请输入名称" suffix-icon="el-icon-user" v-model="username"></el-input>
            <el-input style="width: 200px" placeholder="请输入邮箱" suffix-icon="el-icon-message" v-model="email"></el-input>

            <span>&nbsp;&nbsp;</span>
            <el-radio v-model="sex" label="1">  男</el-radio>
            <el-radio v-model="sex" label="0">女</el-radio>
            <el-radio v-model="sex" label>全部</el-radio>

            <el-button class="ml-5" type="primary" @click="load">搜索</el-button>
            <el-button type="warning" @click="reset">重置</el-button>
          </div>


          <div style="margin: 10px 0">
            <el-button type="primary" v-if="user.role === 'ROLE_ADMIN'" @click="handleAdd">新增 <i class="el-icon-circle-plus-outline"></i></el-button>
            <el-popconfirm
                class="ml-5"
                confirm-button-text='确定'
                cancel-button-text='我再想想'
                icon="el-icon-info"
                icon-color="red"
                title="您确定批量删除这些数据吗？"
                @confirm="delBatch"
            >
              <el-button type="danger" v-if="user.role==='ROLE_ADMIN'" slot="reference">批量删除 <i class="el-icon-remove-outline"></i></el-button>
            </el-popconfirm>
            <el-button type="primary" v-if="user.role==='ROLE_ADMIN'" @click="exportDepartment" class="ml-5">导出 <i class="el-icon-top"></i></el-button>
          </div>

          <el-table :data="tableData" border stripe :header-cell-class-name="headerBg" @selection-change="handleSelectionChange">
            <el-table-column type="selection" width="55"></el-table-column>
            <el-table-column prop="id" label="ID" width="80"></el-table-column>
            <el-table-column prop="username" label="用户名称" width="140"></el-table-column>
            <el-table-column prop="role" label="角色" width="140"></el-table-column>
            <el-table-column label="头像" width="110">
              <template width="120" slot-scope="scope">
                <img style="width:80px;height:80px;border:none;" :src="scope.row.avatar">
              </template>
            </el-table-column>
            <el-table-column prop="sex" :formatter="showSex" label="性别" width="100">
              <template slot-scope="scope">
                <el-tag size="small" type="success" v-if="scope.row.sex===1">男</el-tag>
                <el-tag size="small"  type="warning" v-else>女</el-tag>
              </template>
            </el-table-column>
            <el-table-column prop="department.name" label="所属部门" width="180" sortable></el-table-column>
            <el-table-column prop="birth" label="生日" width="180" sortable></el-table-column>
            <el-table-column prop="email" label="邮箱" width="180"></el-table-column>
            <el-table-column prop="phoneNumber" label="电话" width="150"></el-table-column>

            <el-table-column v-if="user.role === 'ROLE_ADMIN'" label="操作" fixed="right" width="200" align="center">
              <template slot-scope="scope">
                <el-button  type="success" v-if="user.role==='ROLE_ADMIN'" @click="handleEdit(scope.row)">编辑 <i class="el-icon-edit"></i></el-button>
                <el-popconfirm
                    class="ml-5"
                    confirm-button-text='确定'
                    cancel-button-text='我再想想'
                    icon="el-icon-info"
                    icon-color="red"
                    title="您确定删除吗？"
                    @confirm="del(scope.row.id)"
                >
                  <el-button type="danger" v-if="user.role==='ROLE_ADMIN'" slot="reference">删除 <i class="el-icon-remove-outline"></i></el-button>
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

        <el-dialog title="用户信息" :visible.sync="dialogFormVisible"  width="30%" >
          <el-form label-width="80px" :model="form"  size="small" >
            <el-upload
                class="avatar-uploader"
                :action="'http://' + serverIp +':8889/file/upload'"
                :show-file-list="false"
                :on-success="handleAvatarSuccess"
            >
              <img v-if="form.avatar" :src="form.avatar" class="avatar">
              <i v-else class="el-icon-plus avatar-uploader-icon"></i>
            </el-upload>

            <el-form-item label="用户名">
              <el-input v-model="form.username" autocomplete="off"></el-input>
            </el-form-item>
            <el-form-item label="角色">
              <el-select clearable v-model="form.role" placeholder="请选择角色" style="width: 100%">
                <el-option v-for="item in roles" :key="item.name" :label="item.name" :value="item.flag"></el-option>
              </el-select>
            </el-form-item>
            <el-form-item label="昵称">
              <el-input v-model="form.nickname" autocomplete="off"></el-input>
            </el-form-item>
            <el-form-item label="邮箱">
              <el-input v-model="form.email" autocomplete="off"></el-input>
            </el-form-item>
            <el-form-item label="电话">
              <el-input v-model="form.phoneNumber" autocomplete="off"></el-input>
            </el-form-item>
            <el-form-item label="生日">
              <el-date-picker
                  v-model="form.birth"
                  type="date"
                  placeholder="选择日期">
              </el-date-picker>
            </el-form-item>
          </el-form>
          <div slot="footer" class="dialog-footer">
            <el-button @click="dialogFormVisible = false">取 消</el-button>
            <el-button type="primary" @click="save">确 定</el-button>
          </div>
        </el-dialog>
      </el-main>

    </el-container>
  </el-container>
</template>

<script>
import request from "@/utils/request";
import {serverIp} from "../../../public/config";
export default {
  name: 'Home',
  data() {
    return {
      user: [],
      tableData: [],
      total: 0,
      pageNum: 1,
      pageSize: 10,
      username: "",
      email: "",
      sex: "",
      departmentId: "",
      form: {},
      departments: [],
      dialogFormVisible: false,
      multipleSelection: [],
      collapseBtnClass: 'el-icon-s-fold',
      isCollapse: false,
      sideWidth: 200,
      logoTextShow: true,
      headerBg: 'headerBg',
      serverIp: serverIp,
    }
  },
  created() {
    let user = localStorage.getItem("user") ? JSON.parse(localStorage.getItem("user")) : null
    this.user = user
    // 请求分页查询数据
    this.load();
    this.getDepartment();
  },
  methods: {
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
    getDepartment() {
      request.get("/department/").then(res => {
        console.log(res);
        this.departments = res.data;
      })
    },
    load() {
      request.get("/user/page", {
        params: {
          pageNum: this.pageNum,
          pageSize: this.pageSize,
          username: this.username,
          email: this.email,
          sex: this.sex,
          departmentId: this.departmentId
        }
      }).then(res => {
        console.log(res);
        this.tableData = res.data.records;
        this.total = res.data.total;
      })

      this.request.get("/role/all").then(res => {
        this.roles = res.data
      })
    },
    handleSelectionChange(val) {
      console.log(val)
      this.multipleSelection = val
    },
    //重置
    reset() {
      this.pageNum = 1;
      this.pageSize = 10;
      this.username = "";
      this.email = "";
      this.sex = "";
      this.departmentId = "";
      this.load();
    },
    //添加的表单数据
    handleAdd() {
      this.dialogFormVisible = true;
      this.form = {}
    },
    //添加操作
    save() {
      this.request.post("/user/", this.form).then(res => {
        console.log(res);
        if (res.code === '200') {
          this.$message.success("保存成功")
          this.dialogFormVisible = false
          this.load()
        } else {
          this.$message.error("保存失败")
        }
      })
    },
    //刪除
    del(id) {
      request.delete("/user/"+id).then(res => {
        if(res) {
          this.$message.success("删除成功");
          this.load();
        } else {
          this.$message.error("删除成功");
        }
      })
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
    handleEdit(row) {
      this.form = row
      this.dialogFormVisible = true
    },
    //导出
    exportDepartment() {
      window.open(`http://localhost:8889/user/export`)
    },
    //批量刪除
    delBatch() {
      let ids = this.multipleSelection.map(v => v.id)  // [{}, {}, {}] => [1,2,3]
      this.request.post("/user/del/batch", ids).then(res => {
        if (res.code === '200') {
          this.$message.success("批量删除成功")
          this.load()
        } else {
          this.$message.error("批量删除失败")
        }
      })
    },
    showSex(row, column) {
      return row.sex === 1 ? "男" : "女";
    },
    handleAvatarSuccess(res) {
      console.log(res);
        this.form.avatar = res
    }
  }
}
</script>

<style>
.avatar-uploader {
  text-align: center;
  padding-bottom: 10px;
}
.avatar-uploader .el-upload {
  border: 1px dashed #d9d9d9;
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
}
.avatar-uploader .el-upload:hover {
  border-color: #409EFF;
}
.avatar-uploader-icon {
  font-size: 28px;
  color: #8c939d;
  width: 138px;
  height: 138px;
  line-height: 138px;
  text-align: center;
}
.avatar {
  width: 138px;
  height: 138px;
  display: block;
}
</style>
