<template>
  <div id="productCategroys">
    <!-- 右侧卡片区域 -->
    <el-card class="box-card">
      <el-container style="margin-bottom:20px;">
        <el-alert
            show-icon
            title="友情提示:  商品的分类只支持三级分类"
            type="warning">
        </el-alert>
      </el-container>
      <el-row :gutter="6">
        <el-col :span="5">
          <el-cascader
              size="small"
              placeholder="请选择分类查询"
              :change-on-select="true"
              @change="selectChange"
              v-model="categorykeys"
              :props="searchSelectProps"
              :options="cateories"
              clearable
          ></el-cascader>
        </el-col>
        <el-col :span="6">
          <el-input
              clearable
              size="small"
              v-model="queryMap.name"
              placeholder="请输入物资名称查询"
              @clear="search"
              class="input-with-select"
          ></el-input>
        </el-col>
        <el-col :span="5">
          <template>
            <el-select size="small" v-model="queryMap.status" @click="search" placeholder="请选择状态">
              <el-option label="正常" :value="0"></el-option>
              <el-option label="回收站" :value="1"></el-option>
              <el-option label="待审核" :value="2"></el-option>
            </el-select>
          </template>
        </el-col>
        <el-col :span="8">
          <el-button size="small" type="primary" icon="el-icon-search" @click="search">查找</el-button>
          <el-button size="small" icon="el-icon-refresh-right" type="warning" @click="resetForm">重置</el-button>
          <el-button size="small" type="success" v-if="user.role === 'ROLE_ADMIN'" icon="el-icon-circle-plus-outline" @click="openAdd">添加
          </el-button>
          <el-button size="small" icon="el-icon-refresh" @click="getproductList">刷新</el-button>
        </el-col>
      </el-row>

      <!-- 表格区域 -->
      <template>
        <el-table
            size="mini"
            v-loading="loading"
            border
            stripe
            :data="productData"
            style="width: 100%;margin-top:20px;"
            height="400"
        >
          <el-table-column prop="id" type="index" label="ID"></el-table-column>

          <el-table-column label="图片" width="110">
            <template width="120" slot-scope="scope">
              <img style="width:80px;height:80px;border:none;" :src="scope.row.imageUrl">
            </template>
          </el-table-column>
          <el-table-column prop="name" label="物资名称"></el-table-column>
          <el-table-column prop="pnum" :show-overflow-tooltip='true' label="物资编号"></el-table-column>
          <el-table-column label="物资规格" width="100">
            <template slot-scope="scope">
              <el-tag type="success" size="mini" closable v-text="scope.row.model"></el-tag>
            </template>
          </el-table-column>
          <el-table-column prop="unit" label="单位" width="80"></el-table-column>
          <el-table-column prop="remark" label="备注"></el-table-column>
          <el-table-column prop="status" label="状态" width="100">
            <template slot-scope="scope">
              <el-tag size="mini" type="danger" effect="plain" v-if="scope.row.status==1">回收</el-tag>
              <el-tag size="mini" effect="plain" v-if="scope.row.status==0">正常</el-tag>
              <el-tag size="mini" effect="plain" type="warning" v-if="scope.row.status==2">审核中</el-tag>
            </template>
          </el-table-column>
          <el-table-column prop="createTime" label="创建时间"></el-table-column>
          <el-table-column label="操作" v-if="user.role === 'ROLE_ADMIN'">
            <template slot-scope="scope">
              <!--              给管理员提供的恢复和删除-->

              <span v-if="scope.row.status==1">
                <el-popconfirm
                    class="ml-5"
                    confirm-button-text='确定'
                    cancel-button-text='我再想想'
                    icon="el-icon-info"
                    icon-color="red"
                    title="您确定移入回收站吗？"
                    @confirm="back(scope.row.id)"
                              >
                <el-button type="text" slot="reference"><i class="el-icon-s-operation"></i>回收站</el-button>
              </el-popconfirm>
              <el-button style="margin-left:10px;" type="text" size="mini" icon="el-icon-delete"
                         @click="del(scope.row.id)">删除</el-button>
              </span>

              <!--              给操作员提供的编辑和回收-->
              <span v-if="scope.row.status==0">
               <el-button type="text" size="mini" icon="el-icon-edit" @click="edit(scope.row.id)">编辑</el-button>
              <el-popconfirm
                  class="ml-5"
                  confirm-button-text='确定'
                  cancel-button-text='我再想想'
                  icon="el-icon-info"
                  icon-color="red"
                  title="您确定移入回收站吗？"
                  @confirm="remove(scope.row.id)"
              >
                <el-button type="text" slot="reference"><i class="el-icon-s-operation"></i>回收站</el-button>
              </el-popconfirm>
              </span>

              <!--          给管理员提供的审核和不通过-->
              <span v-if="scope.row.status==2">
              <el-popconfirm
                  class="ml-5"
                  confirm-button-text='确定'
                  cancel-button-text='我再想想'
                  icon="el-icon-info"
                  icon-color="red"
                  title="确定审核通过吗？"
                  @confirm="publish(scope.row.id)">
                <el-button type="text" slot="reference"><i class="el-icon-s-operation"></i>通过</el-button>
              </el-popconfirm>
              <el-button style="margin-left:10px;" type="text" size="mini" icon="el-icon-delete"
                         @click="del(scope.row.id)">删除</el-button>
                </span>
            </template>
          </el-table-column>
        </el-table>
      </template>
      <!-- 分页 -->
      <el-pagination
          style="margin-top:10px;"
          background
          @size-change="handleSizeChange"
          @current-change="handleCurrentChange"
          :current-page="this.queryMap.pageNum"
          :page-sizes="[6, 10, 15, 20]"
          :page-size="this.queryMap.pageSize"
          layout="total, sizes, prev, pager, next, jumper"
          :total="total"
      ></el-pagination>

      <!-- 物资添加弹出框 -->
      <el-dialog title="添加物资" :visible.sync="addDialogVisible" width="50%" @close="closeAddDialog">
        <span>
          <el-form
              size="mini"
              :model="addRuleForm"
              :rules="addRules"
              ref="addRuleFormRef"
              label-width="100px"
              class="demo-ruleForm"
          >
            <el-form-item label="物资名称" prop="name">
              <el-input v-model="addRuleForm.name"></el-input>
            </el-form-item>
            <el-form-item label="物资图片" prop="name">
                    <el-upload
                        :class="{ disabled: uploadDisabled }"
                        list-type="picture-card"
                        :limit="limitCount"
                        :on-change="handleChange"
                        :on-remove="handleRemove"
                        :on-success="handleAvatarSuccess"
                        ref="upload"
                        :on-preview="handlePictureCardPreview"
                        :action="'http://' + serverIp +':8889/file/upload'"
                        :show-file-list="false"
                    >
                    <img v-if="addRuleForm.imageUrl" :src="addRuleForm.imageUrl" class="avatar">
                    <i v-else class="el-icon-plus avatar-uploader-icon"></i>
                  </el-upload>
            </el-form-item>
            <el-row>
              <el-col :span="12">
                <div class="grid-content bg-purple-light">
                  <el-form-item label="物资规格" prop="model">
                    <el-input v-model="addRuleForm.model"></el-input>
                  </el-form-item>
                </div>
              </el-col>
              <el-col :span="12">
                <div class="grid-content bg-purple">
                  <el-form-item label="分类" prop="categoryKeys">
                    <el-cascader
                        :options="cateories"
                        clearable
                        filterable
                        :props="selectProps"
                        v-model="addRuleForm.categoryKeys"
                    ></el-cascader>
                  </el-form-item>
                </div>
              </el-col>
            </el-row>
            <el-row>
              <el-col :span="12">
                <div class="grid-content bg-purple">
                  <el-form-item label="单位" prop="unit">
                    <el-input v-model="addRuleForm.unit"></el-input>
                  </el-form-item>
                </div>
              </el-col>
              <el-col :span="12">
                <div class="grid-content bg-purple-light">
                  <el-form-item label="排序" prop="sort">
                    <el-input-number v-model="addRuleForm.sort" :min="1" :max="10" label="排序"></el-input-number>
                  </el-form-item>
                </div>
              </el-col>
            </el-row>

            <el-form-item label="备注信息" prop="remark">
              <el-input type="textarea" v-model="addRuleForm.remark"></el-input>
            </el-form-item>
          </el-form>
        </span>
        <span slot="footer" class="dialog-footer">
          <el-button @click="addDialogVisible = false">取 消</el-button>
          <el-button type="primary" @click="add" :disabled="btnDisabled" :loading="btnLoading">确 定</el-button>
        </span>
      </el-dialog>

      <!-- 物资编辑弹出框 -->
      <el-dialog
          title="更新物资"
          :visible.sync="editDialogVisible"
          width="50%"
          @close="closeEditDialog"
      >
        <span>
          <el-form
              size="mini"
              :model="editRuleForm"
              :rules="addRules"
              ref="editRuleFormRef"
              label-width="100px"
              class="demo-ruleForm"
          >
            <el-form-item label="物资名称" prop="name">
              <el-input v-model="editRuleForm.name"></el-input>
            </el-form-item>
            <el-form-item label="物资图片" prop="name">
                <el-upload
                    :class="{ disabled: uploadDisabled }"
                    list-type="picture-card"
                    :limit="limitCount"
                    :on-change="handleChange"
                    :on-remove="handleRemove"
                    :on-success="editHandleSuccess"
                    ref="upload"
                    :on-preview="handlePictureCardPreview"
                    :action="'http://' + serverIp +':8889/file/upload'"
                    :show-file-list="false"
                >
                <img v-if="editRuleForm.imageUrl" :src="editRuleForm.imageUrl" class="avatar">
                <i v-else class="el-icon-plus avatar-uploader-icon"></i>
              </el-upload>
            </el-form-item>
            <el-row>
              <el-col :span="12">
                <el-form-item label="物资规格" prop="model">
                  <el-input v-model="editRuleForm.model"></el-input>
                </el-form-item>
              </el-col>

              <el-col :span="12">
                <div class="grid-content bg-purple">
                  <el-form-item label="分类" prop="categoryKeys">
                    <el-cascader
                        :options="cateories"
                        clearable
                        filterable
                        :props="selectProps"
                        v-model="editRuleForm.categoryKeys"
                    ></el-cascader>
                  </el-form-item>
                </div>
              </el-col>
            </el-row>
            <el-row>
              <el-col :span="12">
                <div class="grid-content bg-purple">
                  <el-form-item label="单位" prop="unit">
                    <el-input v-model="editRuleForm.unit"></el-input>
                  </el-form-item>
                </div>
              </el-col>
              <el-col :span="12">
                <div class="grid-content bg-purple-light">
                  <el-form-item label="排序" prop="sort">
                    <el-input-number v-model="editRuleForm.sort" :min="1" :max="10" label="排序"></el-input-number>
                  </el-form-item>
                </div>
              </el-col>
            </el-row>
          </el-form>
        </span>
        <span slot="footer" class="dialog-footer">
          <el-button @click="editDialogVisible = false">取 消</el-button>
          <el-button
              type="primary"
              @click="update"
              :disabled="btnDisabled"
              :loading="btnLoading"
          >确 定</el-button>
        </span>
      </el-dialog>

    </el-card>
  </div>
