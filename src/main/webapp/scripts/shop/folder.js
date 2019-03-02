layui.define(['layer','jquery'],function(exports){ //需要正确引入所需要的模块
    var layer = layui.layer, $ = layui.jquery;

    var folder = {
        init : function(){
            var uls = document.getElementById('list-cont').getElementsByTagName('ul');//每一行
            var checkInputs = document.getElementsByClassName('check'); // 所有勾选框
            var checkAll = document.getElementsByClassName('check-all'); //全选框
            var SelectedPieces = document.getElementsByClassName('Selected-pieces')[0];//总件数
            // var piecesTotal = document.getElementsByClassName('pieces-total')[0];//总价
            var batchdeletion = document.getElementsByClassName('batch-deletion')[0]//批量删除按钮
            //计算
            function getTotal(){
                var seleted = 0,price = 0;
                for(var i = 0; i < uls.length;i++){
                    if(uls[i].getElementsByTagName('input')[0].checked){
                        seleted++ ;
                        // seleted += parseInt(uls[i].getElementsByClassName('Quantity-input')[0].value);
                        // price += parseFloat(uls[i].getElementsByClassName('sum')[0].innerHTML);
                    }
                }
                SelectedPieces.innerHTML = seleted;
                // piecesTotal.innerHTML = '￥' + price.toFixed(2);
            }

            // function fn1(){
            //     alert(1)
            // }
            // 小计
            // function getSubTotal(ul){
            //     var unitprice = parseFloat(ul.getElementsByClassName('th-su')[0].innerHTML);
            //     var count = parseInt(ul.getElementsByClassName('Quantity-input')[0].value);
            //     var SubTotal = parseFloat(unitprice*count)
            //     ul.getElementsByClassName('sum')[0].innerHTML = SubTotal.toFixed(2);
            // }

            for(var i = 0;i < checkInputs.length;i++){
                checkInputs[i].onclick = function(){
                    if(this.className === 'check-all check'){
                        for(var j = 0;j < checkInputs.length; j++){
                            checkInputs[j].checked = this.checked;
                        }
                    }
                    if(this.checked == false){
                        for(var k = 0;k < checkAll.length;k++){
                            checkAll[k].checked = false;
                        }
                    }
                    getTotal();
                }
            }

            for(var i = 0; i < uls.length;i++){
                // layer.alert(uls[i]);
                uls[i].onclick = function(e){
                    e = e || window.event;
                    var el = e.srcElement;
                    var cls = el.className;
                    // var singlePrice = this.getElementsByClassName('th-su')[0].innerText; //商品单价
                    // var input = this.getElementsByClassName('Quantity-input')[0]; //商品数量
                    // var less = this.getElementsByClassName('less')[0];
                    // var val = parseInt(input.value);
                    // var cartId = this.getElementsByClassName('cartId')[0].value; //获取cartId值，与jquery获取方式不同，原因没有正确引入jquery模块
                    var folderId = this.getElementsByTagName('input')[1].value;;
                    // var folderId = $("#folderId").val(); //获取cartId
                    // var cartItemTotalPrice = singlePrice * input.value; //单个购物项总价
                    var that = this;
                    switch(cls){
                        case 'add layui-btn':
                            input.value = val + 1;
                            getSubTotal(this)
                            break;
                        case 'less layui-btn':
                            if(val > 1){
                                input.value = val - 1;
                            }
                            getSubTotal(this)
                            break;
                        case 'dele-btn':
                            layer.alert(folderId);
                            layer.confirm('你确定要删除吗',{
                                yes:function(index,layero){
                                    $.post("/favorite/deleteFolderItemByFolderId",
                                        {
                                            folderId: folderId
                                        },
                                        function(data){
                                            if(data.success){
                                                console.log(data.msg);
                                                layer.msg("删除成功");
                                                // $("#cartSpan").html(data.cartGoodCount);
                                                // window.location.href = "/cart/seeCartList";
                                                // var totalPrice = $(".pieces-total").text().replace("￥", ""); //获取前端总价
                                                // var totalPri = totalPrice - cartItemTotalPrice; //删除后的总价价格
                                                // $(".pieces-total").html('￥' + totalPri.toFixed(2)); //改变前端的总价
                                            } else {
                                                console.log(data.msg);
                                                layer.msg("删除失败");
                                            }
                                        });
                                    layer.close(index)
                                    that.parentNode.removeChild(that);
                                }
                            });
                            break;
                    }
                    getTotal();
                }
            }

            batchdeletion.onclick = function(){
                if(SelectedPieces.innerHTML != 0){
                    var folderIds = "";
                    layer.confirm('你确定要删除吗',{
                        yes:function(index,layero){
                            layer.close(index)
                            for(var i = 0;i < uls.length;i++){
                                var input = uls[i].getElementsByTagName('input')[0];
                                var input1 = uls[i].getElementsByTagName('input')[1].value;
                                if(input.checked){
                                    folderIds += input1 + ",";
                                    uls[i].parentNode.removeChild(uls[i]);
                                    i--;
                                }
                            }
// alert(folderIds);
                            $.post("/favorite/deleteFolderItemByFolderIds",
                                {
                                    folderIds: folderIds
                                },
                                function(data){
                                    if(data.success){
                                        console.log(data.msg);
                                        layer.msg(data.msg);
                                    } else {
                                        console.log(data.msg);
                                        layer.msg("批量删除失败");
                                    }
                                }
                            );
                        }

                    })
                }else{
                    layer.msg('请选择商品')
                }
                getTotal();
            }
            checkAll[0].checked = true;
            checkAll[0].onclick();
        }

    }


    exports('folder',folder)
});