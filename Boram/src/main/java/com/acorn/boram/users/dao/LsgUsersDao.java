package com.acorn.boram.users.dao;

import com.acorn.boram.users.dto.LsgUsersDto;

public interface LsgUsersDao {
	public boolean checkId(String id);
	public void insertUser(LsgUsersDto dto);
	public LsgUsersDto getData(String id);
	public LsgUsersDto isExistUser(LsgUsersDto dto);
	public boolean UpdateUser(LsgUsersDto dto);
}