</template>

<script>
import request from "@/utils/request";
import {serverIp} from "../../../public/config";
export default {
  data() {
    return {
      user: [],
      serverIp: serverIp,
      uploadApi:this.BASE_API_URL+'system/upload/image',
      btnLoading: false,
      btnDisabled: false,
      loading: true,
      cateories: [], //类别选择
      selectProps: {
        expandTrigger: "hover",
        value: "id",
        label: "name",
        children: "children",
        checkStrictly: false
      }, //级联选择器配置项
      searchSelectProps: {
        expandTrigger: "hover",
        value: "id",
        label: "name",
        children: "children",
        checkStrictly: true
      }, //级联搜索选择器配置项


      editDialogVisible: false,
      addDialogVisible: false, //添加弹框是否显示
      total: 0, //总共多少条数据
      productData: [], //表格数据
      queryMap: {
        name: "",
        categoryId: "",
        supplier: "",
        status: 0,

      }, //查询对象
      addRuleForm: {}, //添加表单数据
      editRuleForm: {}, //修改表单数据
      uploadDisabled: false,
      limitCount: 1,
      dialogImageUrl: "",
      dialogVisible: false,
      addRules: {
        name: [
          {required: true, message: "请输入物资名称", trigger: "blur"},
          {min: 2, max: 10, message: "长度在 2 到 10 个字符", trigger: "blur"}
        ],
        unit: [
          {required: true, message: "请输入物资单位", trigger: "blur"},
          {min: 1, max: 10, message: "长度在 1 到 10 个字符", trigger: "blur"}
        ],
        model: [
          {required: true, message: "请输入物资规格", trigger: "blur"},
          {min: 2, max: 10, message: "长度在 2 到 10 个字符", trigger: "blur"}
        ],
        remark: [
          {required: true, message: "请输入物资说明备注", trigger: "blur"},
          {min: 2, max: 10, message: "长度在 2 到 10 个字符", trigger: "blur"}
        ],
        categorys: [
          {required: true, message: "请输入物资分类", trigger: "blur"}
        ],
        sort: [{required: true, message: "请输入地址信息", trigger: "blur"}],
        categoryKeys: [
          {required: true, message: "请选择物资分类", trigger: "blur"}
        ]
      }, //添加验证
      imgFilesList: [],
      categorykeys: [] //搜索类别
    };
  },
  methods: {
    //重置查询表单
    resetForm() {
      this.queryMap = {
        cateories: [],
        pageNum: 1,
        pageSize: 5,
        name: "",
        categoryId: "",
        supplier: "",
        status: 0,
      };
    },
    /**
     * 打开添加物资弹框
     */
    openAdd() {
      this.getCatetorys();
      this.addDialogVisible = true;
    },
    /**
     * 搜索物资
     */
    search() {
      this.queryMap.pageNum = 1;
      this.getproductList();
    },

    /**
     * 物资添加审核
     */
    async publish(id) {
      console.log(id);
      request.put("/product/publish/"+id).then(res => {
        if (!res) {
          return this.$message.error("审核失败:" + res.data.msg);
        } else {
          this.getproductList();
          return this.$message.success("物资已审核通过");
        }
      })
    },
    /**
     * 删除物资
     */
    async del(id) {
      var res = await this.$confirm(
          "此操作将永久删除该物资, 是否继续?",
          "提示",
          {
            confirmButtonText: "确定",
            cancelButtonText: "取消",
            type: "warning"
          }
      ).catch(() => {
        this.$message({
          type: "info",
          message: "已取消删除"
        });
      });
      if (res === "confirm") {
        request.delete("/product/delete/" + id).then(res => {
          if (res) {
            this.$message.success("物资删除成功");
            this.getproductList();
          } else {
            this.$message.error(res.data.msg);
          }
        })
      }
    },
    /**
     * 更新物资
     */
    async update() {
      this.$refs.editRuleFormRef.validate(async valid => {
        if (!valid) {
          return;
        } else {
          this.btnDisabled = true;
          this.btnLoading = true;
          request.put("/product/update/"+this.editRuleForm.id,this.editRuleForm).then(res => {
            if (res) {
              this.$notify({
                title: "成功",
                message: "物资信息更新",
                type: "success"
              });
              this.editRuleForm = {};
              this.getproductList();
            } else {
              this.$message.error("物资信息更新失败:" + res.data.msg);
            }
          })
          this.editDialogVisible = false;
          this.btnDisabled = false;
          this.btnLoading = false;
        }
      });
    },
    /**
     * 编辑物资
     */
    async edit(id) {
      request.get("/product/edit/"+id).then(res => {
        const array = [];
        this.editRuleForm = res.data;
        array.push(res.data.oneCategoryId);
        array.push(res.data.twoCategoryId);
        array.push(res.data.threeCategoryId);
        this.editRuleForm.categoryKeys = array;
        this.editDialogVisible = true;
      })
    },
    /**
     * 添加物资
     */
    add() {
      this.$refs.addRuleFormRef.validate(async valid => {
        if (!valid) {
          return;
        } else {
          this.btnDisabled = true;
          this.btnLoading = true;
          request.post("/product/add",this.addRuleForm).then(res => {
            if (res) {
              this.$message.success("物资添加成功");
              this.addRuleForm = {};
              this.getproductList();
            } else {
              return this.$message.error("物资添加失败:" + res.msg);
            }
          })
          this.addDialogVisible = false;
          this.btnDisabled = false;
          this.btnLoading = false;
        }
      });
    },
    handleAvatarSuccess(res) {
      console.log(res);
      this.addRuleForm.imageUrl = res
    },
    /**
     * 移除回收站
     */
    async remove(id) {
      request.put("/product/remove/" + id).then(res => {
        console.log(res);
        if (!res) {
          return this.$message.error("移入回收站失败:" + res.data.msg);
        } else {
          this.getproductList();
          return this.$message.success("移入回收站成功");
        }
      })
    },
    /**
     * 从回收站恢复
     */
    async back(id) {
      request.put("product/back/" + id).then(res => {
        if (!res) {
          return this.$message.error("从回收站恢复失败:" + res.data.msg);
        } else {
          this.getproductList();
          return this.$message.success("从回收站中已恢复");
        }
      })
    },
    /**
     * 加载物资列表
     */
    async getproductList() {
      request.get("/product/findProductList",{
        pageNum: this.pageNum,
        pageSize: this.pageSize,
        params: this.queryMap
      }).then( res=>{
        this.total = res.data.total;
        this.productData = res.data.records;
      })
    },
    /**
     * 加载物资类别
     */
    async getCatetorys() {
      request.get("/category/categoryTree").then(res => {
        console.log(res);
        this.cateories = res.data;
      })
    },
    handleChange(file, fileList) {
      this.uploadDisabled = fileList.length >= this.limitCount;
    },
    handleRemove(file, fileList) {
      this.uploadDisabled = fileList.length >= this.limitCount;
      this.addRuleForm.imageUrl = "";
    },
    //改变页码
    handleSizeChange(newSize) {
      this.queryMap.pageSize = newSize;
      this.getproductList();
    },
    //翻页
    handleCurrentChange(current) {
      this.queryMap.pageNum = current;
      this.getproductList();
    },
    //关闭弹出框
    closeAddDialog() {
      this.$refs.addRuleFormRef.clearValidate();
      this.addRuleForm = {};
      this.$refs.upload.clearFiles();
    },
    //关闭弹出框
    closeEditDialog() {
      this.$refs.editRuleFormRef.clearValidate();
      this.editRuleForm = {};
      this.imgFilesList = [];
    },
    handlePictureCardPreview(file) {
      this.dialogImageUrl = file.url;
      this.dialogVisible = true;
    },
    //编辑
    editHandleSuccess(res) {
      console.log(res);
      this.editRuleForm.imageUrl = res
      //this.editRuleForm.imageUrl = response.msg;
    },
    /**
     * 分类搜索改变时
     */
    selectChange() {
      var str = "";
      for (var i = 0; i < this.categorykeys.length; i++) {
        str += this.categorykeys[i] + ",";
      }
      str = str.substring(0, str.length - 1);
      this.queryMap.categorys = str;
    }
  },

  created() {
    let user = localStorage.getItem("user") ? JSON.parse(localStorage.getItem("user")) : null
    this.user = user
    this.getproductList();
    this.getCatetorys();
    setTimeout(() => {
      this.loading = false;
    }, 500);
  }
};
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


