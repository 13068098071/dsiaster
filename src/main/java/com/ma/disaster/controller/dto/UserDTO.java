package com.ma.disaster.controller.dto;

import com.ma.disaster.pojo.Menu;
import lombok.Data;

import java.util.List;

/**
 * @author 马志超
 * @date 2022/4/2
 * @Description
 */
@Data
public class UserDTO {
    private String username;
    private String password;
    private String nickname;
    private String avatar;
    private String token;
    private String role;
    private List<Menu> menus;
}
