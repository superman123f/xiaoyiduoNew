package com.xh.xiaoyiduo.admin.qxgl.controller;

import com.alibaba.fastjson.JSON;
import com.xh.xiaoyiduo.admin.qxgl.pojo.S_USER_ROLEPERMISSIONS;
import com.xh.xiaoyiduo.admin.qxgl.service.IRoleManageService;
import com.xh.xiaoyiduo.shop.pojo.S_USER;
import com.xh.xiaoyiduo.shop.pojo.S_USER_PERMISSIONS;
import com.xh.xiaoyiduo.shop.pojo.S_USER_ROLES;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.util.*;

/**
 */
@Controller
@RequestMapping("/role")
public class RoleManageController {

    @Autowired
    IRoleManageService roleManageService;

    @RequestMapping("/toRoleAdminPage")
    public String toRoleAdminPage() {
        return "/admin/qxgl/roleAdminPage";
    }

    @RequestMapping("/permissionToRole")
    public String permissionToRole() {
        return "/admin/qxgl/permissionToRole";
    }

    /**
     * 关联权限页面
     * @return
     */
    @RequestMapping("/toRoleAdminPage1")
    public String toRoleAdminPage1(String roleId, Model model) {
        model.addAttribute("roleId", roleId);
        return "/admin/qxgl/glqx/permissionToRole1";
    }

    /**
     * 关联角色页面
     * @return
     */
    @RequestMapping("/toUserAdminPage1")
    public String toUserAdminPage1(String userId, Model model) {
        model.addAttribute("userId", userId);
        return "/admin/qxgl/gljs/roleToUser1";
    }

    @RequestMapping("/roleToUser")
    public String roleToUser() {
        return "/admin/qxgl/roleToUser";
    }

    /**
     * 获取权限列表
     * @param limit
     * @param page
     * @return
     */
    @RequestMapping("/getAllPermissions")
    @ResponseBody
    public String getAllPermissions(String roleId, String status, String limit, String page){
        int count = roleManageService.getPermissionCount(null, status, roleId); // 获取权限的总数量
        List<S_USER_PERMISSIONS> permissionList = roleManageService.selectAllPermissions(roleId, status, limit, page, null); //获取所有权限的信息
        String permissionListJson = JSON.toJSONString(permissionList); //将对象转换为json
        String json = "{\"code\":0,\"msg\":\"\",\"count\":" + count + ",\"data\":" + permissionListJson + "}";
        return json;
    }

    /**
     * 加载权限数据
     * @return
     */
    @RequestMapping("/editPermission")
    public String editPermission(String permissionId, Model model){
        S_USER_PERMISSIONS permission = roleManageService.selectByPrimaryKey(permissionId);
        model.addAttribute("permission", permission);
        return "/admin/qxgl/editPermission";
    }

    /**
     * 权限新增、编辑
     * @param
     * @param
     * @param
     * @return
     */
    @RequestMapping("/updatePermissionInfo")
    @ResponseBody
    public Object updatePermissionInfo(S_USER_PERMISSIONS permission){
        Map<String, Object> data = new HashMap<>();
//        Date date = new Date(); // 发布时间，新增或修改都要更新

        //新增权限，判断id是否存在
        if(permission.getPermissionId() == null || permission.getPermissionId().equals("")){

            String uuid = UUID.randomUUID().toString().replaceAll("\\-", "");
            permission.setPermissionId(uuid);
//            permission.setPermissionName(uuid);

            int i = roleManageService.insert(permission); //添加权限信息

            if(i > 0) {
                System.out.println("新增权限成功");
                data.put("success", true);
                data.put("msg", "新增成功");
            } else {
                System.out.println("新增权限失败");
                data.put("success", false);
                data.put("msg", "新增失败");
            }

        } else { //编辑权限
//            permission.setReleaseTime(date);
            int i = roleManageService.updatePermissionInfoByPermissionId(permission);

            if(i > 0) {
                data.put("success", true);
                data.put("msg", "保存成功");
                System.out.println("编辑权限信息成功");
            } else {
                data.put("success", false);
                data.put("msg", "保存失败");
            }
        }
        return data;
    }

    /**
     * 删除权限
     * @param permissionId
     * @return
     */
    @RequestMapping("/deletePermission")
    @ResponseBody
    public Map<String, Object> deletePermission(String permissionId){
        Map<String, Object> result = new HashMap<>();
        int i = roleManageService.deleteByPrimaryKey(permissionId);
        if(i > 0){
            result.put("success", true);
            result.put("msg", "删除权限成功");
        } else {
            result.put("success", false);
            result.put("msg", "删除权限失败");
        }

        return result;
    }

