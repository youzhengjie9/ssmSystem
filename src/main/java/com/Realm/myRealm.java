package com.Realm;

import com.pojo.admin;
import com.service.adminService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import java.util.HashSet;
import java.util.Set;

public class myRealm extends AuthorizingRealm {

    private adminService adminService;

    @Autowired
    @Qualifier("adminServiceImpl")
    public void setAdminService(com.service.adminService adminService) {
        this.adminService = adminService;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
       UsernamePasswordToken usernamePasswordToken= (UsernamePasswordToken)  authenticationToken;
       System.out.println("doGetAuthenticationInfo");
        String id = usernamePasswordToken.getUsername();
        admin admin = adminService.queryOneAdmin(id);
        String realName = this.getName();
        SimpleAuthenticationInfo info=new SimpleAuthenticationInfo(admin.getId(),admin.getPassword(),realName);
        return info;
    }


    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        String princaipal = (String) principalCollection.getPrimaryPrincipal();
        Set<String> roles=new HashSet<>();
        //给一个初始权限
        roles.add("user");
        admin admin = adminService.queryOneAdmin(princaipal);
        int authoid = admin.getAuthority().getAuthoid();
        //给权限
        if(authoid>=2){
            roles.add("admin");
        }
        SimpleAuthorizationInfo info=new SimpleAuthorizationInfo(roles);

        return info;
    }


}
