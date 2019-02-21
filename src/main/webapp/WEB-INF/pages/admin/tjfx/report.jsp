<%--
  Created by IntelliJ IDEA.
  User: guyuanhui
  Date: 2019/2/15
  Time: 22:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>统计分析</title>
</head>
<body>
<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
<div id="main" style="width: 100%;height:285px; margin-top: 30px;"></div>
</body>
<script type="text/javascript" src="${ctx}/scripts/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/scripts/echarts/echarts.js"></script>
</html>
<script>
    $(function(){
        var goodFatherNameList = ${goodFatherNameList}; // 后端需要将list对象转换为JSONArray（alibaba）
        var goodFatherCountList = ${goodFatherCountList};

        var fatherList = new Array();
        if(goodFatherNameList == null) {
        } else {
            for(var i = 0; i < goodFatherNameList.length; i++) {
                fatherList.push(goodFatherNameList[i]);
            }
        }

        var fatherCountList = new Array();
        if(goodFatherCountList == null) {
        } else {
            for(var i = 0; i < goodFatherCountList.length; i++) {
                fatherCountList.push(goodFatherCountList[i]);
            }
        }

        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'));

        // 指定图表的配置项和数据
        var option = {
            color: ['#3398DB'],
            tooltip : {
                trigger: 'axis',
                axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                    type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                }
            },
            title: {
                text: '商品发布量统计'
            },
            legend: {
                data:['发布量']
            },
            grid: [
                {
                    left: '3%',
                    right: '4%',
                    bottom: '3%',
                    containLabel: true
                }
            ],
            xAxis: [
                {
                    type : 'category',
                    data : goodFatherNameList,
                    axisTick: {
                        alignWithLabel: true
                    }
                }
            ],
            yAxis : [
                {
                    type : 'value'
                }
            ],
            series: [{
                name: '发布量',
                type: 'bar',
                barWidth: '40px',
                data: goodFatherCountList,
                // itemStyle:{
                //     normal:{
                //         color:'#3398db'
                //     }
                // },
            }]
        };

        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
    });
</script>