    /**
     * 批量删除权限
     * @param
     * @param
     * @return
     */
    @RequestMapping("/deletePermissionInfos")
    @ResponseBody
    public Object deleteNoticeInfos(String permissionIds, HttpServletResponse response){
        String[] permissionId = permissionIds.split("，");
        int count = 0;
        for(int i = 0; i < permissionId.length; i++){
            roleManageService.deleteByPrimaryKey(permissionId[i]);
            count++;
        }

        System.out.println("成功删除" + count + "条记录");
        Map<String,Object> data = new HashMap<>();
        if(count > 0) {
            data.put("success", true);
            data.put("msg", "批量删除权限 成功");
        } else {
            data.put("success", false);
            data.put("msg", "批量删除权限 失败");
        }
        return data;
    }

    /**
     * 搜索权限
     * @param
     * @return
     */
    @RequestMapping("/searchPermission")
    @ResponseBody
    public String searchPermission(String limit, String page, String permissionName, HttpServletResponse response){
        int count = roleManageService.getPermissionCount(null, null, permissionName); // 获取公告的总数量

        List<S_USER_PERMISSIONS> permissionList = roleManageService.selectAllPermissions(null, null, limit, page, permissionName);
        String permissionListJson = JSON.toJSONString(permissionList);
        String json = "{\"code\":0,\"msg\":\"\",\"count\":" + count + ",\"data\":" + permissionListJson + "}";

        return  json;
    }
//------------------------------------------角色列表-------------------------------------------//
    /**
     * 获取角色列表
     * @param limit
     * @param page
     * @return
     */
    @RequestMapping("/getAllRoles")
    @ResponseBody
    public String getAllRoles(String limit, String page, String roleName){
        int count = roleManageService.getRolesCount(null); // 获取权限的总数量
        List<S_USER_ROLES> roleList = roleManageService.selectAllRoles(limit, page, null); //获取所有权限的信息
        String roleListJson = JSON.toJSONString(roleList); //将对象转换为json
        String json = "{\"code\":0,\"msg\":\"\",\"count\":" + count + ",\"data\":" + roleListJson + "}";
        return json;
    }

    /**
     * 搜索角色
     * @param
     * @return
     */
    @RequestMapping("/searchRole")
    @ResponseBody
    public String searchRole(String limit, String page, String roleName, HttpServletResponse response){
        int count = roleManageService.getRolesCount(roleName); // 获取角色的总数量

        List<S_USER_ROLES> roleList = roleManageService.selectAllRoles(limit, page, roleName);
        String roleListJson = JSON.toJSONString(roleList);
        String json = "{\"code\":0,\"msg\":\"\",\"count\":" + count + ",\"data\":" + roleListJson + "}";

        return  json;
    }

    /**
     * 查看角色权限
     * @param roleId
     * @param model
     * @return
     */
    @RequestMapping("/seeRolePermissions")
    public String seeRolePermissions(String roleId, Model model) {
        S_USER_ROLES role = roleManageService.seeRolePermissions(roleId);
        model.addAttribute("role", role);
        return "/admin/qxgl/seeRolePermissions";
    }

    /**
     * 查看用户角色
     * @param userId
     * @param model
     * @return
     */
    @RequestMapping("/seeUserRoles")
    public String seeUserRoles(String userId, Model model) {
        S_USER user = roleManageService.seeUserRoles(userId);
        model.addAttribute("user", user);
        return "/admin/qxgl/seeUserRoles";
    }

    /**
     * 角色关联权限
     * @param record
     * @return
     */
    @RequestMapping("/giveRolePermission")
    @ResponseBody
    public Map<String, Object> giveRolePermission(S_USER_ROLEPERMISSIONS record){
        Map<String, Object> result = new HashMap<>();
        String uuid = UUID.randomUUID().toString().replaceAll("\\-", "");
        record.setRolePermissionId(uuid);
        int i = roleManageService.giveRolePermission(record);
        if(i > 0){
            result.put("success", true);
        } else {
            result.put("success", false);
        }
        return result;
    }

    /**
     * 角色取消权限
     * @return
     */
    @RequestMapping("/cancelRolePermission")
    @ResponseBody
    public Map<String, Object> cancelRolePermission(String roleId, String permissionId){
        Map<String, Object> result1 = new HashMap<>();
        int j = roleManageService.cancelRolePermission(roleId, permissionId);
        if(j > 0){
            result1.put("success", true);
        } else {
            result1.put("success", false);
        }
        return result1;
    }

    /**
     * 用户关联角色
     * @return
     */
    @RequestMapping("/giveUserRole")
    @ResponseBody
    public Map<String, Object> giveUserRole(String userId, String roleId){
        Map<String, Object> result = new HashMap<>();
        int i = roleManageService.giveUserRole(userId, roleId);
        if(i > 0){
            result.put("success", true);
        } else {
            result.put("success", false);
        }
        return result;
    }

    /**
     * 用户取消角色
     * @return
     */
    @RequestMapping("/cancelUserRole")
    @ResponseBody
    public Map<String, Object> cancelUserRole(String userId, String roleId){
        Map<String, Object> result1 = new HashMap<>();
        int j = roleManageService.cancelUserRole(userId, roleId);
        if(j > 0){
            result1.put("success", true);
        } else {
            result1.put("success", false);
        }
        return result1;
    }
}
