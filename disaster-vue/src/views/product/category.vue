<template>
  <div id="category">
    <el-card class="box-card">
      <!-- 表格部分 -->
      <zk-table
          v-loading="loading"
          style="margin-top:10px;"
          ref="table"
          show-index
          :expand-type="false"
          :selection-type="false"
          sum-text="sum"
          index-text="#"
          :data="categorys"
          :columns="columns"
      >
      </zk-table>
    </el-card>
  </div>
</template>
<script>
import request from "@/utils/request";
export default {

  data() {
    return {
      btnLoading: false,
      btnDisabled: false,
      loading:true,
      pKeys: [],
      addDialogVisible: false,
      editDialogVisible: false,
      total: 0,
      categorys: [],
      selectProps: {
        expandTrigger: "hover",
        value: "id",
        label: "name",
        children: "children"
      }, //级联选择器配置项
      columns: [
        {
          label: "分类名称",
          prop: "name"
        },
        {
          label: "排序",
          prop: "sort"
        },
        {
          label: "创建时间",
          prop: "createTime"
        },
        {
          label: "修改时间",
          prop: "modifiedTime"
        },
        {
          label: "备注",
          prop: "remark"
        },
      ]
    };
  },
  methods: {
    async getCategoryList(){
      this.request.get("/category/getParentCategoryTree").then(res => {
        console.log(res.data);
        this.categorys = res.data;
        this.total = res.data.total;
      })
    },
  },
  created() {
    this.getCategoryList();

    setTimeout(() => {
      this.loading = false;
    }, 500);
  }
};
</script>