<template>
  <el-container style="min-height: 100vh">
      <el-main>
        <el-card>
          <div style="margin: 0px 0">
            <el-input style="width: 200px" placeholder="请输入名称" suffix-icon="el-icon-search" v-model="name"></el-input>
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
              <el-button type="danger" v-if="user.role === 'ROLE_ADMIN'" slot="reference">批量删除 <i class="el-icon-remove-outline"></i></el-button>
            </el-popconfirm>
            <el-button type="primary" v-if="user.role === 'ROLE_ADMIN'" @click="exportDepartment" class="ml-5">导出 <i class="el-icon-top"></i></el-button>
          </div>

          <el-table :data="tableData" border stripe :header-cell-class-name="headerBg" @selection-change="handleSelectionChange">
            <el-table-column type="selection" width="55"></el-table-column>
            <el-table-column prop="id" label="ID" width="80"></el-table-column>
            <el-table-column prop="name" label="部门名称" width="140"></el-table-column>
            <el-table-column prop="total" label="人数" sortable width="100">
              <template slot-scope="scope">
                <el-tag effect="plain" v-text="scope.row.total+'人'" size="small">
                </el-tag>
              </template>
            </el-table-column>
            <el-table-column prop="phone" label="电话"></el-table-column>
            <el-table-column prop="address" label="地址"></el-table-column>
            <el-table-column prop="createTime" label="创建时间" sortable></el-table-column>
            <el-table-column prop="modifiedTime" label="修改时间" sortable></el-table-column>
            <el-table-column label="操作" v-if="user.role === 'ROLE_ADMIN'"  width="200" align="center">
              <template slot-scope="scope">
                <el-button type="success" v-if="user.role === 'ROLE_ADMIN'" @click="handleEdit(scope.row)">编辑 <i class="el-icon-edit"></i></el-button>
                <el-popconfirm
                    class="ml-5"
                    confirm-button-text='确定'
                    cancel-button-text='我再想想'
                    icon="el-icon-info"
                    icon-color="red"
                    title="您确定删除吗？"
                    @confirm="del(scope.row.id)"
                >
                  <el-button type="danger" v-if="user.role === 'ROLE_ADMIN'" slot="reference">删除 <i class="el-icon-remove-outline"></i></el-button>
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

        <el-dialog title="部门信息" :visible.sync="dialogFormVisible"  width="30%" >
          <el-form label-width="80px" :model="form" :rules="addRules" size="small" >
            <el-form-item label="用户名" prop="name">
              <el-input v-model="form.name" autocomplete="off"></el-input>
            </el-form-item>
            <el-form-item label="电话" prop="phone">
              <el-input v-model="form.phone" autocomplete="off"></el-input>
            </el-form-item>
            <el-form-item label="地址" prop="address">
              <el-input v-model="form.address" autocomplete="off"></el-input>
            </el-form-item>
          </el-form>
          <div slot="footer" class="dialog-footer">
            <el-button @click="dialogFormVisible = false">取 消</el-button>
            <el-button type="primary" @click="save">确 定</el-button>
          </div>
        </el-dialog>
      </el-main>

    </el-container>
</template>

<script>
import request from "@/utils/request";
export default {
  name: 'Home',
  data() {
    const item = {
      date: '2016-05-02',
      name: '王小虎',
      address: '上海市普陀区金沙江路 1518 弄'
    };
    const checkPhone = (rule, value, callback) => {
      const phoneReg = /^1[34578]\d{9}$$/;
      if (!value) {
        return callback(new Error("电话号码不能为空"));
      }
      setTimeout(() => {
        if (!Number.isInteger(+value)) {
          callback(new Error("请输入数字值"));
        } else {
          if (phoneReg.test(value)) {
            callback();
          } else {
            callback(new Error("电话号码格式不正确"));
          }
        }
      }, 100);
    };
    return {
      user: [],
      tableData: [],
      total: 0,
      pageNum: 1,
      pageSize: 10,
      name: "",
      form: {},
      dialogFormVisible: false,
      multipleSelection: [],
      msg: "hello 青哥哥",
      collapseBtnClass: 'el-icon-s-fold',
      isCollapse: false,
      sideWidth: 200,
      logoTextShow: true,
      headerBg: 'headerBg',
      addRules: {
        name: [
          { required: true, message: "请输入部门名称", trigger: "blur" },
          { min: 3, max: 10, message: "长度在 3 到 10 个字符", trigger: "blur" }
        ],
        address: [
          { required: true, message: "请输入办公地址", trigger: "blur" },
          { min: 4, max: 12, message: "长度在 4 到 12 个字符", trigger: "blur" }
        ],
        phone: [
          {
            required: true,
            message: "请输入联部门方式",
            validator: checkPhone,
            trigger: "blur"
          }
        ]
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
      request.get("/department/page", {
        params: {
          pageNum: this.pageNum,
          pageSize: this.pageSize,
          name: this.name,
        }
      }).then(res => {
        console.log(res);
        this.tableData = res.data;
        this.total = res.data.length;
      })
    },
    handleSelectionChange(val) {
      console.log(val)
      this.multipleSelection = val
    },
    //重置
    reset() {
      this.name = "";
    },
    //添加的表单数据
    handleAdd() {
      this.dialogFormVisible = true;
      this.form = {}
    },
    //添加操作
    save() {
      request.post("/department/",this.form).then(res =>{
        if(res) {
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
      request.delete("/department/"+id).then(res => {
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
      window.open(`http://localhost:8889/department/export`)
    },
    //批量刪除
    delBatch() {
      let ids = this.multipleSelection.map(v => v.id)  // [{}, {}, {}] => [1,2,3]
      this.request.post("/department/del/batch", ids).then(res => {
        if (res.code === '200') {
          this.$message.success("批量删除成功")
          this.load()
        } else {
          this.$message.error("批量删除失败")
        }
      })
    }
  }
}
</script>

<style>
.headerBg {
  background: #eee!important;
}
</style>
