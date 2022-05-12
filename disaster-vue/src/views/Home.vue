<template>
  <div id="welcome">
    <el-row :gutter="15">
      <el-col :span="13">
        <el-row style="margin-top:10px;" :gutter="10">
          <el-card style="height:125px;">
            <el-col :span="6">
              <div class="grid-content bg-purple">
                <router-link to="/product">
                  <img
                      src="../assets/1.svg"
                      alt
                      width="60.8px;"
                      style="margin:0px auto; cursor: pointer;margin-left:20px;"
                  />
                </router-link>
                <div style="font-size:12px;margin-top:5px;margin-left:25px;">物资资料</div>
              </div>
            </el-col>
            <el-col :span="6">
              <div class="grid-content bg-purple-light">
                <router-link to="/stocks">
                  <img
                      src="../assets/2.svg"
                      alt
                      width="60.8px;"
                      style="cursor: pointer;margin-left:20px;"
                  />
                </router-link>
                <div style="font-size:12px;margin-top:5px;margin-left:25px;">物资库存</div>
              </div>
            </el-col>

            <el-col :span="6">
              <div class="grid-content bg-purple-light">
                <router-link to="/addStock">
                  <img
                      src="../assets/3.svg"
                      alt
                      width="60.8px;"
                      style="cursor: pointer;margin-left:20px;"
                  />
                </router-link>

                <div style="font-size:12px;margin-top:5px;margin-left:25px;">物资入库</div>
              </div>
            </el-col>
            <el-col :span="6">
              <div class="grid-content bg-purple"></div>
              <router-link to="/publish" >
                <img
                    src="../assets/4.svg"
                    alt
                    width="60.8px;"
                    style="cursor: pointer;margin-left:20px;"
                />
              </router-link>
              <div style="font-size:12px;margin-top:5px;margin-left:25px;">物资发放</div>
            </el-col>
          </el-card>
        </el-row>
      </el-col>
    </el-row>
  </div>
</template>
<script>
export default {
  data() {
    return {
    };
  },
};
</script>

<style scoped>
.el-carousel__item h3 {
  color: #475669;
  font-size: 14px;
  opacity: 0.75;
  line-height: 300px;
  margin: 0;
}
</style>
