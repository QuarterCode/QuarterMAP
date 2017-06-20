/*
 * This file is part of QuarterMAP.
 * Copyright (c) 2014 QuarterCode <http://quartercode.com/>
 *
 * QuarterMAP is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * QuarterMAP is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with QuarterMAP. If not, see <http://www.gnu.org/licenses/>.
 */

package com.quartercode.quartermap.action.users;

import java.util.Collections;
import java.util.List;
import com.opensymphony.xwork2.ActionSupport;
import com.quartercode.quartermap.dto.user.User;
import com.quartercode.quartermap.service.UserService;
import lombok.Getter;
import lombok.Setter;

@SuppressWarnings ("serial")
@Getter
@Setter
public class UserListAction extends ActionSupport {

    private final UserService userService = new UserService();

    private List<User>        users;

    @Override
    public String execute() throws Exception {

        users = userService.getUsers();
        Collections.sort(users);

        return SUCCESS;
    }

}
